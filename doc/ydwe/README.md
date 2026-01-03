## ydwe的魔兽环境
- ydwe的开发时japi与客户端的运行时japi存在差异


## ydwe的魔兽环境流程
1. 启动客户端并加载地图
   1. 1.31使用`ydweconfig.exe -launchwar3`
   2. 1.32使用`ydwe -war3`
2. LaunchWarcraft3.cpp
   1. `launch_warcraft3`读取配置项
```c++
base::ini::table table;
table["MapTest"]["LaunchRenderingEngine"] = "Direct3D 8";
table["MapTest"]["LaunchWindowed"] = "1";
table["MapTest"]["UserName"] = "";
table["MapTest"]["EnableMapSlk"] = "0";
try {
    auto buf = base::file::read_stream(ydwe / L"bin" / L"EverConfig.cfg").read<std::string>();
    base::ini::read(table, buf.c_str());
}
catch (...) {
}
```
    2. 打包地图
```c++
if (cmd.has(L"loadfile"))
{
    fs::path loadfile = cmd[L"loadfile"];

    // war3将非.w3g后缀名的文件当地图处理
    if (!base::path::equal(loadfile.extension(), L".w3g"))
    {
        fs::path test_map_path = get_test_map_path() + L".w3x";
        try {
            cmd[L"loadfile"] = test_map_path.wstring();
            if (!loadfile.is_absolute()) {
                loadfile = war3_path / loadfile;
            }
            if (cmd.has(L"closew2l")) {
                fs::copy_file(loadfile, war3_path / test_map_path, fs::copy_options::overwrite_existing);
            }
            else {
                map_build(ydwe, loadfile, war3_path / test_map_path, "0" != table["MapTest"]["EnableMapSlk"]);
            }
        }
        catch (...) {
        }
    }
}
```
    3. 启动客户端并注册api
```c++
war3_path = war3_path / L"war3.exe";
fs::path inject_dll = ydwe / L"bin" / L"LuaEngine.dll";
```
3. `script\war3\main.lua`
   1. 注册dll插件到游戏
```lua
hook.iat('int(__stdcall*)(const char*)', 'War3.exe', 'kernel32.dll', 'LoadLibraryA', function (rLoadLibraryA, dllname)
    dllname = ffi.string(dllname)
    log.info('LoadLibraryA', dllname)
    if dllname:lower() == 'game.dll' then
        local lib
        if patch then
            lib = ll.load_library(patch / 'game.dll')
            storm.open(patch / 'patch.mpq', 9)
        end
        if not lib then
            lib = rLoadLibraryA(dllname)
        end
        event.emit_once('GameDll加载', lib)
        return lib
    end
    return rLoadLibraryA(dllname)
end)

event.on('GameDll加载', function ()
    hook.iat('int(__stdcall*)(int,const char*, const char*,int,int,int,int,int,int,int,int,int)', 'Game.dll', 'user32.dll', 'CreateWindowExA', function    (rCreateWindowExA, dwExStyle, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
        lpClassName = ffi.string(lpClassName)
        lpWindowName = ffi.string(lpWindowName)
        local res = rCreateWindowExA(dwExStyle, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
        if lpClassName == 'Warcraft III' and lpWindowName == 'Warcraft III' then
            event.emit_once('窗口初始化', res)
        end
        return res
    end)
end)

event.on('GameDll加载', function ()
    ll.load_library(fs.ydwe_path() / 'plugin' / 'warcraft3' / 'yd_loader.dll')
    local war3 = require 'war3patch'
    war3.remove_sizelimit()
end)

event.on('GameDll加载', function ()
    local plugin = fs.ydwe_path() / "plugin" / "warcraft3"
    local cfg = sys.ini_load(plugin / 'config.cfg')
    local libs = {}
    for file in plugin:list_directory() do	
        if not fs.is_directory(file) 
        and file:filename():string():lower() ~= 'yd_loader.dll'
        and file:extension():string():lower() == '.dll'
        and (not cfg or cfg.Enable[file:filename():string()] ~= '0')
        then
            libs[#libs+1] = ll.load_library(file)
        end
    end
    for _, lib in ipairs(libs) do
        local init = ll.get_proc_address(lib, 'Initialize', 'void(__stdcall*)()')
        if init then
            init()
        end
    end
end)
```