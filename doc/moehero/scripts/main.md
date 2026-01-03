## main
- 框架的初始化


## 重载print
```lua
local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end
```

## 框架初始化
```lua
local function main()end
main()
```
1. 基础的函数注册
```lua
require 'war3.id'
require 'war3.api'
require 'util.log'
require 'ac.init'
require 'util.error'

local runtime = require 'jass.runtime'
if runtime.perftrace then
    runtime.perftrace()
    ac.loop(10000, function()
        log.info('perftrace', runtime.perftrace())
    end)
end
```
2. 物编数据的导入
```lua
ac.lni_loader('unit')
```
3. 游戏对象的导入
```lua
local rect		= require 'types.rect'
local circle	= require 'types.circle'
local region	= require 'types.region'
local effect	= require 'types.effect'
local fogmodifier	= require 'types.fogmodifier'
local move		= require 'types.move'
local unit		= require 'types.unit'
local attribute	= require 'types.attribute'
local hero		= require 'types.hero'
local damage	= require 'types.damage'
local heal		= require 'types.heal'
local mover		= require 'types.mover'
local follow	= require 'types.follow'
local texttag	= require 'types.texttag'
local lightning	= require 'types.lightning'
local path_block	= require 'types.path_block'
local item		= require 'types.item'
local game		= require 'types.game'
local shop		= require 'types.shop'
local sound		= require 'types.sound'
local sync		= require 'types.sync'
local response	= require 'types.response'
local record	= require 'types.record'
```

3. 框架初始化
```lua
rect.init()
damage.init()
move.init()
unit.init()
hero.init()
effect.init()
mover.init()
follow.init()
lightning.init()
texttag.init()
shop.init()
path_block.init()
game.init()


game.register_observer('hero move', move.update)
game.register_observer('mover move', mover.move)
game.register_observer('path_block', path_block.update)
game.register_observer('follow move', follow.move)
game.register_observer('lightning', lightning.update)
game.register_observer('texttag', texttag.update)
game.register_observer('mover hit', mover.hit)
```

4. 加载地图
```lua
--测试
require 'test.init'

--游戏
local map = require 'maps.map'

--保存预设单位
unit.saveDefaultUnits()

map.init()

--加载热补丁
require 'types.hot_fix'

--require 'test.sound'
local jass = require 'jass.common'
jass.SetMapFlag(8192 * 2, true)
```