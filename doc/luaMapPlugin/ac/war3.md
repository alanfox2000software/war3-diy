## war3
- 初始化
```lua
local function start()
    -- 分发war3事件
    initEvent()
    -- 根据unit表注册地图上的预设单位
    searchPresetUnits()
    -- 注册任意单位受伤事件
    initDamage()
    -- 启动计时器，开始tick
    startTimer()
end

-- 在1帧后开始游戏逻辑
jass.TimerStart(jass.CreateTimer(), 0.0, false, start)
```

## initEvent
```lua
return function ()
    local trg = jass.CreateTrigger()
    for i = 0, 15 do
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.Selected, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.Deselected, nil)
        jass.TriggerRegisterPlayerChatEvent(trg, jass.Player(i), '', false)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.Level, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.Order, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.PointOrder, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.TargetOrder, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.PickUpItem, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.PawnItem, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.DropItem, nil)
        jass.TriggerRegisterPlayerUnitEvent(trg, jass.Player(i), EVENT.Attacked, nil)
        jass.TriggerRegisterPlayerEvent(trg, jass.Player(i), EVENT.Leave)
    end
    jass.TriggerAddCondition(trg, jass.Condition(function ()
        local eventId = jass.GetTriggerEventId()
        if CallBack[eventId] then
            CallBack[eventId]()
        end
    end))
end
```
## 查找预设单位
```lua
local function searchPresetUnits()
    local g = jass.CreateGroup()
    for i = 0, 15 do
        jass.GroupEnumUnitsOfPlayer(g, jass.Player(i), nil)
        while true do
            local u = jass.FirstOfGroup(g)
            if u == 0 then
                break
            end
            jass.GroupRemoveUnit(g, u)
            ac.unit(u)
        end
    end
    jass.DestroyGroup(g)
end
```

## 初始化伤害事件
```lua
return function ()
    createTrigger()
    ac.loop(600, function ()
        createTrigger()
    end)
    ac.game:event('单位-初始化', function (_, u)
        jass.TriggerRegisterUnitEvent(Trg, u._handle, 52) -- EVENT_UNIT_DAMAGED
    end)
end
```
## 启动计时器
```lua
local function startTimer()
    local jTimer = jass.CreateTimer()
    dbg.handle_ref(jTimer)
    jass.TimerStart(jTimer, FRAME, true, function ()
        ac.world.update(FRAME)
    end)
end
```