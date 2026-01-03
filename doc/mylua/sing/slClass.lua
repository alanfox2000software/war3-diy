    
---@type table
Classes = Classes or {}

---@protected
---@param this Object
---@param name string
---@param method string
function CLink(this, name, method, ...)
    if (name == nil or method == nil) then
        return
    end
    return Class(name).public().get(method)(this, ...)
end

---@param name table|string
---@return Class
function Class(name)

    if (type(name) == "table") then
        name = name.__NAME__
    end
    if (type(name) ~= "string") then
        return
    end
    ---@class Class
    local this = Classes[name]
    if (this == nil) then
        this = {
            ---@private
            __NAME__ = name,
            ---@private
            __INHERIT__ = nil,
            ---@private
            __CONSTRUCT__ = nil,
            ---@private
            __INITIAL__ = nil,
            ---@private
            __PUBLIC__ = nil,
            ---@private
            __PRIVATE__ = nil,
            ---@private
            __FACADES__ = Array(),
            ---@private
            __DESTROY__ = nil,
            ---@private
            __EXEC__ = nil,
            ---@private
            __FORMATTER__ = nil,
            ---@private
            __LIMITER__ = nil,
        }
        Classes[name] = this

        ---@type fun():string
        this.name = function()
            return this.__NAME__
        end

        ---@type fun():Array
        this.facades = function()
            return this.__FACADES__
        end

        ---@type fun(modify:function):self
        this.inherit = function(modify)
            if (type(modify) == "string") then
                this.__INHERIT__ = modify
                return this
            end
            return this.__INHERIT__
        end

        ---@type fun(modify:function):self
        this.construct = function(modify)
            if (type(modify) == "function") then
                this.__CONSTRUCT__ = modify
                return this
            end
            return this.__CONSTRUCT__
        end

        ---@type fun(key:string,modify:fun(this:self,result:any):void):self|Array
        this.public = function(key, modify)
            if (type(key) == "string" and type(modify) == "function") then
                if (this.__PUBLIC__ == nil) then
                    this.__PUBLIC__ = Array()
                end
                this.__PUBLIC__.set(key, modify)
                return this
            end
            return this.__PUBLIC__
        end

        ---@type fun(key:string,modify:fun(this:self,result:any):void):self|Array
        this.private = function(key, modify)
            if (type(key) == "string" and type(modify) == "function") then
                if (this.__PRIVATE__ == nil) then
                    this.__PRIVATE__ = Array()
                end
                this.__PRIVATE__.set(key, modify)
                return this
            end
            return this.__PRIVATE__
        end

        ---@type fun(modify:function):self
        this.initial = function(modify)
            if (type(modify) == "function") then
                this.__INITIAL__ = modify
                return this
            end
            return this.__INITIAL__
        end

        ---@type fun(modify:function):self
        this.destroy = function(modify)
            if (type(modify) == "function") then
                this.__DESTROY__ = modify
                return this
            end
            return this.__DESTROY__
        end

        ---@type fun(key:string,modify:fun(this:self,result:any):void):self|Array
        this.exec = function(key, modify)
            if (type(key) == "string" and type(modify) == "function") then
                if (this.__EXEC__ == nil) then
                    this.__EXEC__ = Array()
                end
                this.__EXEC__.set(key, modify)
                return this
            end
            return this.__EXEC__
        end

        ---@type fun(key:string,modify:fun(value:number):number):self|table
        this.formatter = function(key, modify)
            if (type(key) == "string" and type(modify) == "function") then
                if (this.__FORMATTER__ == nil) then
                    this.__FORMATTER__ = {}
                end
                this.__FORMATTER__[key] = modify
                return this
            end
            return this.__FORMATTER__
        end

        ---@type fun(key:string,modify:fun(this:self,value:number):number):self|table
        this.limiter = function(key, modify)
            if (type(key) == "string" and type(modify) == "function") then
                if (this.__LIMITER__ == nil) then
                    this.__LIMITER__ = {}
                end
                this.__LIMITER__[key] = modify
                return this
            end
            return this.__LIMITER__
        end

    end

    return this
end


    
---@param this Object
function Inherit(this, options)
    local inh = {}
    local c = Class(this)
    local afterInitial = c.afterInitial
    while (c ~= nil) do
        table.insert(inh, c.name())
        if (c.inherit() == nil) then
            break
        end
        c = Class(c.inherit())
    end
    for i = 1, #inh, 1 do
        local construct = Class(inh[i]).construct()
        if (construct ~= nil) then
            construct(this, options)
        end
    end
    for i = #inh, 1, -1 do
        Method(this, inh[i])
    end
    for i = #inh, 1, -1 do
        local initial = Class(inh[i]).initial()
        if (initial ~= nil) then
            initial(this)
        end
    end
    PropReExec(this)
    if (afterInitial ~= nil) then
        afterInitial(this)
    end
end

---@param this Object
function Method(this, name)
    if (name == nil) then
        return
    end
    if (this.__NAME__ == name) then
        local private = Class(name).private()
        if (private ~= nil) then
            private.forEach(function(key, value)
                this[key] = function(...) return value(this, ...) end
            end)
        end
    end
    local public = Class(name).public()
    if (public ~= nil) then
        public.forEach(function(key, value)
            this[key] = function(...) return value(this, ...) end
        end)
    end
    Class(this).facades().set(this.__ID__, 1)
end

---@param name string
---@param options {protect:boolean,static:boolean|string[]}
---@return Object
function Object(name, options)
    must(name ~= nil)
    local protect = false
    local static
    if (options ~= nil) then
        if (type(options.protect) == "boolean") then
            protect = options.protect
        end
        if (type(options.static) == "table" and #options.static == 2) then
            static = options.static
        end
    end
    if (static ~= nil) then
        local tc = bop.static[static[1] .. static[2]]
        if (tc ~= nil) then
            return tc
        end
    end

    ---@class Object
    local this = {
        ---@protected
        __HANDLE__ = nil,
        ---@protected
        __STATIC__ = static,
        ---@protected
        __PROTECT__ = protect,
        ---@protected
        __NAME__ = name,
        ---@protected
        __ID__ = bopID(name),
        ---@protected
        __PROP__ = {}, -- 静态，保存[固定]数值
    }

    bop.i2o[this.__ID__] = this

    if (this.__STATIC__ ~= nil) then
        bop.static[this.__STATIC__[1] .. this.__STATIC__[2]] = this
    end

    ---@type fun():string|nil
    this.id = function()
        return this.__ID__
    end

    ---@return boolean
    this.isDestroy = function()
        return bop.i2o[this.__ID__] == nil
    end

    ---@type fun(delay:number):void
    this.destroy = function(delay)
        if (this.__PROTECT__ == true) then
            print(this.__ID__ .. "IsProtecting")
            return
        end
        delay = delay or 0
        if (delay < 0) then
            delay = 0
        end
        local cls = function()
            href(this, nil)
            if (this.__STATIC__ ~= nil) then
                bop.static[this.__STATIC__[1] .. this.__STATIC__[2]] = nil
            end
            local c = Class(this)
            while (c ~= nil) do
                local dy = c.destroy()
                if (type(dy) == "function") then
                    dy(this)
                end
                if (c.inherit() == nil) then
                    break
                end
                c = Class(c.inherit())
            end
            Class(this).facades().set(this.__ID__, nil)
            bop.i2o[this.__ID__] = nil
        end
        if (delay == 0) then
            cls()
        else
            time.setTimeout(delay, function(_)
                cls()
            end)
        end
    end

    --- 内部参
    ---@type fun(key:string,modify:any,duration:number|nil):self|any|nil
    this.prop = function(key, modify, duration)
        if (type(duration) ~= "number") then
            duration = 0
        end
        if (type(modify) == "string") then
            local durc = string.explode(";", modify)
            if (#durc == 2) then
                local durc2 = tonumber(durc[2])
                if (type(durc2) == "number") then
                    duration = math.max(0, durc2)
                    modify = durc[1]
                end
            end
        end
        return Prop(this, key, modify, duration)
    end

    --- 增幅，作用于[修改过程]的[改变]数值的增减
    ---@type fun(key:string,modify:number,duration:number|nil):self|any|nil
    this.raise = function(key, modify, duration)
        local rKey = "<RAISE>" .. key
        if (modify) then
            return this.prop(rKey, modify, duration)
        end
        return this.prop(rKey) or 0
    end

    --- 突变，作用于[获取时]的[终结]数值的突破增减
    ---@type fun(key:string,modify:number,duration:number|nil):self|any|nil
    this.mutation = function(key, modify, duration)
        local mKey = "<MUTATION>" .. key
        if (modify) then
            return this.prop(mKey, modify, duration)
        end
        return this.prop(mKey) or 0
    end

    --- 叠加态，用于[判断时]叠加[结果]数值间的判断关系
    ---@type fun(key:string,modify:number,duration:number|nil):self|any|nil
    this.superposition = function(key, modify, duration)
        local sKey = "<SUPERPOSITION>" .. key
        if (modify) then
            return this.prop(sKey, modify, duration)
        end
        return this.prop(sKey) or 0
    end

    Inherit(this, options)
    return this
end


    
---@protected
---@param this Object
---@param key string
---@param value any
function PropLimit(this, key, value)
    local c = Class(this)
    while (c ~= nil) do
        local limiter = c.limiter()
        if (limiter ~= nil and type(limiter[key]) == "function") then
            value = limiter[key](this, value)
            break
        end
        if (c.inherit()) then
            c = Class(c.inherit())
        else
            c = nil
        end
    end
    return value
end

---@protected
---@param this Object
---@param key string
---@param futureValue any
function PropExec(this, key, futureValue)
    if (futureValue == nil) then
        return
    end
    local c = Class(this)
    while (c ~= nil) do
        local exec = c.exec()
        if (isArray(exec)) then
            local execFunc = exec.get(key)
            if (type(execFunc) == "function") then
                execFunc(this, PropLimit(this, key, futureValue))
                break
            end
        end
        if (c.inherit()) then
            c = Class(c.inherit())
        else
            c = nil
        end
    end
end

---@protected
---@param this Object
function PropReExec(this)
    local c = Class(this)
    local exec = c.exec()
    if (isArray(exec)) then
        local eks = exec.keys()
        for _, k in ipairs(eks) do
            PropExec(this, k, PropValue(this, k))
        end
    end
end

---@protected
---@param this Object
---@param key string
function PropValue(this, key, std, dyn)
    if (key == nil) then
        return
    end
    local aid = tostring(async.index)
    if (this.__PROP__ == nil) then
        error("propValue is nil", this.id())
        return
    end
    if (this.__PROP__[aid] ~= nil) then
        if (std == nil) then
            std = this.__PROP__[aid].std[key]
        end
        if (dyn == nil) then
            dyn = this.__PROP__[aid].dyn[key]
        end
    end
    if (this.__PROP__["0"] ~= nil) then
        if (std == nil) then
            std = this.__PROP__["0"].std[key]
        end
        if (dyn == nil) then
            dyn = this.__PROP__["0"].dyn[key]
        end
    end
    if (std == NIL) then
        std = nil
    end
    if (dyn == NIL) then
        dyn = nil
    end
    local val = std
    if (dyn ~= nil) then
        if (type(dyn) == "number") then
            val = (val or 0) + dyn
        else
            val = dyn
        end
    end
    return val
end

---@protected
function PropChange(this, key, space, setVal, isExec)
    if (type(isExec) ~= "boolean") then
        isExec = true
    end
    local aid = tostring(async.index)
    if (this.__PROP__[aid] == nil) then
        this.__PROP__[aid] = { std = {}, dyn = {} }
    end
    local oldVal = PROP(this, key)
    local newVal
    if (space == "std") then
        newVal = PropValue(this, key, setVal, nil)
    elseif (space == "dyn") then
        newVal = PropValue(this, key, nil, setVal)
    else
        return
    end
    local updated = (false == datum.equal(oldVal, newVal))
    if (updated) then
        if (event.propChange(key)) then
            event.trigger(this, EVENT.Prop.BeforeChange, {
                triggerObject = this,
                key = key,
                old = oldVal,
                new = newVal,
            })
        end
        if (isExec and newVal ~= nil) then
            PropExec(this, key, newVal)
        end
    end
    if (setVal == NIL) then
        setVal = nil
    end
    local pda = this.__PROP__[aid]
    if (space == "std") then
        pda.std[key] = setVal
    elseif (space == "dyn") then
        pda.dyn[key] = setVal
    end
    if (updated) then
        if (event.propChange(key)) then
            event.trigger(this, EVENT.Prop.Change, {
                triggerObject = this,
                key = key,
                old = oldVal,
                new = newVal,
            })
        end
    end
    return updated
end

---@private
---@param key string
---@param variety any
---@param duration number
---@return self|any,boolean
function PROP(this, key, variety, duration)
    if (key == nil and variety == nil and duration == nil) then
        error("prop")
    end
    if (type(duration) ~= "number") then
        duration = 0
    end
    if (type(variety) == "string") then
        local durc = string.explode(";", variety)
        if (#durc == 2) then
            local durc2 = tonumber(durc[2])
            if (type(durc2) == "number") then
                duration = math.max(0, durc2)
                variety = durc[1]
            end
        end
    end
    if (key == nil) then
        return nil, false
    end
    local curVal = PropValue(this, key)
    if (variety == nil) then
        if (type(curVal) == "number") then
            if (curVal > 0 and key[1] ~= "<") then
                local mut = PROP(this, "<MUTATION>" .. key) or 0
                if (mut ~= 0) then
                    if (mut <= -100) then
                        curVal = 0
                    else
                        curVal = curVal * (1 + mut * 0.01)
                    end
                end
            end
            local formatter = Class(this).formatter()
            if (formatter ~= nil and type(formatter[key]) == "function") then
                curVal = formatter[key](curVal)
            end
            curVal = PropLimit(this, key, curVal)
        end
        return curVal, false
    end
    local aid = tostring(async.index)
    if (this.__PROP__[aid] == nil) then
        this.__PROP__[aid] = { std = {}, dyn = {} }
    end
    --- 同步数据设置时，强制清理异步数据
    if (aid == "0") then
        for i = 1, BJ_MAX_PLAYERS do
            local si = tostring(i)
            if (this.__PROP__[si]) then
                if (this.__PROP__[si].std and this.__PROP__[si].std[key]) then
                    this.__PROP__[si].std[key] = nil
                end
                if (this.__PROP__[si].dyn and this.__PROP__[si].dyn[key]) then
                    this.__PROP__[si].dyn[key] = nil
                end
            end
        end
    end

    if (variety == NIL) then
        local s = PropChange(this, key, "std", NIL, false)
        local d = PropChange(this, key, "dyn", NIL, false)
        return this, s or d
    end

    local pda = this.__PROP__[aid]
    local caleVal, diff = math.cale(variety, pda.std[key])
    if (caleVal == nil) then
        return this, false
    end

    -- 增幅 raise
    if (type(diff) == "number") then
        if (type(caleVal) == "number") then
            if (diff ~= 0 and key[1] ~= "<") then
                local raise = PROP(this, "<RAISE>" .. key) or 0
                if raise ~= 0 then
                    caleVal = caleVal - diff
                    diff = diff * (raise * 0.01 + 1)
                    caleVal = caleVal + diff
                end
            end
        end
    end
    if duration <= 0 then
        return this, PropChange(this, key, "std", caleVal)
    end
    local tmpDyn
    if (type(diff) == "number") then
        tmpDyn = (pda.dyn[key] or 0) + diff
    else
        tmpDyn = caleVal
    end
    -- 同步时挂载Buff
    if (aid == "0") then
        local bk = "prop_" .. key
        local bf
        bf = Buff(this, bk, duration, diff,
            function(o)
                PropChange(o, key, "dyn", tmpDyn)
            end,
            function(o)
                if (type(pda.dyn[key]) == "number") then
                    local new = pda.dyn[key] - diff
                    PropChange(o, key, "dyn", new)
                else
                    local cs = BuffCatcher(this, {
                        forward = false,
                        name = bk,
                        limit = 1,
                        filter = function(enumBuff) return enumBuff.id() ~= bf.id() end,
                    })
                    if (#cs > 0) then
                        cs[1].prop("purpose")(o)
                    else
                        PropChange(o, key, "dyn", NIL)
                    end
                end
            end)
            .purpose()
    else
        -- 异步时挂载计时器(只支持diff型)
        if (type(diff) == "number") then
            PropChange(this, key, "dyn", tmpDyn)
            time.setTimeout(duration, function()
                if (type(pda.dyn[key]) == "number") then
                    local new = pda.dyn[key] - diff
                    PropChange(this, key, "dyn", new)
                end
            end)
        end
    end
    return this, true
end

---@protected
---@param this Object
---@param key string
---@param variety nil|any
---@param duration number|0
---@return Object|any
function Prop(this, key, variety, duration)
    local v = PROP(this, key, variety, duration)
    return v
end