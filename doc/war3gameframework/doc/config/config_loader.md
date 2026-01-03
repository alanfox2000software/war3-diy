## config_loader
- 配置文件
```lua
yo.init = {
    mt_unit = {},
    mt_ability = {},
    mt_item = {},

    unit = {},
    ability = {},
    item = {},
    destruct = {},
    state = {},
    
}
```
- 单位配置
```lua
require "config.unit.敌机.熊王.init"
require "config.unit.自机.魂魄妖梦.幽人的庭师.init"
```
- 技能配置
```lua
yo.ini.ability = {
    xx = {}
}
```
- 物品配置
```lua
require "config.item.兽王之鼓"
```
