## MapPlugin
- 英萌二代

## 流程
- `w3x2lni`插件注入lua
```lua
local function injectJass(w2l, buf)
    if not buf then
        return nil
    end
    local start, finish = buf:find('function main takes nothing returns nothing', 1, true)
    local bufs = {}
    bufs[#bufs+1] = buf:sub(1, start-1)
    bufs[#bufs+1] = [[
        //Lua 引擎开始\r\n
        function War3LuaMapPlugin takes nothing returns nothing
            call Cheat("exec-lua:_luapath")
            call Cheat("exec-lua:_currentpath")
            call Cheat("exec-lua:ac")
            call Cheat("exec-lua:main")
        endfunction
        //Lua 引擎结束
]]
    bufs[#bufs+1] = buf:sub(start, finish)
    bufs[#bufs+1] = '\r\ncall ExecuteFunc("War3LuaMapPlugin")'
    bufs[#bufs+1] = buf:sub(finish+1)
    return table.concat(bufs)
end
```

## 加载框架代码
```lua
call Cheat("exec-lua:ac")
```
## 加载地图代码
```lua
call Cheat("exec-lua:main")
```