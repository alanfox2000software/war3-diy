## 框架入口
- 全局定义
```lua
Yuyuko = {}
Types = {}
Events = {}
```
- 加载基础库
```lua
require "Gameframework.Utils.math"
require "Gameframework.GlobalExtension"
require "Gameframework.Utils.Sync"
```
- 注册基础事件
```lua
-- 单位命令事件
RegUnitIssuseTrigger()
-- 单位技能事件
RegUnitAbilityTirgger()
-- 单位物品事件
RegUnitItemTrigger()
-- 英雄单位事件
RegUnitHeroTrigger()
-- 玩家事件
RegPlayerTrigger();
```
- GC
```lua
Yuyuko.TimeLine:Loop(300000 * game.FRAME, function()
    collectgarbage("collect")
    print("gc")
end)
```