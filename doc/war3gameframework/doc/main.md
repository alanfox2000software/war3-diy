## main
- main函数加载`shortcut`
```lua
local function main()

    -- 全局快捷方式
    require "shortcut"

    -- 重新生成物编(成品在魔兽根目录，替换工程同名文件重新打包后生效)
    -- yo.objmanager.fresh()

    -- -- 0显示英雄头像，1隐藏英雄头像
    -- japi.EXSetUnitInteger(war3.string2id("H000"), 47, 0)
end
-- 初始化框架代码
main()
```
- 自定义代码
```lua
yo.player.get(2):set_alliance_simple(yo.player.get(1), false)
-- ...
```