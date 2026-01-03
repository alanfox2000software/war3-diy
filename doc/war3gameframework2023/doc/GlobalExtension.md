## 触发器相关
```lua
function Yuyuko.CreateTrigger(call_back)end

function Yuyuko.DestroyTrigger(trg)end
```
## id与字符串
```lua
function Yuyuko.ID2String(int_id)end
function Yuyuko.String2ID(str_id)end
```
## Base/Fsm/Procedure/TimeLine/War3Event
```lua
Yuyuko.AsyncExecuter = require "Gameframework.Base.AsyncExecuter"
Yuyuko.Debugger = require "Gameframework.Base.Debugger"
Yuyuko.Time = require "Gameframework.Base.HardwareTimer"
Yuyuko.LinqList = require "Gameframework.Base.LinqList"
Yuyuko.LocalInput = require "Gameframework.Base.LocalInput"
Yuyuko.Log = require "Gameframework.Base.Log"
Yuyuko.RefrencePool = require "Gameframework.Base.RefrencePool"
Yuyuko.ResourceManager = require "Gameframework.Base.ResourceManager"
Yuyuko.TimeLine = require "Gameframework.TimeLine.TimeLine".Create()
Yuyuko.EventManager = require "Gameframework.War3Event.EventManager"
Yuyuko.MoveAssist = require "Gameframework.Base.MoveAssist"
Yuyuko.FsmState = require "Gameframework.Fsm.FsmState"
Yuyuko.Fsm = require "Gameframework.Fsm.Fsm"
Yuyuko.ProcedureBase = require "Gameframework.Procedure.ProcedureBase"
Yuyuko.ProcedureManager = require "Gameframework.Procedure.ProcedureManager"
```

## Types
```lua
Types.Ability = require "Gameframework.Types.Ability"
Types.Circle = require "Gameframework.Types.Circle"
Types.Dialog = require "Gameframework.Types.Dialog"
Types.Effect = require "Gameframework.Types.Effect"
Types.FogModifier = require "Gameframework.Types.FogModifier"
Types.Item = require "Gameframework.Types.Item"
Types.Lightning = require "Gameframework.Types.Lightning"
Types.Multiboard = require "Gameframework.Types.Multiboard"
Types.Player = require "Gameframework.Types.Player"
Types.Point = require "Gameframework.Types.Point"
Types.Rect = require "Gameframework.Types.Rect"
Types.Region = require "Gameframework.Types.Region"
Types.Selector = require "Gameframework.Types.Selector"
Types.TextTag = require "Gameframework.Types.TextTag"
Types.Unit = require "Gameframework.Types.Unit"
```

## Events
```lua
Events.War3PlayerChatEventArgs = require "Gameframework.War3Event.PlayerEvents.PlayerChatEventArgs"
Events.War3PlayerClickButtonEventArgs = require "Gameframework.War3Event.PlayerEvents.PlayerClickButtonEventArgs"
Events.War3PlayerSelectUnitEventArgs = require "Gameframework.War3Event.PlayerEvents.PlayerSelectUnitEventArgs"


Events.War3UnitLearnAbilityEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitLearnAbilityEventArgs"
Events.War3UnitSpellCastEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitSpellCastEventArgs"
Events.War3UnitSpellChannelEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitSpellChannelEventArgs"
Events.War3UnitSpellEffectEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitSpellEffectEventArgs"
Events.War3UnitSpellEndCastEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitSpellEndCastEventArgs"
Events.War3UnitSpellFinishEventArgs = require "Gameframework.War3Event.UnitEvents.Ability.UnitSpellFinishEventArgs"


Events.War3UnitReviveEventArgs = require "Gameframework.War3Event.UnitEvents.Hero.UnitReviveEventArgs"
Events.War3UnitUpgradeEventArgs = require "Gameframework.War3Event.UnitEvents.Hero.UnitUpgradeEventArgs"


Events.War3UnitOrderEventArgs = require "Gameframework.War3Event.UnitEvents.Issuse.UnitOrderEventArgs"
Events.War3UnitOrderPointEventArgs = require "Gameframework.War3Event.UnitEvents.Issuse.UnitOrderPointEventArgs"
Events.War3UnitOrderTargetEventArgs = require "Gameframework.War3Event.UnitEvents.Issuse.UnitOrderTargetEventArgs"


Events.War3UnitDropItemEventArgs = require "Gameframework.War3Event.UnitEvents.Item.UnitDropItemEventArgs"
Events.War3UnitGetItemEventArgs = require "Gameframework.War3Event.UnitEvents.Item.UnitGetItemEventArgs"
Events.War3UnitSoldItemEventArgs = require "Gameframework.War3Event.UnitEvents.Item.UnitSoldItemEventArgs"
Events.War3UnitUseItemEventArgs = require "Gameframework.War3Event.UnitEvents.Item.UnitUseItemEventArgs"


Events.War3UnitGetDamageEventArgs = require "Gameframework.War3Event.UnitEvents.UnitGetDamageEventArgs"
Events.War3UnitEnterRegionEventArgs = require "Gameframework.War3Event.UnitEvents.UnitEnterRegionEventArgs"
Events.War3UnitLeaveRegionEventArgs = require "Gameframework.War3Event.UnitEvents.UnitLeaveRegionEventArgs"
```

## 初始化模块
```lua
Yuyuko.LocalInput.init()
Yuyuko.Debugger.init()
Yuyuko.ResourceManager.init()
Yuyuko.AsyncExecuter.init(game.FRAME * 500)
Yuyuko.MoveAssist.init()
Yuyuko.Fsm.init();

Types.Player.init()
Types.Ability.init()
Types.Point.init()
Types.Rect.init()
```