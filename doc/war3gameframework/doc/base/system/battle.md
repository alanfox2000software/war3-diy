## 战斗系统

- 给所有单位注册的被伤害事件
```lua
function battle.init()
    local trig = war3.CreateTrigger(function()
        local s = ("%s被攻击"):format(yo.unit.j_unit(jass.GetTriggerUnit()))

        print(s)
    end)

    local t = yo.unit.all_unit

    for _, _unit in pairs(t) do
        jass.TriggerRegisterUnitEvent(trig, _unit._handle,
                                      jass.EVENT_UNIT_DAMAGED)
    end
end
```