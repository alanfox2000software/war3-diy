## lua物编的处理

## 重新生成物编
```lua
-- 重新生成物编
function objmanager.fresh()
    unit_table()

    item_table()

    ability_table()
end

local unit_count = 1
local function unit_table()
    local file = io.open("table/unit.ini", "w")

    for key, value in pairs(yo.ini.unit) do
        local str = "[" .. war3.UnitID(unit_count) .. "]" .. "\n"
        -- single_table 合并多个table的数据
        -- 主要是子级obj和父级obj
        file:write(str .. single_table(value.obj, yo.ini.mt_unit.obj) .. "\n")

        unit_count = unit_count + 1
    end
    file:flush()
end

local function single_table(obj_table, base_table)
    -- 物编的数据类型简单处理
    local function serialize(_key, _value)
        local line
        if type(_value) == "string" then
            line = ("%s = [[%s]]"):format(_key, _value)
        elseif type(_value) == "table" then
            local _value = war3.copy_table(_value, {})
            for index, value in ipairs(_value) do
                if type(value) == "string" then
                    _value[index] = string.format([["%s"]], value)
                end
            end
            line = _key .. " = {" .. table.concat(_value, ", ") .. "}"
        else
            line = _key .. " = " .. _value
        end
        return line
    end

    local str = ""
    -- 复制baseTable的数据到objTable
    for key, value in pairs(base_table) do
        if (key ~= "__index") and (key ~= "ID") then
            local line
            if obj_table[key] then
                line = serialize(key, obj_table[key])
            else
                line = serialize(key, base_table[key])
            end
            str = str .. line .. "\n"
        end
    end
    return str
end
```
## 物编对应id