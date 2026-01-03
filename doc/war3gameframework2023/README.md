## War3GameFramework
https://github.com/yuyuko-C/War3GameFramework

## 流程
1. map/war3map.j
- 加载执行lua.base
```jass
function Base___Init takes nothing returns nothing
    call Cheat("exec-lua:lua.base")
endfunction
```
2. lua/base.lua
- 加载lua框架 并初始化
```lua
-- 加载scripts/main.lua的init函数
local function init() require 'main' end
-- 调用init函数
xpcall(init, function(msg) print(msg, '\n', debug.traceback()) end)
```
3. scripts/main.lua
- 加载框架入口
```lua
local jass = require "jass.common"
local japi = require "jass.japi"
local slk = require "jass.slk"
local message = require "jass.message"
local console = require "jass.console"

local std_print = print
function print(...) std_print(('[%.3f]'):format(os.clock()), ...) end

-- 框架初始化
require "Gameframework.GameframeworkEntry"
```