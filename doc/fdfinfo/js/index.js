const fs = require("fs");
const path = require("path");

class fdfParse {
    constructor() {
        // Demo信息
        this.TextureDemo = [];
        this.StringDemo = [];
        this.FrameDemo = [];
        this.LayerDemo = []
        this.FieldsDemo = [];

        this.FrameTypeAndStringName = {
            frameType: [],
            stringName: []
        };
        this.FrameFields = [];
    }
    setFile(filePath) {
        this.inputFile = filePath;
        this.outPath = path.join(
            __dirname,
            "/out/",
            this.inputFile.replace(".fdf", ".json")
        );
        this.init();
    }
    init() {
        this.frameId = 0;
        this.isComment = true;
        this.isFrame = false;
        this.isTexture = false;
        this.isField = false;
        // 文件信息
        this.frames = [];
        this.frameStack = [];
    }
    parseFile(content) {
        l("file-----------------------")
        l("file", this.inputFile);
        l("file-----------------------")

        content.split(/[\r\n]/)
            .filter(i => i)
            .map(line => {
                return this.parseLine(line);
            });

        writeToFile(
            this.outPath,
            JSON.stringify(this.frames, "", 4),
            (err) => {
                if (err) {
                    l("write error", err)
                } else {
                    l("ok");
                }
            })
    }
    parseLine(line) {

        //拆分
        let lineContent = line.split(/\s+/)
            .filter(i => i)
            .map(d => d.replace(/["]/g, ""));

        // 空格
        if (lineContent.length == 0) {
            return;
        }

        if (lineContent[0] == "/*") { //多行注释开始
            this.isComment = true;
            return;
        }
        if (this.isComment && line.includes("*/")) { //多行注释结束
            this.isComment = false;
            return;
        }

        if (lineContent[0] && lineContent[0].includes("//")) { //单行注释
            // 注释
            return;
        }

        if (lineContent[0] == "IncludeFile") {
            // 依赖文件
            return;
        }

        let statrKeyword = ["Texture", "String", "Frame", "Layer"];

        if (lineContent[lineContent.length - 1] == "{"
            && statrKeyword.indexOf(lineContent[0]) > -1) { //块开始

            this.isFrame = true;
            let currentFrame;
            switch (lineContent[0]) {
                case "Frame":
                    currentFrame = {
                        fid: this.frameId,
                        type: lineContent[1],
                        name: lineContent[2],
                        inherits: lineContent[3] == "INHERITS"
                            ? lineContent[4] == "WITHCHILDREN"
                                ? lineContent[5]
                                : lineContent[4]
                            : "",
                        fields: [],
                        child: []
                    }
                    // 收集frame信息
                    let frameDemoIndex = this.FrameDemo.findIndex(
                        d => d.type == lineContent[1]
                    );
                    if (frameDemoIndex == -1) {
                        this.FrameDemo.push({
                            type: lineContent[1],
                            demos: [
                                {
                                    name: lineContent[2],
                                    file: path.basename(this.inputFile)
                                }
                            ]
                        })
                    }else{
                        this.FrameDemo[frameDemoIndex]["demos"].push({
                            name: lineContent[2],
                            file: path.basename(this.inputFile)
                        })
                    }

                    // FrameType
                    if (this.FrameTypeAndStringName.frameType.indexOf(lineContent[1]) == -1) {
                        this.FrameTypeAndStringName.frameType.push(lineContent[1]);
                    }
                    break;
                case "String": case "Texture":
                    currentFrame = {
                        fid: this.frameId,
                        type: lineContent[0],
                        name: lineContent[1] == "INHERITS"
                            ? ""
                            : lineContent[1],
                        inherits: lineContent[1] == "INHERITS"
                            ? lineContent[2]
                            : lineContent[2] == "INHERITS"
                                ? lineContent[3]
                                : "",
                        fields: [],
                        child: []
                    }
                    if (lineContent[0] == "String") {
                        this.StringDemo.push({
                            name: currentFrame.name,
                            file: path.basename(this.inputFile),
                        })
                        // String
                        if (this.FrameTypeAndStringName.stringName.indexOf(currentFrame.name) == -1) {
                            this.FrameTypeAndStringName.stringName.push(currentFrame.name);
                        }
                    }
                    if (lineContent[0] == "Texture") {
                        if (this.TextureDemo.indexOf(path.basename(this.inputFile)) == -1) {
                            this.TextureDemo.push(path.basename(this.inputFile))
                        }
                    }
                    break;
                case "Layer":
                    currentFrame = {
                        fid: this.frameId,
                        type: lineContent[0],
                        name: lineContent[1],
                        fields: [],
                        child: []
                    }
                    // LayerDemo
                    this.LayerDemo.push({
                        type: "Layer",
                        demo: lineContent.join(" "),
                        file: path.basename(this.inputFile),
                    })
            }
            this.frameId = this.frameId + 1;
            //挂载到上级
            if (this.frameStack.length > 0) { //多层嵌套
                let parentFrame = this.frameStack[this.frameStack.length - 1];
                parentFrame.child.push(currentFrame);
            }

            this.frameStack.push(
                currentFrame
            );
            return;
        }
        // 块结束
        if (lineContent[0] == "}") {
            // 删除最后一个
            let currentFrame = this.frameStack.splice(this.frameStack.length - 1, 1);

            if (this.frameStack.length == 0) {
                this.frames.push(currentFrame);
            }
            return;
        }

        // fields
        if (this.isFrame) {
            let currentFrame = this.frameStack[this.frameStack.length - 1];
            let [fieldName, ...fieldArg] = lineContent;
            currentFrame.fields.push({ type: "Field", name: fieldName, child: fieldArg });

            // 检查是否已添加
            let demoIndex = this.FieldsDemo.findIndex(d => {
                return d.frame == currentFrame.type && d.field == fieldName
            });
            if (demoIndex > -1) {
                this.FieldsDemo[demoIndex].demos.push(
                    {
                        demo: lineContent.join(" "),
                        raw: line.trim(),
                        file: path.basename(this.inputFile)
                    }
                )
            } else {
                this.FieldsDemo.push({
                    frame: currentFrame.type,
                    field: fieldName,
                    demos: [
                        {
                            demo: lineContent.join(" "),
                            raw: line.trim(),
                            file: path.basename(this.inputFile)
                        }
                    ]
                })
            }
            // frameFields收集
            let findIndex = this.FrameFields.findIndex(
                d => d.frame == currentFrame.type
            );
            if (findIndex == -1) {
                this.FrameFields.push({ frame: currentFrame.type, fields: [fieldName] })
            } else {
                if (this.FrameFields[findIndex]["fields"].indexOf(fieldName) == -1) {
                    this.FrameFields[findIndex]["fields"].push(fieldName);
                }
            }
        }

        return;
    }


}

function l(...msg) {
    console.log(msg);
}

function t(...msg) {
    console.table(msg)
}
// testParse();
function testParse() {
    const parse = new fdfParse();
    let filePath = "./UI/AllianceDialog.fdf";
    fs.readFile(filePath, "utf8", (err, data) => {
        if (err) {
            console.log("err", err)
        }
        parse.setFile(filePath);
        parse.parseFile(data);
    })
}

parseFdf();
function parseFdf() {
    let fdfDir = ["./UI", "./Glue"];
    const parse = new fdfParse();
    let dirOk = 0;
    fdfDir.forEach(v => {
        fs.readdir(v, (err, files) => {
            if (!err) {
                l("d", v, files);
                let fileNum = files.length;
                let overNum = 0;
                files.forEach(file => {
                    let filePath = v + "/" + file;
                    fs.readFile(filePath, "utf8", (err, data) => {
                        if (err) {
                            console.log("err", err)
                        }
                        parse.setFile(filePath);
                        parse.parseFile(data);
                        overNum = overNum + 1;
                        if (overNum == fileNum) {
                            dirOk = dirOk + 1;
                            l("ok", v, dirOk);
                            if (dirOk == fdfDir.length) {
                                //写入demo
                                writeToFile(
                                    path.join(__dirname, "./demo/FrameDemo.json")
                                    , JSON.stringify(parse.FrameDemo, "", 4), (err) => {
                                        if (!err) {
                                            l("ok", "FrameDemo")
                                        } else {
                                            l("err FrameDemo", err)
                                        }
                                    });
                                writeToFile(
                                    path.join(__dirname, "./demo/StringDemo.json")
                                    , JSON.stringify(parse.StringDemo, "", 4), (err) => {
                                        if (!err) {
                                            l("ok", "StringDemo")
                                        } else {
                                            l("err StringDemo", err)
                                        }
                                    })
                                writeToFile(
                                    path.join(__dirname, "./demo/TextureDemo.json")
                                    , JSON.stringify(parse.TextureDemo, "", 4), (err) => {
                                        if (!err) {
                                            l("ok", "TextureDemo")
                                        } else {
                                            l("err TextureDemo", err)
                                        }
                                    })
                                writeToFile(
                                    path.join(__dirname, "./demo/FieldsDemo.json")
                                    , JSON.stringify(parse.FieldsDemo, "", 4), (err) => {
                                        if (!err) {
                                            l("ok", "FieldsDemo")
                                        } else {
                                            l("err FieldsDemo", err)
                                        }
                                    })

                                writeToFile(
                                    path.join(__dirname, "./demo/FrameTypeAndStringName.json")
                                    , JSON.stringify(parse.FrameTypeAndStringName, "", 4), (err) => {
                                        if (!err) {
                                            l("ok", "FrameTypeAndStringName")
                                        } else {
                                            l("err FrameTypeAndStringName", err)
                                        }
                                    })

                                writeToFile(
                                    path.join(__dirname, "./demo/FrameFields.json")
                                    , JSON.stringify(parse.FrameFields, "", 2), (err) => {
                                        if (!err) {
                                            l("ok", "FrameFields")
                                        } else {
                                            l("err FrameFields", err)
                                        }
                                    })

                            }
                        }
                    })
                })
            }
        })
    })
}



const writeToFile = function (path, buffer, callback) {
    let lastPath = path.substring(0, path.lastIndexOf("\\"));
    console.log("out", path, lastPath);
    fs.mkdir(lastPath, { recursive: true }, (err) => {
        if (err) return callback(err);
        fs.writeFile(path, buffer, function (err) {
            if (err) return callback(err);
            return callback(null);
        });
    });
}
