## 英萌框架
- [MoeHero](https://github.com/actboy168/MoeHero)


## 流程
- `war3map.j`加载`lua.base`
```
function Base__Init takes nothing returns nothing
    call Cheat("exec-lua:lua.base")
endfunction
```
- `lua.base.lua`加载`main.lua`
- lua脚本加载依赖于`w3x2lni/plugin/本地脚本.lua` 不是很好的处理方法
```lua
if not w2l:file_load('map', 'lua\\currentpath.lua') then
    -- 在map\lua中生成currentpath.lua包含scripts路径
    w2l:file_save('map', 'lua\\currentpath.lua', currentpath:format((w2l.setting.input / 'scripts'):string()):gsub('\\', '\\\\'))
    local buf = inject_jass(w2l, w2l:file_load('map', 'war3map.j'))
    if buf then
        w2l:file_save('map', 'war3map.j', buf)
    end
    local buf = inject_jass(w2l, w2l:file_load('map', 'scripts\\war3map.j'))
    if buf then
        w2l:file_save('map', 'scripts\\war3map.j', buf)
    end
end
```

## 框架结构
```
scripts\
    ac\        基础
    maps\      地图内容
    table\     物编
    types\     游戏封装
    util\      工具
    war3\      基础
```