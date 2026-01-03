TPL_UNIT.Footman = UnitTpl("Footman")
    .abilitySlot({ TPL_ABILITY.ZZJY })
    .move(522)
-- 资源设定
Game().worth("lumber", "木头", { "gold", 1000000 }) -- 1木 = 1000000金
Game().worth("gold", "黄金")---@param this Bgm
Class("Bgm")
    .construct(
    function(this)
        PropChange(this, "volume", "std", 100, false)
    end)
---@param this AbilitySlot
---@param result number
Class("AbilitySlot")
    .limiter("abilityPoint",
    function(_, result)
        return math.floor(result)
    end)local process = Process("start")

process.onStart(function(this)

    -- 调试自动去除迷雾
    Game().fog(not DEBUGGING).mark(not DEBUGGING)

    this.next("test")

end)
---@param this Dialog
---@param resultStr string
Class("Dialog")
    .exec("title",
    function(this, resultStr)
        J.DialogSetMessage(this.__HANDLE__, resultStr)
    end)---@param value number
Class("Unit")
    .formatter("levelMax", function(value) return math.floor(value) end)
    .formatter("level", function(value) return math.floor(value) end)---@param value number
Class("Item")
    .formatter("levelMax", function(value) return math.floor(value) end)
    .formatter("level", function(value) return math.floor(value) end)---@param this Weather
---@param resultBool boolean
Class("Weather")
    .exec("enable",
    function(this, resultBool)
        J.EnableWeatherEffect(this.__HANDLE__, resultBool)
    end)---@param this FrameCustom
---@param resultNum number
Class("FrameCustom")
    .exec("alpha",
    function(this, resultNum)
        japi.DzFrameSetAlpha(this.__FRAME_ID__, resultNum)
    end)---@param this FrameLabel
---@param resultStr string
Class("FrameLabel")
    .exec("texture",
    function(this, resultStr)
        japi.DzFrameSetTexture(this.__FRAME_ID__, resultStr, 0)
    end)---@param this FrameButton
---@param resultStr string
Class("FrameButton")
    .exec("texture",
    function(this, resultStr)
        japi.DzFrameSetTexture(this.__FRAME_ID__, resultStr, 0)
    end)

    ---@param this FrameModel
Class("FrameModel")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_MODEL"
        options.fdfType = "SPRITE"
    end)---@param result number
Class("Vcm")
    .limiter("volume",
    function(_, result)
        result = math.max(0, result)
        result = math.min(127, result)
        return math.floor(result)
    end)---@param result number
Class("Vwp")
    .limiter("volume",
    function(_, result)
        result = math.max(0, result)
        result = math.min(127, result)
        return math.floor(result)
    end)---@param result number
Class("V3d")
    .limiter("volume",
    function(_, result)
        result = math.max(0, result)
        result = math.min(127, result)
        return math.floor(result)
    end)---@param this FrameBackdrop
---@param resultStr string
Class("FrameBackdrop")
    .exec("texture",
    function(this, resultStr)
        japi.DzFrameSetTexture(this.__FRAME_ID__, resultStr, 0)
    end)
---@param this Bgm
---@param result number
Class("Bgm")
    .limiter("volume",
    function(_, result)
        result = math.max(0, result)
        result = math.min(100, result)
        return result
    end)---@param this FrameBackdropTile
---@param resultStr string
Class("FrameBackdropTile")
    .exec("texture",
    function(this, resultStr)
        japi.DzFrameSetTexture(this.__FRAME_ID__, resultStr, 1)
    end)
---@param this FrameBackdropBlock
---@param resultStr string
Class("FrameBackdropBlock")
    .exec("texture",
    function(this, resultStr)
        japi.DzFrameSetTexture(this.__FRAME_ID__, resultStr, 0)
    end)
---@param this Camera
Class("Camera")
    .construct(
    function(this)
        PropChange(this, "<SUPERPOSITION>shake", "std", 0, false)
        PropChange(this, "<SUPERPOSITION>quake", "std", 0, false)
    end)---@param this Server
Class("Server")
    .construct(
    function(this, options)
        PropChange(this, "bindPlayer", "std", options.bindPlayer, false)
        PropChange(this, "data", "std", {}, false)
    end)---@param this FrameHighLight
Class("FrameHighLight")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_HIGHLIGHT"
        options.fdfType = "HIGHLIGHT"
    end)---@param this FrameCustom
---@param result number
Class("FrameCustom")
    .limiter("alpha",
    function(_, result)
        result = math.max(0, result)
        result = math.min(255, result)
        return result
    end)---@param this WarehouseSlot
Class("WarehouseSlot")
    .construct(
    function(this, options)
        PropChange(this, "bindPlayer", "std", options.bindPlayer, false)
        PropChange(this, "storage", "std", {}, false)
    end)---@param this FrameList
---@param resultNum number
Class("FrameList")
    .exec("fontSize",
    function(this, resultNum)
        for _, t in ipairs(this.prop("childTexts")) do
            t.fontSize(resultNum)
        end
    end)---@param this FrameBackdrop
Class("FrameBackdrop")

    .public("texture",
    function(this, modify)
        if (modify) then
            modify = AUIKit(this.kit(), modify, "tga")
        end
        return this.prop("texture", modify)
    end)

---@param this FrameBackdropTile
Class("FrameBackdropTile")

    .public("texture",
    function(this, modify)
        if (modify) then
            modify = AUIKit(this.kit(), modify, "tga")
        end
        return this.prop("texture", modify)
    end)
---@param value number
Class("Ability")
    .formatter("levelMax", function(value) return math.floor(value) end)
    .formatter("levelUpNeedPoint", function(value) return math.floor(value) end)
    .formatter("level", function(value) return math.floor(value) end)---@param this FrameAnimate
Class("FrameAnimate")
    .inherit("FrameBackdrop")
    .construct(
    function(this)
        PropChange(this, "duration", "std", 1, false)
        PropChange(this, "halt", "std", 0, false)
        PropChange(this, "step", "std", 0, false)
    end)---@param getData noteOnItemGetData
TPL_ITEM.DEMO = ItemTpl("TreasureChest")
    .name("物品例子")
    .ability(TPL_ABILITY.DEMO)
    .icon("black")
    .worth({ gold = 10 })
    .onEvent(EVENT.Item.Get,
    function(getData)
        echo("获得物品", getData.triggerUnit.owner())
    end)---@param this Destructable
---@param result number
Class("Destructable")
    .limiter("hpCur",
    function(this, result)
        if (this.prop("hp") ~= nil) then
            result = math.min(this.prop("hp"), result)
        end
        result = math.max(0, result)
        return result
    end)---@param this FrameBackdrop
Class("FrameBackdrop")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_BACKDROP"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")
    end)---@param this FrameText
Class("FrameText")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_TEXT"
        options.fdfType = "TEXT"
    end)
    .initial(
    function(this)
        this.textAlign(TEXT_ALIGN_CENTER)
        this.fontSize(10)
    end)---@param this FrameBackdropTile
Class("FrameBackdropTile")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_BACKDROP_TILE"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")
    end)SL_CACHE["Refresh"] = Array()
Game().onEvent(EVENT.Game.Start, "Refresh", function()
    JassJapi["DzFrameSetUpdateCallbackByCode"](function()
        async.call(PlayerLocal(), function()
            SL_CACHE["Refresh"].forEach(function(_, call)
                promise(call)
            end)
        end)
    end)
end)---@param this FrameTextarea
Class("FrameTextarea")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_TEXTAREA"
        options.fdfType = "TEXTAREA"
    end)
    .initial(
    function(this)
        this.textAlign(TEXT_ALIGN_CENTER)
        this.fontSize(10)
    end)---@param this FrameModel
---@param resultStr string
Class("FrameModel")
    .exec("model",
    function(this, resultStr)
        japi.DzFrameSetModel(this.__FRAME_ID__, resultStr, 0, 0)
    end)
    .exec("animate",
    function(this, result)
        japi.DzFrameSetAnimate(this.__FRAME_ID__, table.unpack(result))
    end)---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.DEMO = AbilityTpl()
    .name("技能例子")
    .targetType(ABILITY_TARGET_TYPE.TAG_E)
    .icon("black")
    .coolDownAdv(10, 0)
    .mpCostAdv(100, 0)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        echo("技能释放", effectiveData.triggerUnit.owner())
    end)---@param this Item
---@param result number
Class("Item")
    .limiter("levelMax",
    function(_, result)
        return math.min(Game().itemLevelMax(), result)
    end)
    .limiter("level",
    function(this, result)
        return math.min(this.prop("levelMax"), result)
    end)
    .limiter("charges",
    function(_, result)
        return math.max(0, result)
    end)---@param this FrameText
---@param result number
Class("FrameText")
    .limiter("textColor",
    function(_, result)
        result = math.max(0, result)
        result = math.min(255, result)
        return result
    end)
    .limiter("fontSize",
    function(_, result)
        result = math.max(6, result)
        result = math.min(16, result)
        return result
    end)SL_FPS = 60
Game().onEvent(EVENT.Game.Start, "SL_FPS", function()
    SL_FPS_I = 0
    SL_FPS_D = time.inc
    japi.Refresh("SL_FPS", function()
        SL_FPS_I = SL_FPS_I + 1
        if (SL_FPS_I >= 30 and time.inc > SL_FPS_D) then
            SL_FPS = math.min(70, 30 / 0.01 / (time.inc - SL_FPS_D))
            SL_FPS_I = 0
            SL_FPS_D = time.inc
        end
    end)
end)---@param this Lightning
Class("Lightning")
    .construct(
    function(this, options)
        PropChange(this, "lightningType", "std", options.lightningType, false)
        PropChange(this, "priority", "std", 0, false)
        PropChange(this, "scatter", "std", 0, false)
        PropChange(this, "radius", "std", 0, false)
        PropChange(this, "focus", "std", 0, false)
    end)
---@param this FrameTextarea
---@param result number
Class("FrameTextarea")
    .limiter("textColor",
    function(_, result)
        result = math.max(0, result)
        result = math.min(255, result)
        return result
    end)
    .limiter("fontSize",
    function(_, result)
        result = math.max(6, result)
        result = math.min(16, result)
        return result
    end)---@param this Image
---@param result number
Class("Image")
    .limiter("rgba",
    function(_, result)
        for i = 1, 4 do
            if (type(result[i]) == "number") then
                result[i] = math.floor(result[i])
                result[i] = math.max(0, result[i])
                result[i] = math.min(255, result[i])
            end
        end
        return result
    end)---@param this Store
Class("Store")
    .construct(
    function(this, options)
        PropChange(this, "key", "std", options.key, false)
        PropChange(this, "name", "std", options.key, false)
        PropChange(this, "icon", "std", "Singluar\\ui\\default.tga", false)
        PropChange(this, "salesGoods", "std", Array(), false)
        PropChange(this, "salesPlayers", "std", {}, false)
    end)---@param this Weather
Class("Weather")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("bindRect",
    function(this)
        return this.prop("bindRect")
    end)

    .public("weatherType",
    function(this)
        return this.prop("weatherType")
    end)

    .public("enable",
    function(this, modify)
        return this.prop("enable", modify)
    end)---@param this Team
Class("Team")
    .construct(
    function(this, options)
        PropChange(this, "key", "std", options.key, false)
        PropChange(this, "name", "std", options.key, false)
        PropChange(this, "nameSync", "std", false, false)
        PropChange(this, "colorSync", "std", false, false)
        PropChange(this, "members", "std", {}, false)
        PropChange(this, "counter", "std", {}, false)
    end)_assets_selection("Common")

_assets_font("PingFangSC") --苹方字体不支持免费商用，仅作参考

_assets_icon("black")

_assets_model("buff/Echo", "Echo")

_assets_sound("axe_chop_medium", nil, "vwp") --武器声音，每种3段
_assets_sound("bgm/Geoff Knorr - China (The Atomic Era)", "China", "bgm") --背景音乐

_assets_ui("singluar_set")
_assets_ui("singluar_debug")
_assets_ui("singluar_cursor") --指针置顶
bop = bop or {}

bop.oid = bop.oid or {}
bop.static = bop.static or {}
bop.h2o = bop.h2o or {}
bop.i2o = bop.i2o or setmetatable({}, { __mode = "v" })

---@param prefix string
---@return string
function bopID(prefix)
    prefix = prefix or '_'
    if (bop.oid[prefix] == nil) then
        bop.oid[prefix] = 0
    end
    bop.oid[prefix] = bop.oid[prefix] + 1
    return string.format('%s:%s:%s', prefix, time.inc or '?', bop.oid[prefix])
end---@param this Vcm
---@param resultNum number
---@param resultTable table
Class("Vcm")
    .exec("volume",
    function(this, resultNum)
        J.SetSoundVolume(this.__HANDLE__, math.floor(resultNum * 1.27))
    end)
    .exec("channel",
    function(this, resultTable)
        J.SetSoundChannel(this.__HANDLE__, resultTable.value)
    end)
    .exec("pitch",
    function(this, resultNum)
        J.SetSoundPitch(this.__HANDLE__, resultNum)
    end)---@param this FrameModel
Class("FrameModel")

    .public("model",
    function(this, modify)
        if (modify) then
            modify = AModel(modify)
        end
        return this.prop("model", modify)
    end)

    .public("animate",
    function(this, animId, autoCast)
        if (animId and type(autoCast) == "boolean") then
            return this.prop("animate", { animId, autoCast })
        end
        return this.prop("animate")
    end)---@param this ItemSlot
Class("ItemSlot")
    .construct(
    function(this, options)
        PropChange(this, "bindUnit", "std", options.bindUnit, false)
        PropChange(this, "storage", "std", {}, false)
    end)
    .destroy(
    function(this)
        local storage = this.storage()
        for i = 1, #Game().itemHotkey() do
            if (isObject(storage[i], "Item")) then
                storage[i].destroy()
            end
        end
    end)-- 漂浮字符
ttg.char("0", "singluar_ttg_0", 1.9)
ttg.char("1", "singluar_ttg_1", 1.8)
ttg.char("2", "singluar_ttg_2", 1.8)
ttg.char("3", "singluar_ttg_3", 1.8)
ttg.char("4", "singluar_ttg_4", 1.8)
ttg.char("5", "singluar_ttg_5", 1.8)
ttg.char("6", "singluar_ttg_6", 1.8)
ttg.char("7", "singluar_ttg_7", 1.8)
ttg.char("8", "singluar_ttg_8", 1.8)
ttg.char("9", "singluar_ttg_9", 1.8)
ttg.char("+", "singluar_ttg_+", 1.7)
ttg.char("-", "singluar_ttg_-", 1.7)---@param this Ability
---@param result number
Class("Ability")
    .limiter("exp",
    function(_, result)
        result = math.max(0, result)
        result = math.min(Game().abilityExpNeeds(Game().abilityLevelMax()), result)
        return result
    end)
    .limiter("levelMax",
    function(_, result)
        return math.min(Game().abilityLevelMax(), result)
    end)
    .limiter("level",
    function(this, result)
        return math.min(this.prop("levelMax"), result)
    end)---@param this Dialog
Class("Dialog")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("title",
    function(this, modify)
        return this.prop("title", modify)
    end)

    .public("show",
    function(this, Who)
        if (isObject(Who, "Player")) then
            J.DialogDisplay(Who.handle(), this.handle(), true)
        else
            J.DialogDisplay(Player1st().handle(), this.handle(), true)
        end
        return this
    end)
---@param this Weather
Class("Weather")
    .construct(
    function(this, options)
        href(this, J.AddWeatherEffect(options.bindRect.handle(), options.realType))
        PropChange(this, "bindRect", "std", options.bindRect, false) -- 绑定区域
        PropChange(this, "weatherType", "std", options.weatherType, false) -- 天气类型 WEATHER_TYPE
        PropChange(this, "enable", "std", false, false)
    end)
    .initial(
    function(this)
        J.EnableWeatherEffect(this.__HANDLE__, false)
    end)---@param this AbilitySlot
Class("AbilitySlot")
    .construct(
    function(this, options)
        PropChange(this, "bindUnit", "std", options.bindUnit, false)
        PropChange(this, "storage", "std", {}, false)
        PropChange(this, "tail", "std", 0, false)
    end)
    .destroy(
    function(this)
        local storage = this.storage()
        for i = 1, #Game().abilityHotkey() do
            if (isObject(storage[i], "Ability")) then
                storage[i].destroy()
            end
        end
    end)---@param this FrameBackdropBlock
Class("FrameBackdropBlock")

    .public("size",
    function(this, w, h)
        if (w ~= nil and h ~= nil) then
            CLink(this, "Frame", "size", w, h)
            this.prop("childBlock").size(w, h)
            return this
        end
        return CLink(this, "Frame", "size")
    end)

    .public("texture",
    function(this, modify)
        if (modify) then
            modify = AUIKit(this.kit(), modify, "tga")
        end
        return this.prop("texture", modify)
    end)

--- 异步随机池
AYRD = function(min, max)
    min = math.ceil(min)
    max = math.ceil(max)
    if (min == max) then
        return
    end
    if (min > max) then
        min, max = max, min
    end
    local t = table.section(min, max)
    local m = min .. '_' .. max
    for i = 1, BJ_MAX_PLAYER_SLOTS do
        async.randPool.d[i][m] = table.rand(t, #t)
        async.randPool.i[i][m] = math.rand(1, #async.randPool.d[i][m])
    end
end
Game().onEvent(EVENT.Game.Start, "AYRD", function() RAL_ASYNC_RAND = 20220608 end)---@param this Vcm
Class("Vcm")
    .construct(
    function(this, options)
        href(this, J.CreateSound(AVcm(options.alias), false, false, false, 10, 10, "DefaultEAXON"))
        PropChange(this, "alias", "std", options.alias, false)
        PropChange(this, "duration", "std", options.duration, false)
        PropChange(this, "volume", "std", 100, false)
        PropChange(this, "pitch", "std", 1, false)
    end)
    .initial(
    function(this)
        J.SetSoundDuration(this.__HANDLE__, this.prop("duration"))
    end)---@param this FrameBackdropBlock
Class("FrameBackdropBlock")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_BACKDROP"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")
        local childBlock = FrameText(this.frameIndex() .. "->childBlock", this)
            .relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
            .show(true)
        this.prop("childBlock", childBlock)
    end)---@param this Frame
---@param resultBool boolean
---@param resultNum number[]
Class("Frame")
    .exec("size",
    function(this, resultNum)
        japi.DzFrameSetSize(this.__FRAME_ID__, resultNum[1], resultNum[2])
    end)
    .exec("relation",
    function(this, result)
        japi.DzFrameClearAllPoints(this.__FRAME_ID__)
        japi.DzFrameSetPoint(this.__FRAME_ID__, result[1], result[2].__FRAME_ID__, result[3], result[4], result[5])
    end)
    .exec("show",
    function(this, resultBool)
        japi.DzFrameShow(this.__FRAME_ID__, resultBool)
    end)---@param this Bgm
Class("Bgm")

    .public("isPlaying",
    function(this)
        return this.prop("currentMusic") ~= nil and this.prop("currentMusic") ~= ""
    end)

    .public("volume",
    function(this, modify)
        return this.prop("volume", modify)
    end)

    .public("stop",
    function(this)
        this.prop("currentMusic", "")
    end)

    .public("play",
    function(this, musicAlias)
        musicAlias = ABgm(musicAlias)
        if (musicAlias == nil) then
            return
        end
        this.prop("currentMusic", musicAlias)
    end)---@param this Lightning
Class("Lightning")

    .public("lightningType",
    function(this, modify)
        return this.prop("lightningType", modify)
    end)

    .public("priority",
    function(this, modify)
        return this.prop("priority", modify)
    end)

    .public("scatter",
    function(this, modify)
        return this.prop("scatter", modify)
    end)

    .public("radius",
    function(this, modify)
        return this.prop("radius", modify)
    end)

    .public("focus",
    function(this, modify)
        return this.prop("focus", modify)
    end)
---@param this FrameText
Class("FrameText")

    .public("textAlign",
    function(this, modify)
        return this.prop("textAlign", modify)
    end)

    .public("textColor",
    function(this, modify)
        return this.prop("textColor", modify)
    end)

    .public("textSizeLimit",
    function(this, modify)
        return this.prop("textSizeLimit", modify)
    end)

    .public("fontSize",
    function(this, modify)
        return this.prop("fontSize", modify)
    end)

    .public("text",
    function(this, modify)
        return this.prop("text", modify)
    end)---@param this FrameTextarea
Class("FrameTextarea")

    .public("textAlign",
    function(this, modify)
        return this.prop("textAlign", modify)
    end)

    .public("textColor",
    function(this, modify)
        return this.prop("textColor", modify)
    end)

    .public("textSizeLimit",
    function(this, modify)
        return this.prop("textSizeLimit", modify)
    end)

    .public("fontSize",
    function(this, modify)
        return this.prop("fontSize", modify)
    end)

    .public("text",
    function(this, modify)
        return this.prop("text", modify)
    end)---@param this FrameCustom
Class("FrameCustom")
    .inherit("Frame")
    .construct(
    function(this, options)
        local tag = japi.FrameTagIndex()
        options.parent = options.parent or FrameGameUI
        options.frameId = japi.DzCreateFrameByTagName(options.fdfType, tag, options.parent.__FRAME_ID__, options.fdfName, 0)
        PropChange(this, "tag", "std", options.tag, false)
        PropChange(this, "fdfName", "std", options.fdfName, false)
        PropChange(this, "fdfType", "std", options.fdfType, false)
        PropChange(this, "alpha", "std", 255, false)
    end)---@param this Vcm
Class("Vcm")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("duration",
    function(this)
        return this.prop("duration")
    end)

    .public("volume",
    function(this, modify)
        return this.prop("volume", modify)
    end)

    .public("channel",
    function(this, modify)
        return this.prop("channel", modify)
    end)

    .public("pitch",
    function(this, modify)
        return this.prop("pitch", modify)
    end)

    .public("play",
    function(this)
        J.StartSound(this.handle())
    end)---@param this Player
---@param resultStr string
---@param resultNum number
Class("Player")
    .exec("name",
    function(this, resultStr)
        J.SetPlayerName(this.__HANDLE__, resultStr)
    end)
    .exec("teamColor",
    function(this, resultNum)
        J.SetPlayerColor(this.__HANDLE__, PLAYER_COLOR[resultNum])
        group.forEach({
            key = "Unit",
            func = function(enumUnit)
                return enumUnit.isAlive() and this.id() == enumUnit.owner().id()
            end
        }, function(enumUnit)
            enumUnit.teamColor(resultNum)
        end)
    end)--- 任务
Quest("gg")
    .title("主动投降")
    .side("right")
    .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
    .content("-gg 投降并退出")

Quest("apm")
    .title("查看你的APM数值")
    .side("right")
    .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
    .content("-apm 查看你的APM数值")

Quest("fov")
    .title("调整你的视距")
    .side("right")
    .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
    .content({ "-d +[number] 增加视距", "-d -[number] 减少视距", "-d =[number] 设置视距" })---@param this Image
Class("Image")
    .construct(
    function(this, options)
        href(this, J.CreateImage(options.texture, options.width, options.height, 0, -options.width / 2, -options.height / 2, 0, 0, 0, 0, 3))
        PropChange(this, "restruct", "std", Array(), false)
        PropChange(this, "position", "std", { 0, 0 }, false)
        PropChange(this, "rgba", "std", { 255, 255, 255, 255 }, false)
        PropChange(this, "texture", "std", options.texture, false)
        PropChange(this, "size", "std", { options.width, options.height }, false)
        PropChange(this, "show", "std", true, false)
    end)---@param this Timer
Class("Timer")
    .construct(
    function(this, options)
        PropChange(this, "isInterval", "std", options.isInterval, false)
        PropChange(this, "period", "std", options.period, false)
        PropChange(this, "callFunc", "std", options.callFunc, false)
        PropChange(this, "link", "std", 0, false)
    end)
    .destroy(
    function(this)
        local l = this.prop("link") or 0
        this.prop("link", NIL)
        if (l > time.inc) then
            local k = this.kernel()
            if (type(k) == "table" and isArray(k[l])) then
                k[l].set(this.id(), nil)
            end
        end
    end)---@param this V3d
Class("V3d")
    .construct(
    function(this, options)
        href(this, J.CreateSound(AV3d(options.alias), false, true, true, 10, 10, "DefaultEAXON"))
        PropChange(this, "alias", "std", options.alias, false)
        PropChange(this, "duration", "std", options.duration, false)
        PropChange(this, "volume", "std", 100, false)
        PropChange(this, "pitch", "std", 1, false)
        PropChange(this, "distanceCutoff", "std", 2000, false)
        PropChange(this, "distances", "std", { 500, 2500 }, false)
    end)
    .initial(
    function(this)
        J.SetSoundDuration(this.__HANDLE__, this.prop("duration"))
    end)---@param this Vwp
Class("Vwp")
    .construct(
    function(this, options)
        href(this, J.CreateSound(AVwp(options.alias), false, true, true, 10, 10, "CombatSoundsEAX"))
        PropChange(this, "alias", "std", options.alias, false)
        PropChange(this, "duration", "std", options.duration, false)
        PropChange(this, "volume", "std", 100, false)
        PropChange(this, "pitch", "std", 1, false)
        PropChange(this, "distanceCutoff", "std", 2000, false)
        PropChange(this, "distances", "std", { 500, 2500 }, false)
    end)
    .initial(
    function(this)
        J.SetSoundDuration(this.__HANDLE__, this.prop("duration"))
    end)---@param this Quest
Class("Quest")
    .construct(
    function(this, options)
        href(this, J.CreateQuest())
        PropChange(this, "key", "std", options.key, false)
        PropChange(this, "title", "std", options.title or "title", false)
        PropChange(this, "side", "std", options.side or "right", false)
        PropChange(this, "icon", "std", "ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp", false)
        PropChange(this, "content", "std", "", false)
        PropChange(this, "complete", "std", false, false)
        PropChange(this, "fail", "std", false, false)
        PropChange(this, "discover", "std", true, false)
    end)---@param this Missile
Class("Missile")
    .construct(
    function(this, options)
        PropChange(this, "modelAlias", "std", options.modelAlias, false)
        PropChange(this, "priority", "std", 0, false)
        PropChange(this, "speed", "std", 600, false)
        PropChange(this, "acceleration", "std", 0, false)
        PropChange(this, "height", "std", 600, false)
        PropChange(this, "shake", "std", 0, false)
        PropChange(this, "homing", "std", false, false)
        PropChange(this, "gatlin", "std", 0, false)
        PropChange(this, "scatter", "std", 0, false)
        PropChange(this, "radius", "std", 0, false)
        PropChange(this, "reflex", "std", 0, false)
    end)
--- 恢复生命监听器
---@param obj Unit
monitor.create("monitor-life_back", 0.4,
    function(obj) obj.hpCur("+=" .. 0.4 * obj.hpRegen()) end,
    function(obj) return obj.isDead() or obj.hpRegen() == nil or obj.hpRegen() == 0 end
)

--- 恢复魔法监听器
---@param obj Unit
monitor.create("monitor-mana_back", 0.5,
    function(obj) obj.mpCur("+=" .. 0.5 * obj.mpRegen()) end,
    function(obj) return obj.isDead() or obj.mpRegen() == nil or obj.mpRegen() == 0 end
)

--- 硬直监听器
---@param obj Unit
monitor.create("monitor-punish_back", 1,
    function(obj) obj.punishCur("+=" .. obj.punishRegen()) end,
    function(obj) return obj.isDead() or obj.punishRegen() == nil or obj.punishRegen() == 0 end
)---@param this UnitTpl
---@param resultNum number
Class("UnitTpl")
    .exec("flyHeight",
    function(this, resultNum)
        if (resultNum > 0) then
            PropChange(this, "moveType", "std", UNIT_MOVE_TYPE.fly, false)
        end
    end)
    .exec("punish",
    function(this, resultNum)
        PropChange(this, "punishCur", "std", resultNum, false)
    end)
    .exec("hp",
    function(this, resultNum)
        PropChange(this, "hpCur", "std", resultNum, false)
    end)
    .exec("mp",
    function(this, resultNum)
        PropChange(this, "mpCur", "std", resultNum, false)
    end)
    .exec("<SUPERPOSITION>attack",
    function(this, resultNum)
        this.prop("isAttackAble", resultNum > 0)
    end)---@param this FrameText
---@param resultNum number
---@param resultStr string
Class("FrameText")
    .exec("textAlign",
    function(this, resultNum)
        japi.DzFrameSetTextAlignment(this.__FRAME_ID__, resultNum)
    end)
    .exec("textColor",
    function(this, resultNum)
        japi.DzFrameSetTextColor(this.__FRAME_ID__, resultNum)
    end)
    .exec("textSizeLimit",
    function(this, resultNum)
        japi.DzFrameSetTextSizeLimit(this.__FRAME_ID__, resultNum)
    end)
    .exec("fontSize",
    function(this, resultNum)
        japi.DzFrameSetFont(this.__FRAME_ID__, 'fonts.ttf', resultNum * 0.001, 0)
    end)
    .exec("text",
    function(this, resultStr)
        japi.DzFrameSetText(this.__FRAME_ID__, resultStr)
    end)---@param this FrameTextarea
---@param resultNum number
---@param resultStr string
Class("FrameTextarea")
    .exec("textAlign",
    function(this, resultNum)
        japi.DzFrameSetTextAlignment(this.__FRAME_ID__, resultNum)
    end)
    .exec("textColor",
    function(this, resultNum)
        japi.DzFrameSetTextColor(this.__FRAME_ID__, resultNum)
    end)
    .exec("textSizeLimit",
    function(this, resultNum)
        japi.DzFrameSetTextSizeLimit(this.__FRAME_ID__, resultNum)
    end)
    .exec("fontSize",
    function(this, resultNum)
        japi.DzFrameSetFont(this.__FRAME_ID__, 'fonts.ttf', resultNum * 0.001, 0)
    end)
    .exec("text",
    function(this, resultStr)
        japi.DzFrameSetText(this.__FRAME_ID__, resultStr)
    end)---@param this Vwp
---@param resultNum number
---@param resultTable table
Class("Vwp")
    .exec("volume",
    function(this, resultNum)
        J.SetSoundVolume(this.__HANDLE__, math.floor(resultNum * 1.27))
    end)
    .exec("channel",
    function(this, resultTable)
        J.SetSoundChannel(this.__HANDLE__, resultTable.value)
    end)
    .exec("pitch",
    function(this, resultNum)
        J.SetSoundPitch(this.__HANDLE__, resultNum)
    end)
    .exec("distanceCutoff",
    function(this, resultNum)
        J.SetSoundDistanceCutoff(this.__HANDLE__, resultNum)
    end)
    .exec("distances",
    function(this, result)
        if (#result == 2) then
            J.SetSoundDistances(this.__HANDLE__, result[1], result[2])
        end
    end)---@param this V3d
---@param resultNum number
---@param resultTable table
Class("V3d")
    .exec("volume",
    function(this, resultNum)
        J.SetSoundVolume(this.__HANDLE__, math.floor(resultNum * 1.27))
    end)
    .exec("channel",
    function(this, resultTable)
        J.SetSoundChannel(this.__HANDLE__, resultTable.value)
    end)
    .exec("pitch",
    function(this, resultNum)
        J.SetSoundPitch(this.__HANDLE__, resultNum)
    end)
    .exec("distanceCutoff",
    function(this, resultNum)
        J.SetSoundDistanceCutoff(this.__HANDLE__, resultNum)
    end)
    .exec("distances",
    function(this, result)
        if (#result == 2) then
            J.SetSoundDistances(this.__HANDLE__, result[1], result[2])
        end
    end)---@param this FrameList
Class("FrameList")
    .inherit("FrameBackdrop")
    .construct(
    function(this, options)
        PropChange(this, "max", "std", options.max, false)
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")
        local texts = {}
        local buttons = {}
        for i = 1, this.max() do
            local txt = FrameText(this.frameIndex() .. '->txt->' .. i, this)
            table.insert(texts, txt)
            local btn = FrameButton(this.frameIndex() .. '->btn->' .. i, txt)
            btn.relation(FRAME_ALIGN_TOP, txt, FRAME_ALIGN_TOP, 0, 0)
            table.insert(buttons, btn)
        end
        this.prop("childTexts", texts)
        this.prop("childButtons", buttons)
    end)---@param this Buff
Class("Buff")
    .construct(
    function(this, options)
        PropChange(this, "duration", "std", options.duration, false)
        PropChange(this, "remain", "std", options.duration, false)
        PropChange(this, "obj", "std", options.obj, false)
        PropChange(this, "name", "std", options.name, false)
        PropChange(this, "diff", "std", options.diff, false)
        PropChange(this, "purpose", "std", options.purpose, false)
        PropChange(this, "rollback", "std", options.rollback, false)
        PropChange(this, "affecting", "std", false, false)
        if (this.prop("obj").__BUFF__ == nil) then
            this.prop("obj").__BUFF__ = Array()
        end
    end)
    .destroy(
    function(this)
        if (this.prop("affecting") == true) then
            this.rollback()
        end
    end)---@param this Bgm
---@param resultNum string
---@param resultStr string
Class("Bgm")
    .exec("volume",
    function(_, resultNum)
        J.SetMusicVolume(math.floor(resultNum * 1.27))
    end)
    .exec("currentMusic",
    function(this, resultStr)
        J.StopMusic(true)
        if (resultStr ~= "") then
            local delay = 3.3
            ---@type Timer
            local delayTimer = this.prop("delayTimer")
            if (isObject(delayTimer, "Timer")) then
                delay = math.max(0, delayTimer.remain())
                delayTimer.destroy()
                this.prop("delayTimer", NIL)
                delayTimer = nil
            end
            this.prop("delayTimer", time.setTimeout(delay, function()
                this.prop("delayTimer", NIL)
                J.PlayMusic(resultStr)
            end))
        end
    end)---@param this FrameLabel
Class("FrameLabel")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_BACKDROP"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")
        local highLight = FrameHighLight(this.frameIndex() .. "->highlight", this)
            .relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
            .show(false)
        this.prop("childHighLight", highLight)
        local icon = FrameBackdrop(this.frameIndex() .. '->icon', this)
        this.prop("childIcon", icon)
        local label = FrameText(this.frameIndex() .. '->text', this)
        this.prop("childLabel", label)
        this.autoSize(true)
        this.side(LAYOUT_ALIGN_LEFT)
        this.textAlign(TEXT_ALIGN_LEFT)
        this.fontSize(10)
    end)---@param hurtData noteOnUnitHurtData
---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.ZZJY = AbilityTpl()
    .name("自在极意被动")
    .targetType(ABILITY_TARGET_TYPE.PAS)
    .icon("black")
    .coolDownAdv(5, 0)
    .mpCostAdv(50, 0)
    .levelMax(10)
    .levelUpNeedPoint(2)
    .onUnitEvent(EVENT.Unit.Hurt,
    function(hurtData)
        hurtData.triggerAbility.effective()
    end)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        -- 技能被触发的效果
        effectiveData.triggerUnit.attach("DivineShieldTarget", "origin", 3)
        ---@param buffObj Unit
        Buff(effectiveData.triggerUnit, "hurtRebound", 3, 0,
            function(buffObj)
                buffObj.hurtReduction("+=100").hurtRebound("+=100").odds("hurtRebound", "+=100")
            end,
            function(buffObj)
                buffObj.hurtReduction("-=100").hurtRebound("-=100").odds("hurtRebound", "-=100")
            end)
            .purpose()
    end)---@param this Vwp
Class("Vwp")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("duration",
    function(this)
        return this.prop("duration")
    end)

    .public("volume",
    function(this, modify)
        return this.prop("volume", modify)
    end)

    .public("channel",
    function(this, modify)
        return this.prop("channel", modify)
    end)

    .public("pitch",
    function(this, modify)
        return this.prop("pitch", modify)
    end)

    .public("distanceCutoff",
    function(this, modify)
        return this.prop("distanceCutoff", modify)
    end)

    .public("distances",
    function(this, modify)
        return this.prop("distances", modify)
    end)

    .public("play",
    function(this)
        local targetUnit = this.prop("targetUnit")
        if (isObject(targetUnit, "Unit")) then
            J.AttachSoundToUnit(this.handle(), targetUnit.handle())
            J.StartSound(this.handle())
        end
    end)---@param this Dialog
Class("Dialog")
    .construct(
    function(this, options)
        href(this, J.DialogCreate())
        --
        local buttons = Array()
        for i = 1, #options.options do
            local label = options.options[i]
            local value = options.options[i]
            if (type(options.options[i]) == "table") then
                label = options.options[i].label
                value = options.options[i].value
            end
            local hk = dialog.hotkey(value)
            local b = J.DialogAddButton(this.__HANDLE__, label, hk)
            J.handleRef(b)
            buttons.set(b, { label = label, value = value, hotkey = hk })
        end
        PropChange(this, "action", "std", options.action, false)
        PropChange(this, "buttons", "std", buttons, false)
        PropChange(this, "title", "std", options.title or "标题", false)
        event.pool(dialog.evtClick, function(tgr)
            J.TriggerRegisterDialogEvent(tgr, this.__HANDLE__)
        end)
    end)---@param this Quest
Class("Quest")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("title",
    function(this, modify)
        return this.prop("title", modify)
    end)

    .public("icon",
    function(this, modify)
        return this.prop("icon", AIcon(modify))
    end)

    .public("side",
    function(this, modify)
        return this.prop("side", modify)
    end)

    .public("content",
    function(this, modify)
        if (modify and type(modify) == "table") then
            modify = string.implode("|n", modify)
        end
        return this.prop("content", modify)
    end)

    .public("complete",
    function(this, modify)
        return this.prop("complete", modify)
    end)

    .public("fail",
    function(this, modify)
        return this.prop("fail", modify)
    end)

    .public("discover",
    function(this, modify)
        return this.prop("discover", modify)
    end)

    .public("flash",
    function(this)
        J.FlashQuestDialogButton()
    end)---@param this Rect
Class("Rect")
    .construct(
    function(this, options)
        PropChange(this, "key", "std", options.key, false)
        PropChange(this, "name", "std", options.key, false)
        PropChange(this, "shape", "std", options.shape or "square", false)
        PropChange(this, "x", "std", options.x, false)
        PropChange(this, "y", "std", options.y, false)
        PropChange(this, "width", "std", options.width, false)
        PropChange(this, "height", "std", options.height, false)
        this.reset = function()
            local x = this.prop("x")
            local y = this.prop("y")
            local w = this.prop("width")
            local h = this.prop("height")
            PropChange(this, "xMin", "std", 0.5 * x - w, false)
            PropChange(this, "yMin", "std", 0.5 * y - h, false)
            PropChange(this, "xMax", "std", 0.5 * x + w, false)
            PropChange(this, "yMax", "std", 0.5 * y + h, false)
        end
    end)
    .initial(
    function(this)
        this.reset()
    end)---@param this Camera
---@param resultNum string
---@param resultUnit Unit
Class("Camera")
    .exec("farZ",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_FARZ, resultNum, 0)
    end)
    .exec("zOffset",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_ZOFFSET, resultNum, 0)
    end)
    .exec("fov",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_FIELD_OF_VIEW, resultNum, 0)
    end)
    .exec("xTra",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, resultNum, 0)
    end)
    .exec("yTra",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_ROLL, resultNum, 0)
    end)
    .exec("zTra",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_ROTATION, resultNum, 0)
    end)
    .exec("distance",
    function(_, resultNum)
        J.SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, resultNum, 0)
    end)
    .exec("follow",
    function(_, resultUnit)
        J.SetCameraTargetController(resultUnit.__HANDLE__, 0, 0, false)
    end)---@param this Server
Class("Server")

    .public("data",
    function(this)
        return this.prop("data")
    end)

    .public("bindPlayer",
    function(this)
        return this.prop("bindPlayer")
    end)

    .public("load",
    function(this, key, default)
        local data = this.data()
        if (data[key] == nil) then
            data[key] = japi.ServerLoadValue(this.bindPlayer().handle(), key) or default
        end
        return data[key]
    end)

    .public("save",
    function(this, key, value)
        local data = this.data()
        japi.ServerSaveValue(this.bindPlayer().handle(), key, value)
        if (data[key] ~= nil) then
            data[key] = nil
        end
    end)

    .public("clear",
    function(this, key)
        local data = this.data()
        japi.ServerSaveValue(this.bindPlayer().handle(), key, nil)
        if (data[key] ~= nil) then
            data[key] = nil
        end
    end)

    .public("room",
    function(this, key, value)
        japi.ServerSaveRoom(this.bindPlayer().handle(), key, value)
    end)                     --- 方便伤害类型引用 {value:string,label:string}
DAMAGE_TYPE.fire = nil
DAMAGE_TYPE.rock = nil
DAMAGE_TYPE.water = nil
DAMAGE_TYPE.ice = nil
DAMAGE_TYPE.wind = nil
DAMAGE_TYPE.light = nil
DAMAGE_TYPE.dark = nil
DAMAGE_TYPE.grass = nil
DAMAGE_TYPE.thunder = nil
DAMAGE_TYPE.poison = nil

-- 附魔设定
enchant.defined("fire", "火", {
    strengthen = 0,
    resistance = 0,
    append = {
        { attach = 'origin', effect = 'BreathOfFireDamage' },
        { attach = 'left hand', effect = 'BreathOfFireDamage' },
        { attach = 'right hand', effect = 'BreathOfFireDamage' },
        { attach = 'head', effect = 'BreathOfFireDamage' },
    },
    reaction = {
        grass = enchant.reaction(function(evtData)
            evtData.triggerUnit.hpRegen("-=200;5")
        end)
    },
})

enchant.defined("rock", "岩")
enchant.defined("water", "水")
enchant.defined("ice", "冰")
enchant.defined("wind", "风")
enchant.defined("light", "光")
enchant.defined("dark", "暗")
enchant.defined("grass", "草")
enchant.defined("thunder", "雷")
enchant.defined("poison", "毒")

---@param this Image
Class("Image")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("texture",
    function(this, modify)
        return this.prop("texture", modify)
    end)

    .public("size",
    function(this, width, height)
        if (type(width) == "number" and type(height) == "number") then
            local modify = { width, height }
            return this.prop("size", modify)
        end
        return this.prop("size")
    end)

    .public("show",
    function(this, modify)
        return this.prop("show", modify)
    end)

    .public("rgba",
    function(this, red, green, blue, alpha)
        if (type(red) == "number" and type(green) == "number" and type(blue) == "number" and type(alpha) == "number") then
            return this.prop("rgba", { red, green, blue, alpha })
        end
        return this.prop("rgba")
    end)

    .public("position",
    function(this, x, y)
        if (type(x) == "number" or type(y) == "number") then
            this.prop("position", { x, y })
        end
        return this
    end)

---@param this Camera
---@param result number
Class("Camera")
    .limiter("farZ",
    function(_, result)
        result = math.min(3000, result)
        result = math.max(100, result)
        return result
    end)
    .limiter("zOffset",
    function(_, result)
        result = math.min(3000, result)
        result = math.max(-1000, result)
        return result
    end)
    .limiter("fov",
    function(_, result)
        result = math.min(120, result)
        result = math.max(20, result)
        return result
    end)
    .limiter("xTra",
    function(_, result)
        result = math.min(350, result)
        result = math.max(270, result)
        return result
    end)
    .limiter("yTra",
    function(_, result)
        result = math.min(280, result)
        result = math.max(80, result)
        return result
    end)
    .limiter("zTra",
    function(_, result)
        result = math.min(280, result)
        result = math.max(80, result)
        return result
    end)
    .limiter("distance",
    function(_, result)
        result = math.min(3000, result)
        result = math.max(400, result)
        return result
    end)     -- 游戏信息
Game().onEvent(EVENT.Game.Start, function()

    --- 游戏介绍
    Game().prop("infoIntro", "暂无")

    --- 中央顶部信息
    time.setInterval(1, function()
        local info = {}
        local timeOfDay = time.timeOfDay()
        local tit = ""
        if (timeOfDay >= 0.00 and timeOfDay < 6.00) then
            tit = "凌晨"
        elseif (timeOfDay >= 6.00 and timeOfDay < 8.00) then
            tit = "清晨"
        elseif (timeOfDay >= 8.00 and timeOfDay < 12.00) then
            tit = "上午"
        elseif (timeOfDay >= 12.00 and timeOfDay < 13.00) then
            tit = "中午"
        elseif (timeOfDay >= 13.00 and timeOfDay < 18.00) then
            tit = "下午"
        elseif (timeOfDay >= 18.00 and timeOfDay < 22.00) then
            tit = "夜晚"
        else
            tit = "深夜"
        end
        local i, f = math.modf(timeOfDay)
        f = math.floor(59 * f)
        if (i < 10) then
            i = '0' .. i end
        if (f < 10) then
            f = '0' .. f
        end
        table.insert(info, tit)
        table.insert(info, i .. ':' .. f)
        Game().prop("infoCenter", info)
    end)

end)          local _____ = {}
function ___(w)
    if (_____[w] == nil) then
        local n = {}
        local st, sp, ep, en = 1, 1, 1, 13
        local sl = string.sub(w, 1, en)
        local sw = string.sub(w, en + 1)
        while true do
            sp, ep = string.find(sw, sl, st, true)
            if not sp then
                break
            end
            table.insert(n, string.sub(sw, st, sp - 1))
            st = ep + 1
        end
        table.insert(n, string.sub(sw, st))
        local s = ''
        for i = #n, 1, -1 do
            local nn = string.reverse(n[i])
            while true do
                if (____[nn] == nil) then
                    s = s .. nn
                    break
                else
                    nn = ____[nn]
                end
            end
        end
        _____[w] = s
    end
    return _____[w]
end
--SINGLUAR_REQUIRE
INITIALIZATION()
local t = J.CreateTrigger()
J.handleRef(t)
J.TriggerRegisterTimerEvent(t, 0.1, false)
J.TriggerAddAction(t, function()
    J.DisableTrigger(t)
    J.DestroyTrigger(t)
    J.handleUnRef(t)
    t = nil
    event.trigger(Game(), EVENT.Game.Start)
    event.unregister(Game(), EVENT.Game.Start)
    local p1st = Process("start")
    if (isProcess(p1st)) then
        p1st.start()
    end
end)
---@param this Missile
Class("Missile")

    .public("modelAlias",
    function(this, modify)
        return this.prop("modelAlias", modify)
    end)

    .public("priority",
    function(this, modify)
        return this.prop("priority", modify)
    end)

    .public("speed",
    function(this, modify)
        return this.prop("speed", modify)
    end)

    .public("height",
    function(this, modify)
        return this.prop("height", modify)
    end)

    .public("acceleration",
    function(this, modify)
        return this.prop("acceleration", modify)
    end)

    .public("shake",
    function(this, modify)
        return this.prop("shake", modify)
    end)

    .public("shakeOffset",
    function(this, modify)
        return this.prop("shakeOffset", modify)
    end)

    .public("homing",
    function(this, modify)
        return this.prop("homing", modify)
    end)

    .public("gatlin",
    function(this, modify)
        return this.prop("gatlin", modify)
    end)

    .public("scatter",
    function(this, modify)
        return this.prop("scatter", modify)
    end)

    .public("radius",
    function(this, modify)
        return this.prop("radius", modify)
    end)

    .public("reflex",
    function(this, modify)
        return this.prop("reflex", modify)
    end)
                _assets_model("eff/Crit", "singluar_crit")
_assets_model("ttg/+", "singluar_ttg_+")
_assets_model("ttg/-", "singluar_ttg_-")
_assets_model("ttg/0", "singluar_ttg_0")
_assets_model("ttg/1", "singluar_ttg_1")
_assets_model("ttg/2", "singluar_ttg_2")
_assets_model("ttg/3", "singluar_ttg_3")
_assets_model("ttg/4", "singluar_ttg_4")
_assets_model("ttg/5", "singluar_ttg_5")
_assets_model("ttg/6", "singluar_ttg_6")
_assets_model("ttg/7", "singluar_ttg_7")
_assets_model("ttg/8", "singluar_ttg_8")
_assets_model("ttg/9", "singluar_ttg_9")
_assets_model("ttg/avoid", "singluar_ttg_avoid")
_assets_model("ttg/crit", "singluar_ttg_crit")
_assets_model("ttg/immune", "singluar_ttg_immune")
_assets_model("ttg/immuneInvincible", "singluar_ttg_immuneInvincible")
_assets_model("ttg/punish", "singluar_ttg_punish")
_assets_model("ttg/e_dark", "singluar_ttg_e_dark")
_assets_model("ttg/e_fire", "singluar_ttg_e_fire")
_assets_model("ttg/e_grass", "singluar_ttg_e_grass")
_assets_model("ttg/e_ice", "singluar_ttg_e_ice")
_assets_model("ttg/e_light", "singluar_ttg_e_light")
_assets_model("ttg/e_poison", "singluar_ttg_e_poison")
_assets_model("ttg/e_rock", "singluar_ttg_e_rock")
_assets_model("ttg/e_thunder", "singluar_ttg_e_thunder")
_assets_model("ttg/e_water", "singluar_ttg_e_water")
_assets_model("ttg/e_wind", "singluar_ttg_e_wind")
---@param this Ability
Class("Ability")
    .inherit("AbilityTpl")
    .construct(
    function(this, options)
        PropChange(this, "tpl", "std", options.tpl, false)
        PropChange(this, "prohibitor", "std", Array(), false)
        PropChange(this, "exp", "std", 0, false)
        setmetatable(this.__PROP__["0"].std, { __index = options.tpl.__PROP__["0"].std })
    end)
    .initial(
    function(this)
        --- TPL事件注册
        local onEvent = this.prop("onEvent")
        if (type(onEvent) == "table") then
            for _, e in ipairs(onEvent) do
                event.register(this, table.unpack(e))
            end
            this.prop("onEvent", NIL)
        end
        --- TPL单位事件注册
        local onUnitEvent = this.prop("onUnitEvent")
        if (type(onUnitEvent) == "table") then
            for _, e in ipairs(onUnitEvent) do
                this.onUnitEvent(table.unpack(e))
            end
            this.prop("onUnitEvent", NIL)
        end
    end)
    .destroy(
    function(this)
        ---@type Unit
        local bindUnit = this.prop("bindUnit")
        if (isObject(bindUnit, "Unit")) then
            bindUnit.abilitySlot().remove(this.abilitySlotIndex())
            this.prop("bindUnit", NIL)
        end
        this.prop("abilitySlotIndex", NIL)
        this.prop("bindUnit", NIL)
        this.prop("bindItem", NIL)
    end)
attribute.labelOpts = {
    attack = "攻击",
    defend = "防御",
    enchantWeapon_water = "水武装",
}

-- 定义智能属性描述体
-- [基础信息]
---@param this Ability|Item
---@param options {level:number}
Game().defineDescription("attributes", function(this, options)
    if (type(this.attributes) ~= "function") then
        return nil
    end
    local attributes = this.attributes()
    if (type(attributes) ~= "table" or #attributes == 0) then
        return nil
    end
    local desc = {}
    local lv = math.floor(options.level or this.level())
    table.insert(desc, "")
    for _, a in ipairs(attributes) do
        local method = a[1]
        local m2 = a[2] or 0
        local d1
        local d2
        if (type(m2) == "number") then
            d1 = m2
            d2 = a[3] or d1
        elseif (type(m2) == "string") then
            method = method .. '_' .. m2
            d1 = a[3] or 0
            d2 = a[4] or d1
        end
        if (attribute.labelOpts[method] ~= nil) then
            local v = d1
            if (lv > 1) then
                v = v + (lv - 1) * d2
            end
            if (v > 0) then
                table.insert(desc, attribute.labelOpts[method] .. ": +" .. v)
            elseif (v < 0) then
                table.insert(desc, attribute.labelOpts[method] .. ": " .. v)
            end
        end
    end
    return desc
end)
---@param this FrameButton
Class("FrameButton")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "FRAMEWORK_BACKDROP"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        this.texture("Singluar\\ui\\nil.tga")

        local chl = FrameHighLight(this.frameIndex() .. "->ChildHL", this)
            .relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
            .show(false)
        this.prop("childHighLight", chl)

        local border = FrameBackdrop(this.frameIndex() .. '->childBorder', this)
            .relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
        this.prop("childBorder", border)

        local mark = FrameBackdrop(this.frameIndex() .. '->childMask', this)
            .relation(FRAME_ALIGN_BOTTOM, this, FRAME_ALIGN_BOTTOM, 0, 0)
            .show(false)
        this.prop("childMask", mark)

        local txt = FrameText(this.frameIndex() .. "->childText", this)
        txt.relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
           .textAlign(TEXT_ALIGN_CENTER)
           .fontSize(8)
        this.prop("childText", txt)

        local hk = FrameText(this.frameIndex() .. "->childHotkey", this)
        hk.relation(FRAME_ALIGN_BOTTOM, this, FRAME_ALIGN_BOTTOM, 0, -0.01)
          .textAlign(TEXT_ALIGN_CENTER)
          .fontSize(10)
        this.prop("childHotkey", hk)

    end)
---@param this Quest
---@param resultStr string
---@param resultBool boolean
Class("Quest")
    .exec("title",
    function(this, resultStr)
        J.QuestSetTitle(this.__HANDLE__, resultStr)
    end)
    .exec("icon",
    function(this, resultStr)
        J.QuestSetIconPath(this.__HANDLE__, AIcon(resultStr))
    end)
    .exec("side",
    function(this, resultStr)
        local questType
        if (resultStr == "left") then
            questType = BJ_QUESTTYPE_REQ_DISCOVERED
        elseif (resultStr == "right") then
            questType = BJ_QUESTTYPE_OPT_DISCOVERED
        end
        if (questType ~= nil) then
            local required = questType == BJ_QUESTTYPE_REQ_DISCOVERED or questType == BJ_QUESTTYPE_REQ_UNDISCOVERED
            local discovered = questType == BJ_QUESTTYPE_REQ_DISCOVERED or questType == BJ_QUESTTYPE_OPT_DISCOVERED
            J.QuestSetRequired(this.__HANDLE__, required)
            J.QuestSetDiscovered(this.__HANDLE__, discovered)
        end
    end)
    .exec("content",
    function(this, resultStr)
        J.QuestSetDescription(this.__HANDLE__, resultStr)
    end)
    .exec("complete",
    function(this, resultStr)
        J.QuestSetCompleted(this.__HANDLE__, resultStr)
    end)
    .exec("fail",
    function(this, resultBool)
        J.QuestSetFailed(this.__HANDLE__, resultBool)
    end)
    .exec("discover",
    function(this, resultBool)
        J.QuestSetDiscovered(this.__HANDLE__, resultBool)
    end)
---@param this Cursor
Class("Cursor")
    .initial(
    function(this)
        this.prop("childFollow", FrameBackdrop("SL_CursorFollow", FrameGameUI).show(false))
        this.prop("childAim", FrameBackdrop("SL_CursorAim", FrameGameUI).size(0.03, 0.04).show(false))
        this.prop("childArea", Image("Singluar\\ui\\nil.tga", 16, 16).show(false))
        this.prop("childSelection", Image("ReplaceableTextures\\Selection\\SelectionCircleLarge.blp", 72, 72).rgba(0, 255, 0, 255).show(false))
        this.prop("sizeRate", 0)
        this.prop("tooltips", function(obj)
            local str = {}
            if (isObject(obj, "Item")) then
                table.insert(str, obj.level() .. "级")
                table.insert(str, obj.name())
            end
            return {
                tips = string.implode("|n", str),
            }
        end)

        mouse.onMove("SL_CursorTooltips", function()
            local under = japi.DzGetUnitUnderMouse()
            local o = h2u(under)
            if (isObject(o, "Item")) then
                local rx = japi.MouseRX()
                local ry = japi.MouseRY()
                rx = japi.FrameDisAdaptive(rx)
                FrameTooltips(0)
                    .relation(FRAME_ALIGN_BOTTOM, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, rx, ry + 0.024)
                    .content(this.tooltips()(o))
                    .show(true)
            else
                FrameTooltips(0).show(false)
            end
        end)
    end)
---@param this Destructable
Class("Destructable")
    .construct(
    function(this, options)
        local dSlk = slk.i2v(options.id)
        local variationQty = math.floor(tonumber(dSlk.slk.numVar) or 1)

        options.x = options.x or 0
        options.y = options.y or 0
        options.z = options.z or 0
        options.facing = options.facing or math.rand(0, 360)
        options.scale = options.scale or (math.rand(7, 11) * 0.1)
        options.variation = options.variation or math.rand(1, variationQty)

        href(this, J.CreateDestructableZ(c2i(options.id), options.x, options.y, options.z, options.facing, options.scale, options.variation))

        PropChange(this, "modelId", "std", c2i(options.id), false)
        PropChange(this, "modelAlias", "std", options.modelAlias, false)
        PropChange(this, "variationQty", "std", variationQty, false)
        PropChange(this, "occluderHeight", "std", math.trunc(dSlk.slk.occH or 0.00, 2), false) -- 闭塞高度
        PropChange(this, "x", "std", options.x, false)
        PropChange(this, "y", "std", options.y, false)
        PropChange(this, "z", "std", options.z, false)
        PropChange(this, "facing", "std", options.facing, false)
        PropChange(this, "scale", "std", options.scale, false)
        PropChange(this, "variation", "std", options.variation, false)
    end)
    .initial(
    function(this)
        PropChange(this, "hp", "std", J.GetDestructableMaxLife(this.__HANDLE__), false)
        PropChange(this, "hpCur", "std", J.GetDestructableLife(this.__HANDLE__), false)
    end)
---@param this Image
Class("Image")
    .exec("texture",
    function(this, result)
        local size = this.size()
        if (this.prop("texture") ~= result and type(size) == "table") then
            href(this, J.CreateImage(result, size[1], size[2], 0, -size[1] / 2, -size[2] / 2, 0, 0, 0, 0, 3))
            J.SetImageAboveWater(this.__HANDLE__, true, true)
            J.SetImageRenderAlways(this.__HANDLE__, true)
            PropChange(this, "texture", "std", result, false)
            PropReExec(this)
        end
    end)
    .exec("size",
    function(this, result)
        local texture = this.texture()
        if (this.prop("size") ~= result and texture ~= nil) then
            href(this, J.CreateImage(texture, result[1], result[2], 0, -result[1] / 2, -result[2] / 2, 0, 0, 0, 0, 3))
            J.SetImageAboveWater(this.__HANDLE__, true, true)
            J.SetImageRenderAlways(this.__HANDLE__, true)
            PropChange(this, "size", "std", result, false)
            PropReExec(this)
        end
    end)
    .exec("show",
    function(this, result)
        J.ShowImage(this.__HANDLE__, result)
    end)
    .exec("rgba",
    function(this, result)
        J.SetImageColor(this.__HANDLE__, table.unpack(result))
    end)
    .exec("position",
    function(this, result)
        local prev = this.prop("position")
        result[1] = result[1] or prev[1]
        result[2] = result[2] or prev[2]
        local size = this.size()
        J.SetImageConstantHeight(this.__HANDLE__, false, 0)
        J.SetImagePosition(this.__HANDLE__, result[1] - size[1] / 2, result[2] - size[2] / 2, 0)
    end)             --- 热更新
SLHT = function()
    local function reload(name)
        if package.loaded[name] then
            package.loaded[name] = nil
        end
        local status, err = xpcall(require, debug.traceback, name)
        if (status ~= true) then
            print("[HOT]err: " .. err)
        else
            print("[HOT]reload: " .. name)
            if (string.subPos(name, "scripts.process.") == 1) then
                local p = string.replace(name, "scripts.process.", "")
                ---@type Process
                local proc = Processes.get(p)
                if (isProcess(proc) and table.equal(proc, ProcessCurrent)) then
                    proc.restart()
                end
            elseif (string.subPos(name, "oop.method.") == 1) then
                local o = string.replace(name, "oop.method.", "")
                local c = Class(o)
                if (c ~= nil) then
                    c.facades().forEach(function(id, _)
                        Method(i2o(id), o)
                    end)
                end
            end
        end
    end
    time.setInterval(1, function()
        local hot, err = io.open("slht.txt", 'r+')
        if (err == nil) then
            local str = hot:read('a')
            hot:close()
            hot, _ = io.open("slht.txt", 'w')
            hot:close()
            if (string.len(str) > 0) then
                local strs = string.explode('|', str)
                for _, s in ipairs(strs) do
                    reload(s)
                end
            end
        end
    end)
end
Game().onEvent(EVENT.Game.Start, "SLHT", function() SLHT() end)
---@param this V3d
Class("V3d")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("duration",
    function(this)
        return this.prop("duration")
    end)

    .public("volume",
    function(this, modify)
        return this.prop("volume", modify)
    end)

    .public("channel",
    function(this, modify)
        return this.prop("channel", modify)
    end)

    .public("pitch",
    function(this, modify)
        return this.prop("pitch", modify)
    end)

    .public("distanceCutoff",
    function(this, modify)
        return this.prop("distanceCutoff", modify)
    end)

    .public("distances",
    function(this, modify)
        return this.prop("distances", modify)
    end)

    .public("unit",
    function(this, whichUnit)
        J.AttachSoundToUnit(this.handle(), whichUnit.handle())
        return this
    end)

    .public("xyz",
    function(this, x, y, z)
        J.SetSoundPosition(this.handle(), x, y, z)
        return this
    end)

    .public("rect",
    function(this, whichRegent, dur)
        dur = dur or 0
        local width = whichRegent.width()
        local height = whichRegent.height()
        J.SetSoundPosition(this.handle(), whichRegent.x(), whichRegent.y(), 0)
        J.RegisterStackedSound(this.handle(), true, width, height)
        if (dur > 0) then
            time.setTimeout(dur, function(curTimer)
                curTimer.destroy()
                J.UnregisterStackedSound(this.handle(), true, width, height)
            end)
        end
        return this
    end)

    .public("play",
    function(this)
        J.StartSound(this.handle())
    end)            -- 命令
--- -gg 投降
Game().command("^-gg$", function()
    evtData.triggerPlayer.quit("GG")
end)
--- -apm 查看玩家分钟操作数
Game().command("^-apm$", function(evtData)
    echo("您的apm为:" .. evtData.triggerPlayer.apm(), evtData.triggerPlayer)
end)
--- -d [+|-|=][NUMBER]减少/增加/设置视距
Game().command("^-d [-+=]%d+$", function(evtData)
    local cds = string.explode(" ", string.lower(evtData.chatString))
    local first = string.sub(cds[2], 1, 1)
    if (first == "+" or first == "-" or first == "=") then
        --视距
        local v = string.sub(cds[2], 2, string.len(cds[2]))
        v = math.abs(tonumber(v))
        if (v > 0) then
            local val = math.abs(v)
            async.call(evtData.triggerPlayer, function()
                if (first == "+") then
                    Camera().distance("+=" .. val)
                elseif (first == "-") then
                    Camera().distance("-=" .. val)
                elseif (first == "=") then
                    Camera().distance(val)
                end
                echo("视距已设置为：" .. Camera().distance(), evtData.triggerPlayer)
            end)
        end
    end
end)
if (DEBUGGING) then
    --- 流程掌控
    Game().command("^-proc [a-zA-Z0-9_]+$", function(evtData)
        local p = string.trim(evtData.matchedString)
        p = string.sub(p, 7, string.len(p))
        local proc
        if (p == "this") then
            proc = ProcessCurrent
        else
            proc = Processes.get(p)
        end
        if (isProcess(proc)) then
            print(p .. "流程已重置")
            proc.start()
        end
    end)
end
-- 配置游戏 - 技能栏热键
-- A S H 被默认命令占用建议不使用
Game().abilityHotkey({ "Q", "W", "E", "R", "D", "F", "C", "V" })

Game().abilityUpgrade(99, 100, 1.00, 10000)

-- 定义技能描述体
-- [基础信息]
---@param this Ability
---@param options {level:number}
Game().defineDescription("abilityBase", function(this, options)
    local desc = {}
    local lv = math.floor(options.level or this.level())
    local tt = this.targetType()
    if (isObject(this, "Ability")) then
        if (tt ~= ABILITY_TARGET_TYPE.PAS) then
            table.insert(desc, this.name() .. ' - 等级 ' .. colour.gold(lv) .. '（' .. colour.gold(this.hotkey()) .. '）')
        else
            table.insert(desc, this.name() .. " - 等级 " .. colour.gold(lv))
        end
    else
        table.insert(desc, this.name())
    end
    table.insert(desc, '类型：' .. colour.gold(tt.label))
    if (tt ~= ABILITY_TARGET_TYPE.PAS) then
        local chantCast = this.castChant(lv)
        if (chantCast > 0) then
            table.insert(desc, '吟唱时间：' .. colour.skyLight(chantCast .. " 秒"))
        else
            table.insert(desc, '吟唱时间：' .. colour.skyLight("瞬间施法"))
        end
        local keepCast = this.castKeep(lv)
        if (keepCast > 0) then
            table.insert(desc, '最大施法持续：' .. colour.skyLight(keepCast .. " 秒"))
        end
    end
    return desc
end)

-- [技能点信息]
---@param this Ability
Game().defineDescription("abilityLvPoint", function(this, _)
    if (this.levelUpNeedPoint() > 0) then
        return { colour.hex('升级需要技能点: ' .. this.levelUpNeedPoint(), 'EFBA16') }
    end
end)
---@param this Item
Class("Item")
    .inherit("ItemTpl")
    .construct(
    function(this, options)
        PropChange(this, "tpl", "std", options.tpl, false)
        PropChange(this, "x", "std", 0, false)
        PropChange(this, "y", "std", 0, false)
        PropChange(this, "exp", "std", 0, false)
        setmetatable(this.__PROP__["0"].std, { __index = options.tpl.__PROP__["0"].std })
    end)
    .initial(
    function(this)
        --- TPL事件注册
        local onEvent = this.prop("onEvent")
        if (type(onEvent) == "table") then
            for _, e in ipairs(onEvent) do
                event.register(this, table.unpack(e))
            end
            this.prop("onEvent", NIL)
        end
        --- TPL单位事件注册
        local onUnitEvent = this.prop("onUnitEvent")
        if (type(onUnitEvent) == "table") then
            for _, e in ipairs(onUnitEvent) do
                this.onUnitEvent(table.unpack(e))
            end
            this.prop("onUnitEvent", NIL)
        end
        --- 模版TPL转具体技能对象
        local ab = this.prop("ability")
        if (isObject(ab, "AbilityTpl")) then
            this.prop("ability", Ability(ab))
        end
        --- 拥有次数的物品消减
        ---@param usedData noteOnItemUsedData
        this.onEvent(EVENT.Item.Used, function(usedData)
            local charges = usedData.triggerItem.charges()
            if (charges > 0) then
                charges = charges - 1
                if (charges <= 0) then
                    usedData.triggerItem.destroy()
                else
                    usedData.triggerItem.charges(charges)
                end
            end
        end)
    end)
    .destroy(
    function(this)
        if (this.instance()) then
            this.instance(false)
        else
            this.cls()
        end
    end)
    
---@param this ItemTpl
Class("ItemTpl")
    .construct(
    function(this, options)
        local modelAlias = this.prop("modelAlias")
        if (modelAlias == nil) then
            modelAlias = options.modelAlias
            PropChange(this, "modelAlias", "std", modelAlias, false)
        end
        local id = slk.n2i(modelAlias .. "|I")
        local uSlk = slk.i2v(id)
        local name = modelAlias
        PropChange(this, "modelId", "std", this.prop("modelId") or c2i(id), false)
        PropChange(this, "modelScale", "std", this.prop("modelScale") or math.trunc(uSlk.slk.modelScale or 1, 2), false)
        PropChange(this, "animateScale", "std", this.prop("animateScale") or 1, false)
        PropChange(this, "collision", "std", this.prop("collision") or math.floor(uSlk.slk.scale * 50), false)
        PropChange(this, "class", "std", this.prop("class") or name, false)
        PropChange(this, "name", "std", this.prop("name") or name, false)
        PropChange(this, "icon", "std", this.prop("icon") or uSlk.slk.Art or "Singluar\\ui\\default.tga", false)
        PropChange(this, "period", "std", this.prop("period") or -1, false)
        PropChange(this, "charges", "std", this.prop("charges") or 0, false)
        PropChange(this, "levelMax", "std", this.prop("levelMax") or 1, false)
        PropChange(this, "level", "std", this.prop("level") or 1, false)
        if (type(this.prop("instance")) ~= "boolean") then
            PropChange(this, "instance", "std", false, false)
        end
        if (type(this.prop("consumable")) ~= "boolean") then
            PropChange(this, "consumable", "std", true, false)
        end
        if (type(this.prop("pawnable")) ~= "boolean") then
            PropChange(this, "pawnable", "std", true, false)
        end
        if (type(this.prop("dropable")) ~= "boolean") then
            PropChange(this, "dropable", "std", true, false)
        end
    end)
---@param this FrameCustom
Class("FrameCustom")

    .public("fdfName",
    function(this)
        return this.prop("fdfName")
    end)

    .public("alpha",
    function(this, modify)
        return this.prop("alpha", modify)
    end)

    .public("showGradient",
    function(this, modify, options)
        local duration = options.duration or 0.1
        if (duration == nil or duration < 0.1) then
            return this.show(modify)
        end
        local x = options.x or 0
        local y = options.y or 0
        local al = this.alpha()
        local rel = this.relation()
        local ai = al * 0.1
        local ac
        local ox = x or 0
        local oy = y or 0
        if (type(rel) ~= "table") then
            ox = 0
            oy = 0
        end
        -- show
        if (modify ~= true) then
            ac = al
            ai = -ai
        else
            ac = 0
            japi.DzFrameSetAlpha(this.handle(), 0)
            this.show(modify)
        end
        -- xy
        if (ox ~= 0 or oy ~= 0) then
            japi.DzFrameClearAllPoints(this.handle())
            japi.DzFrameSetPoint(this.handle(), rel[1], rel[2].handle(), rel[3], rel[4] + ox * 10, rel[5] + oy * 10)
        end
        local i = 10
        time.setInterval(duration * 0.1, function(curTimer)
            i = i - 1
            if (i <= 0) then
                curTimer.destroy()
                if (modify ~= true) then
                    this.show(false)
                end
                japi.DzFrameSetAlpha(this.handle(), al)
                return
            end
            ac = ac + ai
            japi.DzFrameSetAlpha(this.handle(), ac)
            if (ox ~= 0 or oy ~= 0) then
                japi.DzFrameClearAllPoints(this.handle())
                japi.DzFrameSetPoint(this.handle(), rel[1], rel[2].handle(), rel[3], rel[4] + ox * i, rel[5] + oy * i)
            end
        end)
        return this
    end)

---@param this FrameTooltips
Class("FrameTooltips")
    .inherit("FrameCustom")
    .construct(
    function(_, options)
        options.fdfName = "SINGLUAR_BACKDROP_TOOLTIP"
        options.fdfType = "BACKDROP"
    end)
    .initial(
    function(this)
        group.push(this)
        this.adaptive(true)
            .relation(FRAME_ALIGN_CENTER, this.parent(), FRAME_ALIGN_CENTER, 0, 0)
            .size(0.1, 0.1)
            .show(false)

        local txt = FrameText(this.frameIndex() .. "->childText", this)
        txt.relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
           .textAlign(TEXT_ALIGN_LEFT)
           .fontSize(10)
        this.prop("childTxt", txt)

        local ics = {}
        for i = 1, 6 do
            local tmp = {}
            tmp.bg = FrameBackdrop(this.frameIndex() .. "->icon->bg->" .. i, this)
                .size(0.013, 0.013)
                .show(false)
            tmp.txt = FrameText(this.frameIndex() .. "->icon->txt->" .. i, tmp.bg)
                .relation(FRAME_ALIGN_LEFT, tmp.bg, FRAME_ALIGN_RIGHT, 0.004, 0)
                .textAlign(TEXT_ALIGN_LEFT)
            table.insert(ics, tmp)
        end
        this.prop("childIcons", ics)

        local brs = {}
        for i = 1, 3 do
            local b = FrameBar(this.frameIndex() .. "->bar->" .. i, this).show(false)
            table.insert(brs, b)
        end
        this.prop("childBars", brs)

        --- 功能菜单
        local cl = FrameList(this.frameIndex() .. '->list', this, 5)
            .relation(FRAME_ALIGN_LEFT_BOTTOM, this, FRAME_ALIGN_LEFT_BOTTOM, 0, 0)
            .direction("horizontal")
            .show(false)
        this.prop("childList", cl)

        --- 显隐策略
        this.onMouseLeave(function() if (this.show() == true) then this.show(false) end end)
            .onMouseEnter(function() if (this.show() == true) then this.show(true) end end)
    end)
    .destroy(
    function(this)
        group.remove(this)
    end)
    
---@param this Buff
Class("Buff")

    .public("duration",
    function(this)
        return this.prop("duration")
    end)

    .public("remain",
    function(this, variety)
        ---@type Timer
        local affectTimer = this.prop("affectTimer")
        if (false == isObject(affectTimer, "Timer")) then
            return 0
        end
        return affectTimer.remain(variety)
    end)

    .public("obj",
    function(this)
        return this.prop("obj")
    end)

    .public("name",
    function(this)
        return this.prop("name")
    end)

    .public("diff",
    function(this)
        return this.prop("diff")
    end)

    .public("purpose",
    function(this)
        if (this.prop("affecting") == false) then
            if (this.obj().isDestroy() == false) then
                this.prop("affecting", true)
                if (type(this.prop("purpose")) == "function") then
                    this.prop("purpose")(this.obj())
                end
                this.__PROTECT__ = true
                this.obj().__BUFF__.set(this.id(), this)
                local dur = this.prop("duration")
                if (dur > 0) then
                    this.prop("affectTimer", time.setTimeout(dur, function(_)
                        this.rollback()
                    end))
                end
            else
                this.destroy()
            end
        end
        return this
    end)

    .public("rollback",
    function(this)
        if (this.prop("affecting") == true) then
            if (this.obj().isDestroy() == false) then
                if (type(this.prop("rollback")) == "function") then
                    this.prop("rollback")(this.obj())
                end
                this.obj().__BUFF__.set(this.id(), nil)
            end
            if (isObject(this.prop("affectTimer"), "Timer")) then
                this.prop("affectTimer").destroy()
                this.prop("affectTimer", NIL)
            end
            this.prop("affecting", false)
        end
        this.__PROTECT__ = false
        this.destroy()
    end)

---@param this Destructable
Class("Destructable")

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("x",
    function(this)
        return this.prop("x")
    end)

    .public("y",
    function(this)
        return this.prop("y")
    end)

    .public("z",
    function(this)
        return this.prop("z")
    end)

    .public("position",
    function(this, tx, ty, tz)
        this.prop("x", tx)
        this.prop("y", ty)
        this.prop("z", tz)
        return this
    end)

    .public("modelId",
    function(this)
        return this.prop("modelId")
    end)

    .public("modelAlias",
    function(this)
        return this.prop("modelAlias")
    end)

    .public("facing",
    function(this, modify)
        return this.prop("facing", modify)
    end)

    .public("scale",
    function(this, modify)
        return this.prop("scale", modify)
    end)

    .public("variation",
    function(this, modify)
        return this.prop("variation", modify)
    end)

    .public("occluderHeight",
    function(this, modify)
        return this.prop("occluderHeight", modify)
    end)

    .public("invulnerable",
    function(this, modify)
        if (type(modify) ~= "boolean") then
            return J.IsDestructableInvulnerable(this.handle())
        end
        J.SetDestructableInvulnerable(this.handle(), modify)
        return this
    end)

    .public("show",
    function(this)
        J.ShowDestructable(this.handle(), true)
        return this
    end)

    .public("hide",
    function(this)
        J.ShowDestructable(this.handle(), false)
        return this
    end)

    .public("hp",
    function(this, modify)
        return this.prop("hp", modify)
    end)

    .public("hpCur",
    function(this, modify)
        return this.prop("hpCur", modify)
    end)

    .public("kill",
    function(this)
        J.KillDestructable(this.handle())
        return this
    end)

    .public("reborn",
    function(this)
        J.DestructableRestoreLife(this.handle(), J.GetDestructableMaxLife(this.handle()), true)
        return this
    end)     local process = Process("test")

process.onStart(function(this)

    print("Hello, World!")
    echo("你好，世界！")

    local effEcho = effect.xyz("Echo", 0, 0, 100, 10)

    local music = Bgm()
    music.stop()
    async.call(Player(1), function()
        music.play("China")
    end)

    local race = time.setInterval(1, function(_)
        local r = table.rand({ RACE_HUMAN_NAME, RACE_ORC_NAME, RACE_NIGHTELF_NAME, RACE_UNDEAD_NAME })
        Player(1)
            .race(r)
            .alert(string.rand(10))
    end)

    local footman = Unit(TPL_UNIT.Footman, Player(1), 0, 0, 270)
    footman.orderRoute(true, {
        {
            -500, -500,
            ---@param orderUnit Unit
            function(orderUnit)
                orderUnit.effect("HCancelDeath")
                orderUnit.orderRouteResume()
            end
        },
        {
            500, -500,
            ---@param orderUnit Unit
            function(orderUnit)
                ability.leap({
                    sourceUnit = orderUnit,
                    targetPoint = { 0, -1000, 0 },
                    speed = 3000,
                    height = 500,
                    reflex = 2,
                    onEnd = function(options)
                        options.sourceUnit.orderRouteResume()
                    end
                })
            end
        },
        {
            500, -1000,
            ---@param orderUnit Unit
            function(orderUnit)
                ability.crackFly({
                    targetUnit = orderUnit,
                    distance = 300,
                    height = 500,
                    bounce = { qty = 3 },
                    onEnd = function(options)
                        options.targetUnit.orderRouteResume()
                    end
                })
            end
        },
        { -500, -1000 },
    })

    this.stage("effEcho", effEcho)
    this.stage("music", music)
    this.stage("race", race)
    this.stage("footman", footman)

end)

process.onOver(function(this)
    effect.destroy(this.stage("effEcho"))
    this.stage("music").stop()
    this.stage("race").destroy()
    this.stage("footman").destroy()
end)


---@param this Unit
---@param result number
Class("Unit")
    .limiter("rgba",
    function(_, result)
        for i = 1, 4 do
            if (type(result[i]) == "number") then
                result[i] = math.floor(result[i])
                result[i] = math.max(0, result[i])
                result[i] = math.min(255, result[i])
            end
        end
        return result
    end)
    .limiter("flyHeight",
    function(_, result)
        result = math.floor(result)
        result = math.min(1500, math.max(0, result))
        return result
    end)
    .limiter("exp",
    function(this, result)
        if ((this.prop("level") or 0) < 1) then
            return 0
        else
            result = math.max(0, result)
            result = math.min(Game().unitExpNeeds(Game().unitLevelMax()), result)
            return result
        end
    end)
    .limiter("levelMax",
    function(_, result)
        return math.min(Game().unitLevelMax(), result)
    end)
    .limiter("level",
    function(this, result)
        return math.min(this.prop("levelMax"), result)
    end)
    .limiter("hp",
    function(_, result)
        return math.max(1, result)
    end)
    .limiter("hpCur",
    function(this, result)
        if (this.prop("hp") ~= nil) then
            result = math.min(this.prop("hp"), result)
        end
        result = math.max(0, result)
        return result
    end)
    .limiter("mp",
    function(_, result)
        return math.max(0, result)
    end)
    .limiter("mpCur",
    function(this, result)
        if (this.prop("mp") ~= nil) then
            result = math.min(this.prop("mp"), result)
        end
        result = math.max(0, result)
        return result
    end)
    .limiter("punishCur",
    function(this, result)
        if (this.prop("punish") ~= nil) then
            result = math.min(this.prop("punish"), result)
        end
        result = math.floor(result)
        result = math.max(0, result)
        return result
    end)
    .limiter("weightCur",
    function(this, result)
        if (this.prop("weight") ~= nil) then
            result = math.min(this.prop("weight"), result)
        end
        result = math.max(0, result)
        return result
    end)
---@param this Timer
Class("Timer")

    .private("kernel",
    function(this)
        local aid
        local asyncId = this.prop("asyncId")
        if (asyncId == 0) then
            aid = asyncId
        else
            aid = async.index
            must(aid == asyncId)
        end
        return time.kernel[aid]
    end)

    .public("remain",
    function(this, modify)
        local remain = this.prop("pause") or -1
        local l = this.prop("link") or 0
        if (remain == -1) then
            if (l > 0) then
                remain = (l - time.inc) / 100
            end
        end
        if (modify) then
            remain = math.cale(modify, remain)
            local kl = this.kernel()
            if (kl[l] ~= nil and kl[l].keyExists(this.id())) then
                kl[l].set(this.id(), nil)
                time.penetrate(this, math.min(this.prop("period"), math.max(0, remain)))
            end
            return this
        end
        return remain
    end)

    .public("period",
    function(this, modify)
        if (modify) then
            this.prop("period", modify)
            local l = this.prop("link")
            if (l > 0) then
                local p = this.prop("period")
                if (this.remain() > p) then
                    this.kernel()[l].set(this.id(), nil)
                    time.penetrate(this, p)
                end
            end
            return this
        end
        return this.prop("period") or -1
    end)

    .public("elapsed",
    function(this)
        return math.max(0, this.period() - this.remain())
    end)

    .public("pause",
    function(this)
        if (this.isDestroy() == false) then
            local l = this.prop("link")
            if (l > time.inc) then
                local kl = this.kernel()
                kl[l].set(this.id(), nil)
            end
            this.prop("pause", (l - time.inc) / 100)
            this.prop("link", NIL)
        end
        return this
    end)

    .public("resume",
    function(this)
        if (this.isDestroy() == false and this.prop("pause") ~= nil) then
            time.penetrate(this, this.prop("pause"))
            this.prop("pause", NIL)
        end
        return this
    end)
---@param this AbilityTpl
Class("AbilityTpl")
    .construct(
    function(this)
        PropChange(this, "name", "std", this.prop("name") or "UnknownTpl", false)
        PropChange(this, "icon", "std", this.prop("icon") or "Singluar\\ui\\default.tga", false)
        PropChange(this, "castAnimation", "std", this.prop("castAnimation") or "spell", false)
        PropChange(this, "keepAnimation", "std", this.prop("keepAnimation") or "spell", false)
        PropChange(this, "levelMax", "std", this.prop("levelMax") or 1, false)
        PropChange(this, "level", "std", this.prop("level") or 1, false)
        PropChange(this, "levelUpNeedPoint", "std", this.prop("levelUpNeedPoint") or 0, false)
        PropChange(this, "hpCostBase", "std", this.prop("hpCostBase") or 0, false)
        PropChange(this, "hpCostVary", "std", this.prop("hpCostVary") or 0, false)
        PropChange(this, "mpCostBase", "std", this.prop("mpCostBase") or 0, false)
        PropChange(this, "mpCostVary", "std", this.prop("mpCostVary") or 0, false)
        PropChange(this, "coolDownBase", "std", this.prop("coolDownBase") or 0, false)
        PropChange(this, "coolDownVary", "std", this.prop("coolDownVary") or 0, false)
        PropChange(this, "castDistanceBase", "std", this.prop("castDistanceBase") or 600, false)
        PropChange(this, "castDistanceVary", "std", this.prop("castDistanceVary") or 0, false)
        PropChange(this, "castRadiusBase", "std", this.prop("castRadiusBase") or 300, false)
        PropChange(this, "castRadiusVary", "std", this.prop("castRadiusVary") or 0, false)
        PropChange(this, "castWidthBase", "std", this.prop("castWidthBase") or 300, false)
        PropChange(this, "castWidthVary", "std", this.prop("castWidthVary") or 0, false)
        PropChange(this, "castHeightBase", "std", this.prop("castHeightBase") or 300, false)
        PropChange(this, "castHeightVary", "std", this.prop("castHeightVary") or 0, false)
        PropChange(this, "castChantBase", "std", this.prop("castChantBase") or 0, false)
        PropChange(this, "castChantVary", "std", this.prop("castChantVary") or 0, false)
        PropChange(this, "castKeepBase", "std", this.prop("castKeepBase") or 0, false)
        PropChange(this, "castKeepVary", "std", this.prop("castKeepVary") or 0, false)
    end)
---@param this Rect
Class("Rect")

    .public("handle",
    function(this)
        local h = this.__HANDLE__
        if (h == nil) then
            h = J.Rect(this.xMin(), this.xMax(), this.yMin(), this.yMax())
            href(this, h)
        end
        return h
    end)

    .public("isInside",
    function(this, ix, iy)
        if (this.prop("shape") == "square") then
            return (ix < this.xMax() and ix > this.xMin() and iy < this.yMax() and iy > this.yMin())
        elseif (this.prop("shape") == "round") then
            return 1 >= (((this.x() - ix) ^ 2) / ((this.width()) ^ 2) + ((this.y() - iy) ^ 2) / ((this.height() / 2) ^ 2))
        end
        return false
    end)

    .public("isBorder",
    function(this, ix, iy)
        if (this.prop("shape") == "square") then
            return ix >= this.xMax() or ix <= this.xMin() or iy >= this.yMax() or iy <= this.yMin()
        elseif (this.prop("shape") == "round") then
            return 1 < (((this.x() - ix) ^ 2) / ((this.width()) ^ 2) + ((this.y() - iy) ^ 2) / ((this.height() / 2) ^ 2))
        end
        return false
    end)
--
    .public("xMin",
    function(this)
        return this.prop("xMin")
    end)
    .public("yMin",
    function(this)
        return this.prop("yMin")
    end)
    .public("xMax",
    function(this)
        return this.prop("xMax")
    end)
    .public("yMax",
    function(this)
        return this.prop("yMax")
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("shape",
    function(this, modify)
        return this.prop("shape", modify)
    end)

    .public("x",
    function(this, modify)
        local res = this.prop("x", modify)
        this.reset()
        return res
    end)

    .public("y",
    function(this, modify)
        local res = this.prop("y", modify)
        this.reset()
        return res
    end)

    .public("width",
    function(this, modify)
        local res = this.prop("width", modify)
        this.reset()
        return res
    end)

    .public("height",
    function(this, modify)
        local res = this.prop("height", modify)
        this.reset()
        return res
    end)

    .public("weather",
    function(this, weatherType, duration)
        duration = duration or -1
        local w = Weather(this, weatherType)
        w.destroy(duration)
        return w
    end)
---@type fun(this:Destructable,key:string,value:any)
local reset = function(this, key, value)
    local prev = this.prop(key)
    if (prev == nil) then
        return
    end
    local dataCur = {
        modelId = this.modelId(),
        x = this.x(),
        y = this.y(),
        z = this.z(),
        facing = this.facing(),
        scale = this.scale(),
        variation = this.variation(),
        isInvulnerable = J.IsDestructableInvulnerable(this.__HANDLE__)
    }
    if (key and value) then
        dataCur[key] = value
    end
    J.RemoveDestructable(this.__HANDLE__)
    href(this, J.CreateDestructableZ(dataCur.modelId, dataCur.x, dataCur.y, dataCur.z, dataCur.facing, dataCur.scale, dataCur.variation))
    if (dataCur.isInvulnerable) then
        J.SetDestructableInvulnerable(this.__HANDLE__, true)
    end
end

---@param this Destructable
---@param resultStr string
---@param resultNum number
Class("Destructable")
    .exec("modelAlias",
    function(this, resultStr)
        must(SINGLUAR_MODEL_D[resultStr] ~= nil, "modelAliasNotExist")
        local id = slk.n2i("　" .. resultStr .. "　")
        if (id == nil) then
            return
        end
        PropChange(this, "modelAlias", "std", resultStr, false)
        PropChange(this, "modelId", "std", c2i(id), false)
        reset(this)
    end)
    .exec("z",
    function(this, resultNum)
        reset(this, "z", resultNum)
    end)
    .exec("facing",
    function(this, resultNum)
        reset(this, "facing", resultNum)
    end)
    .exec("scale",
    function(this, resultNum)
        reset(this, "scale", resultNum)
    end)
    .exec("occluderHeight",
    function(this, resultNum)
        J.SetDestructableOccluderHeight(this.__HANDLE__, resultNum)
    end)
    .exec("hp",
    function(this, resultNum)
        ---@type Unit
        if (resultNum >= 1e9) then
            resultNum = 1e9
        elseif (resultNum < 1) then
            resultNum = 1
        end
        local hp = this.hp()
        if (type(hp) ~= "number") then
            this.hpCur(resultNum)
        elseif (hp >= 1) then
            local cur = this.hpCur() or resultNum
            local percent = math.trunc(cur / hp)
            local val = math.max(1, math.max(0, percent) * resultNum)
            this.hpCur(val)
        end
    end)
    .exec("hpCur",
    function(this, resultNum)
        J.SetDestructableLife(this.__HANDLE__, resultNum)
    end)
---@param this Game
Class("Game")
    .construct(
    function(this, _)
        local qty = 0
        for i = 0, 11 do
            if ((J.GetPlayerController(J.Player(i)) == MAP_CONTROL_USER) and (J.GetPlayerSlotState(J.Player(i)) == PLAYER_SLOT_STATE_PLAYING)) then
                qty = qty + 1
            end
        end
        PropChange(this, "name", "std", SINGLUAR_MAP_NAME, false)
        PropChange(this, "description", "std", Array(), false)
        PropChange(this, "playingQuantityStart", "std", qty, false)
        PropChange(this, "playingQuantity", "std", qty, false)
        PropChange(this, "syncCallback", "std", {}, false)
        PropChange(this, "commands", "std", {}, false)
        PropChange(this, "worth", "std", Array(), false)
        PropChange(this, "abilityHotkey", "std", Array(), false) -- [技能]栏热键配置
        PropChange(this, "abilityLevelMax", "std", 0, false) -- [技能]最大等级数
        PropChange(this, "abilityExpFixed", "std", 0, false) -- [技能]每级需要经验固定值
        PropChange(this, "abilityExpRatio", "std", 0, false) -- [技能]每级需要经验对上一级提升百分比(默认固定提升)
        PropChange(this, "abilityExpLimit", "std", 0, false) -- [技能]每级需要经验上限
        PropChange(this, "itemHotkey", "std", 0, false) -- [物品]栏热键配置
        PropChange(this, "itemLevelMax", "std", 0, false) -- [物品]最大等级数
        PropChange(this, "itemExpFixed", "std", 0, false) -- [物品]每级需要经验固定值
        PropChange(this, "itemExpRatio", "std", 0, false) -- [物品]每级需要经验对上一级提升百分比(默认固定提升)
        PropChange(this, "itemExpLimit", "std", 0, false) -- [物品]每级需要经验上限
        PropChange(this, "itemKeyBoardRecord", "std", {}, false)
        PropChange(this, "unitLevelMax", "std", 0, false) -- [单位]最大等级数
        PropChange(this, "unitExpFixed", "std", 0, false) -- [单位]每级需要经验固定值
        PropChange(this, "unitExpRatio", "std", 0, false) -- [单位]每级需要经验对上一级提升百分比(默认固定提升)
        PropChange(this, "unitExpLimit", "std", 0, false) -- [单位]每级需要经验上限
        PropChange(this, "warehouseSlotMax", "std", 18, false) -- 玩家仓库容量(鉴于set,这里使用18为默认值)
        PropChange(this, "findPosition", "std", {}, false) -- 玩家仓库容量(鉴于set,这里使用18为默认值)
    end)
---@param this FrameBar
Class("FrameBar")

    .public("childTexture",
    function(this, side)
        return this.prop("childTexture_" .. side)
    end)

    .public("childText",
    function(this, layout)
        return this.prop("childTxt_" .. layout)
    end)

    .public("value",
    function(this, ratio, width, height)
        local w
        local h
        if (width or height or ratio or w or h) then
            if (width and height) then
                this.size(width, height)
                w = width - this.prop("borderOffset")
                h = height - this.prop("borderOffset")
                this.childTexture("value").size(w, h)
            end
            if (ratio and w and h) then
                ratio = math.min(1, ratio)
                ratio = math.max(0, ratio)
                if (ratio <= 0) then
                    this.childTexture("value").show(false)
                    this.childTexture("mark").size(w, h).show(true)
                else
                    local wv = w * (1 - ratio)
                    this.childTexture("value").show(true)
                    this.childTexture("mark").size(wv, h).show(wv > 0)
                end
            end
            return this
        end
        return this.prop("valueRatio") or 0
    end)

    .public("texture",
    function(this, side, modify)
        if (side == nil) then
            return this
        end
        if (side and modify) then
            this.childTexture(side).texture(modify)
            return this
        end
        return this.childTexture(side).texture()
    end)

    .public("textAlign",
    function(this, layout, modify)
        if (layout == nil) then
            return this
        end
        if (layout and modify) then
            this.childText(layout).textAlign(modify)
            return this
        end
        return this.childText(layout).textAlign()
    end)

    .public("fontSize",
    function(this, layout, modify)
        if (layout == nil) then
            return this
        end
        if (layout and modify) then
            this.childText(layout).fontSize(modify)
            return this
        end
        return this.childText(layout).fontSize()
    end)

    .public("text",
    function(this, layout, modify)
        if (layout == nil) then
            return this
        end
        if (layout and modify) then
            this.childText(layout).text(modify)
            return this
        end
        return this.childText(layout).text()
    end)
-- 配置游戏 - 物品栏热键
-- 这里使用魔兽的 78 45 12
Game().itemHotkey({ "Numpad7", "Numpad8", "Numpad4", "Numpad5", "Numpad1", "Numpad2" })

Game().itemUpgrade(99, 100, 1.00, 10000)

-- 配置游戏 - 玩家仓库
Game().warehouseSlot(18)

-- 定义物品技能描述体
-- [基础信息]
---@param this Ability
Game().defineDescription("itemAbility", function(this, options)
    local str = { '', this.name() .. ': ' }
    local lv = math.floor(this.level())
    local tt = this.targetType()
    local indent = '    '
    table.insert(str, indent .. '类型：%s')
    table.insert(options, { 'ffcc00', tt.label })
    if (tt ~= ABILITY_TARGET_TYPE.PAS) then
        local chantCast = this.castChant(lv)
        if (chantCast > 0) then
            table.insert(str, indent .. '吟唱时间：%s 秒')
            table.insert(options, { 'ccffff', chantCast })
        else
            table.insert(str, indent .. '吟唱时间：%s')
            table.insert(options, { 'ccffff', '瞬间施法' })
        end
        local keepCast = this.castKeep(lv)
        if (keepCast > 0) then
            table.insert(str, indent .. '最大施法持续：%s 秒')
            table.insert(options, { 'ccffff', keepCast })
        end
    end
    return colour.format(string.implode('|n', str), 'ee82ee', options)
end)

-- 定义物品描述体
-- [基础信息]
---@param this Item
Game().defineDescription("itemBase", function(this, _)
    local desc = {}
    local name
    if (this.level() > 0) then
        name = this.name() .. '[' .. colour.white(this.level()) .. ' 级]'
    else
        name = this.name()
    end
    if (isObject(this.ability(), "Ability")) then
        local tt = this.ability().targetType()
        if (isObject(this, "Item")) then
            if (tt ~= ABILITY_TARGET_TYPE.PAS and this.hotkey() ~= nil) then
                name = name .. '（' .. colour.gold(this.hotkey()) .. '）'
            end
            table.insert(desc, name)
        else
            table.insert(desc, name)
        end
        desc = table.merge(desc, Game().combineDescription(this.ability(), nil, "itemAbility", "<D>", "attributes"))
        if (this.charges() > 0) then
            table.insert(desc, colour.white("|n剩余次数：" .. this.charges()))
        end
    else
        table.insert(desc, name)
    end
    if (this.level() < this.levelMax()) then
        table.insert(desc, colour.format('最大可升级到 %s 级', 'c0c0c0', { { "ffcc00", this.levelMax() } }))
    end
    return desc
end)
---@param this Unit
Class("Unit")
    .inherit("UnitTpl")
    .construct(
    function(this, options)
        options.x = options.x or 0
        options.y = options.y or 0
        options.facing = options.facing or 270
        href(this, J.CreateUnit(options.owner.handle(), options.tpl.modelId(), options.x, options.y, options.facing))
        PropChange(this, "tpl", "std", options.tpl, false)
        PropChange(this, "weightCur", "std", 0, false)
        PropChange(this, "exp", "std", 0, false)
        PropChange(this, "isAlive", "std", true, false)
        PropChange(this, "owner", "std", options.owner, false)
        PropChange(this, "teamColor", "std", options.owner.teamColor(), false)
        PropChange(this, "movingStatus", "std", 0, false)
        PropChange(this, "movingStep", "std", 0, false)
        PropChange(this, "attackedTimers", "std", {}, false)
        setmetatable(this.__PROP__["0"].std, { __index = options.tpl.__PROP__["0"].std })
    end)
    .initial(
    function(this)
        group.push(this)
        --- TPL事件注册
        local onEvent = this.prop("onEvent")
        if (isArray(onEvent)) then
            onEvent.forEach(function(evt, value)
                event.register(this, evt, table.unpack(value))
            end)
            this.prop("onEvent", NIL)
        end
        --- 模版TPL转具体技能对象，并写入技能栏
        local as = AbilitySlot(this)
        local abilitySlot = this.prop("abilitySlot")
        if (type(abilitySlot) == "table") then
            for _, v in ipairs(abilitySlot) do
                if (isObject(v, "AbilityTpl")) then
                    as.push(Ability(v))
                end
            end
        end
        this.prop("abilitySlot", as)

        --- 模版TPL转具体物品对象，并写入物品栏
        local is = ItemSlot(this)
        local itemSlot = this.prop("itemSlot")
        if (type(itemSlot) == "table") then
            for _, v in ipairs(itemSlot) do
                if (isObject(v, "ItemTpl")) then
                    is.push(Item(v))
                end
            end
        end
        this.prop("itemSlot", is)
    end)
    .destroy(
    function(this)
        group.remove(this)
        this.prop("isAlive", false)
        local itemSlot = this.itemSlot()
        if (isObject(itemSlot, "ItemSlot")) then
            itemSlot.destroy()
            this.prop("itemSlot", NIL)
        end
        local abilitySlot = this.abilitySlot()
        if (isObject(abilitySlot, "AbilitySlot")) then
            abilitySlot.destroy()
            this.prop("abilitySlot", NIL)
        end
    end)

Class("Unit").afterInitial = function(this)
    event.trigger(this, EVENT.Unit.Born, { triggerUnit = this })
end
---@param this FrameAnimate
Class("FrameAnimate")

    .public("motion",
    function(this, modify)
        return this.prop("motion", modify)
    end)

    .public("duration",
    function(this, modify)
        if (type(modify) == "number" and modify > 0) then
            this.prop("duration", modify)
            ---@type Timer
            local stepTimer = this.prop("stepTimer")
            if (isObject(stepTimer, "Timer")) then
                if (stepTimer.prop("isInterval") == true) then
                    stepTimer.period(modify / #this.motion() - stepTimer.period())
                end
            end
            return this
        end
        return this.prop("duration")
    end)

    .public("halt",
    function(this, modify)
        return this.prop("halt", modify)
    end)

    .public("isPlaying",
    function(this)
        return isObject(this.prop("stepTimer"), "Timer")
    end)

    .public("play",
    function(this, isInterval, isReset)
        local stepTimer = this.prop("stepTimer")
        if (isObject(stepTimer, "Timer")) then
            stepTimer.destroy()
            stepTimer = nil
        end
        if (isReset == true) then
            this.prop("step", 0)
        end
        local m = this.motion()
        must(type(m) == "table" and #m > 0)
        local frequency = this.duration() / #m
        stepTimer = time.setInterval(frequency, function(curTimer)
            local motion = this.motion()
            if (motion == nil) then
                curTimer.destroy()
                return
            end
            local step = this.prop("step")
            step = step + 1
            if (motion[step] == nil) then
                if (isInterval ~= true or motion[1] == nil) then
                    curTimer.destroy()
                    this.prop("stepTimer", NIL)
                    this.prop("step", 0)
                    return
                end
                local halt = this.halt()
                if (halt > 0) then
                    curTimer.destroy()
                    this.prop("step", 0)
                    this.prop("stepTimer", time.setTimeout(halt, function()
                        this.prop("stepTimer", NIL)
                        this.play(isInterval, isReset)
                    end))
                    return
                end
                step = 1
            end
            this.prop("step", step)
            this.prop("stepTimer", stepTimer)
            this.texture(motion[step])
        end)
    end)

    .public("stop",
    function(this)
        local stepTimer = this.prop("stepTimer")
        if (isObject(stepTimer, "Timer")) then
            stepTimer.destroy()
            this.prop("stepTimer", NIL)
        end
    end)
---@param this FrameBar
Class("FrameBar")
    .inherit("FrameCustom")
    .construct(
    function(this, options)
        options.fdfName = options.fdfName or "SINGLUAR_BACKDROP"
        options.fdfType = "BACKDROP"
        options.borderOffset = options.borderOffset or 0
        PropChange(this, "borderOffset", "std", options.borderOffset, false)
    end)
    .initial(
    function(this)
        local fdfName = this.fdfName()
        if (fdfName == "SINGLUAR_BACKDROP") then
            japi.DzFrameSetTexture(this.__FRAME_ID__, "Singluar\\ui\\nil.tga", false)
        end
        --- 上下条层
        local t_value = FrameBackdrop(this.frameIndex() .. "->texture->value", this)
            .relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
            .texture(TEAM_COLOR_BLP_BLUE)
        local t_mark = FrameBackdropTile(this.frameIndex() .. "->texture->mark", this)
            .relation(FRAME_ALIGN_RIGHT, t_value, FRAME_ALIGN_RIGHT, 0, 0)
            .texture(TEAM_COLOR_BLP_BLACK)
        this.prop("childTexture_value", t_value)
        this.prop("childTexture_mark", t_mark)
        --- 9方文本
        for i = 1, 9 do
            local txt = FrameText(this.frameIndex() .. "->childText->" .. i, this)
            txt.fontSize(10)
            if (i == LAYOUT_ALIGN_LEFT_TOP) then
                txt.textAlign(TEXT_ALIGN_LEFT).relation(FRAME_ALIGN_LEFT_BOTTOM, this, FRAME_ALIGN_LEFT_TOP, 0, 0.001)
            elseif (i == LAYOUT_ALIGN_TOP) then
                txt.textAlign(TEXT_ALIGN_CENTER).relation(FRAME_ALIGN_BOTTOM, this, FRAME_ALIGN_TOP, 0, 0.001)
            elseif (i == LAYOUT_ALIGN_RIGHT_TOP) then
                txt.textAlign(TEXT_ALIGN_RIGHT).relation(FRAME_ALIGN_RIGHT_BOTTOM, this, FRAME_ALIGN_RIGHT_TOP, 0, 0.001)

            elseif (i == LAYOUT_ALIGN_LEFT) then
                txt.textAlign(TEXT_ALIGN_LEFT).relation(FRAME_ALIGN_LEFT, this, FRAME_ALIGN_LEFT, 0, 0)
            elseif (i == LAYOUT_ALIGN_CENTER) then
                txt.textAlign(TEXT_ALIGN_CENTER).relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
            elseif (i == LAYOUT_ALIGN_RIGHT) then
                txt.textAlign(TEXT_ALIGN_RIGHT).relation(FRAME_ALIGN_RIGHT, this, FRAME_ALIGN_RIGHT, 0, 0)

            elseif (i == LAYOUT_ALIGN_LEFT_BOTTOM) then
                txt.textAlign(TEXT_ALIGN_LEFT).relation(FRAME_ALIGN_LEFT_TOP, this, FRAME_ALIGN_LEFT_BOTTOM, 0, -0.001)
            elseif (i == LAYOUT_ALIGN_BOTTOM) then
                txt.textAlign(TEXT_ALIGN_CENTER).relation(FRAME_ALIGN_TOP, this, FRAME_ALIGN_BOTTOM, 0, -0.001)
            elseif (i == LAYOUT_ALIGN_RIGHT_BOTTOM) then
                txt.textAlign(TEXT_ALIGN_RIGHT).relation(FRAME_ALIGN_RIGHT_TOP, this, FRAME_ALIGN_RIGHT_BOTTOM, 0, -0.001)
            end
            this.prop("childTxt_" .. i, txt)
        end
    end)
---@param this FrameButton
Class("FrameButton")

    .public("size",
    function(this, w, h)
        if (w ~= nil and h ~= nil) then
            CLink(this, "Frame", "size", w, h)
            this.childHighLight().size(w, h)
            this.childBorder().size(w, h)
            this.maskValue(this.maskValue())
        end
        return CLink(this, "Frame", "size", w, h)
    end)

    .public("texture",
    function(this, modify)
        if (modify) then
            modify = AUIKit(this.kit(), modify, "tga")
        end
        return this.prop("texture", modify)
    end)

    .public("childHighLight",
    function(this)
        return this.prop("childHighLight")
    end)

    .public("childBorder",
    function(this)
        return this.prop("childBorder")
    end)

    .public("childMask",
    function(this)
        return this.prop("childMask")
    end)

    .public("childText",
    function(this)
        return this.prop("childText")
    end)

    .public("childHotkey",
    function(this)
        return this.prop("childHotkey")
    end)

    .public("border",
    function(this, modify)
        if (modify ~= nil) then
            this.childBorder().texture(modify)
            return this
        end
        return this.childBorder().texture()
    end)

    .public("mask",
    function(this, modify)
        if (modify ~= nil) then
            this.childMask().texture(modify)
            return this
        end
        return this.childMask().texture()
    end)

    .public("maskValue",
    function(this, modify)
        local s
        if (modify ~= nil) then
            s = this.prop("unAdaptiveSize")
            if (modify <= 0) then
                this.childMask().show(false)
            elseif (s ~= nil) then
                this.childMask().size(s[1], s[2] * modify).show(true)
            end
            return this
        end
        s = this.childMask().prop("unAdaptiveSize")
        if (s == nil) then
            return 0
        end
        return s[2] or 0
    end)

    .public("text",
    function(this, modify)
        if (modify ~= nil) then
            this.childText().text(modify)
            return this
        end
        return this.childText().text()
    end)

    .public("fontSize",
    function(this, modify)
        if (modify ~= nil) then
            this.childText().fontSize(modify)
            return this
        end
        return this.childText().fontSize()
    end)

    .public("hotkey",
    function(this, modify)
        if (modify ~= nil) then
            this.childHotkey().text(modify)
            return this
        end
        return this.childHotkey().text()
    end)

    .public("hotkeyFontSize",
    function(this, modify)
        if (modify ~= nil) then
            this.childHotkey().fontSize(modify)
            return this
        end
        return this.childHotkey().fontSize()
    end)  Class("FrameLabel")

    .public("autoSize",
    function(this, modify)
        return this.prop("autoSize", modify)
    end)

    .public("size",
    function(this, w, h)
        if (w ~= nil and h ~= nil) then
            if (this.autoSize() == true) then
                local tw = mbstring.viewWidth(this.childLabel().text(), this.childLabel().fontSize())
                if (tw <= 0) then
                    w = 0.03
                else
                    w = tw + h + 0.002
                end
            end
            CLink(this, "Frame", "size", w, h)
            local iw = h
            if (this.adaptive() ~= true) then
                iw = iw * 0.75
            end
            this.childHighLight().size(w, h)
            this.childIcon().size(iw, h)
            this.childLabel().size(w - iw - 0.001, h)
            return this
        end
        return CLink(this, "Frame", "size")
    end)

    .public("childHighLight",
    function(this)
        return this.prop("childHighLight")
    end)

    .public("childIcon",
    function(this)
        return this.prop("childIcon")
    end)

    .public("childLabel",
    function(this)
        return this.prop("childLabel")
    end)

    .public("side",
    function(this, modify)
        if (modify ~= nil) then
            if (modify == LAYOUT_ALIGN_RIGHT) then
                local ct = this.childIcon()
                ct.relation(FRAME_ALIGN_RIGHT_TOP, this, FRAME_ALIGN_RIGHT_TOP, 0, 0)
                this.childLabel().relation(FRAME_ALIGN_RIGHT, ct, FRAME_ALIGN_LEFT, -0.001, 0)
            else
                modify = LAYOUT_ALIGN_LEFT
                local ct = this.childIcon()
                ct.relation(FRAME_ALIGN_LEFT_TOP, this, FRAME_ALIGN_LEFT_TOP, 0, 0)
                this.childLabel().relation(FRAME_ALIGN_LEFT, ct, FRAME_ALIGN_RIGHT, 0.001, 0)
            end
            local _, updated = PROP(this, "side", modify)
            if (updated) then
                local s = this.prop("unAdaptiveSize")
                if (s ~= nil) then
                    this.size(s[1], s[2])
                end
            end
            return this
        end
        return this.prop("side")
    end)

    .public("texture",
    function(this, modify)
        return this.prop("texture", modify)
    end)

    .public("icon",
    function(this, modify)
        if (modify) then
            this.childIcon().texture(modify)
            return this
        end
        return this.childIcon().texture()
    end)

    .public("textAlign",
    function(this, modify)
        if (modify ~= nil) then
            this.childLabel().textAlign(modify)
            return this
        end
        return this.childLabel().textAlign()
    end)

    .public("fontSize",
    function(this, modify)
        if (modify ~= nil) then
            this.childLabel().fontSize(modify)
            return this
        end
        return this.childLabel().fontSize()
    end)

    .public("text",
    function(this, modify)
        if (modify ~= nil) then
            local _, updated = PROP(this.childLabel(), "text", modify)
            if (updated) then
                local s = this.prop("unAdaptiveSize")
                if (s ~= nil) then
                    this.size(s[1], s[2])
                end
            end
            return this
        end
        return this.childLabel().text()
    end)
---@param this Frame
Class("Frame")
    .construct(
    function(this, options)
        this.__FRAME_ID__ = options.frameId
        PropChange(this, "frameIndex", "std", options.frameIndex, false)
        PropChange(this, "parent", "std", options.parent, false)
        PropChange(this, "children", "std", Array(), false)
        PropChange(this, "show", "std", true, false)
        local kits = string.explode("->", options.frameIndex)
        PropChange(this, "kit", "std", tostring(kits[1]), false)
        PropChange(this, "evtList", "std", {}, false)
    end)
    .initial(
    function(this)
        if (view.isGameUI(this)) then
            this.prop("adaptive", false)
            this.prop("size", { 0.8, 0.6 })
            this.prop("anchor", { 0.4, 0.3, 0.8, 0.6 })
        else
            if (view._adaptiveFrames == nil) then
                view._adaptiveFrames = Array()
                local setting = {}
                window.onResize("frame_adaptive", function(evtData)
                    local pIdx = evtData.triggerPlayer.index()
                    if (isObject(setting[pIdx], "Timer")) then
                        setting[pIdx].remain(setting[pIdx].period())
                        return
                    end
                    setting[pIdx] = time.setTimeout(0.1, function()
                        setting[pIdx] = nil
                        ---@param value Frame
                        view._adaptiveFrames.forEach(function(_, value)
                            if (instanceof(value, "Frame")) then
                                if (true == value.adaptive()) then
                                    local s = value.prop("unAdaptiveSize")
                                    local r = value.prop("unAdaptiveRelation")
                                    if (type(s) == "table") then
                                        value.size(table.unpack(s))
                                    end
                                    if (type(r) == "table") then
                                        value.relation(table.unpack(r))
                                    end
                                end
                            end
                        end)
                    end)
                end)
            end
            view._adaptiveFrames.set(this.id(), this)
        end
        local parent = this.prop("parent")
        if (parent ~= nil) then
            local child = parent.prop("children")
            if (false == child.keyExists(this.id())) then
                child.set(this.id(), this)
                this.prop("adaptive", parent.adaptive())
            end
        end
    end)
    .destroy(
    function(this)
        if (isArray(view._adaptiveFrames)) then
            view._adaptiveFrames.set(this.id(), nil)
        end
        view.clearFrameEvent(this)
        local child = this.children()
        if (isArray(child)) then
            child.forEach(function(_, c)
                child.set(c.id(), nil)
                destroy(c)
            end, true)
            this.prop("children", NIL)
        end
        local parent = this.parent()
        if (parent ~= nil) then
            local pChild = parent.children()
            if (isArray(pChild)) then
                pChild.set(this.id(), nil)
            end
            this.prop("parent", NIL)
        end
        japi.DzDestroyFrame(this.__FRAME_ID__)
    end)                         local defaultData = function(_v)
    local dfd = {
        Art = "Singluar\\ui\\default.tga",
        unitSound = "",
        scale = 1.0,
        backSw1 = 0.3,
        dmgpt1 = 0.3,
        movetp = "foot",
        moveHeight = 0,
    }
    if (_v.isDef == true) then
        if (_SLK_ORIGIN_DATA[_v.file] ~= nil) then
            if (_SLK_ORIGIN_DATA[_v.file].unitSound ~= nil) then
                dfd.unitSound = _SLK_ORIGIN_DATA[_v.file].unitSound
            end
            if (_SLK_ORIGIN_DATA[_v.file].scale ~= nil) then
                dfd.scale = _SLK_ORIGIN_DATA[_v.file].scale
            end
            if (_SLK_ORIGIN_DATA[_v.file].backSw1 ~= nil) then
                dfd.backSw1 = _SLK_ORIGIN_DATA[_v.file].backSw1
            end
            if (_SLK_ORIGIN_DATA[_v.file].dmgpt1 ~= nil) then
                dfd.dmgpt1 = _SLK_ORIGIN_DATA[_v.file].dmgpt1
            end
            if (_SLK_ORIGIN_DATA[_v.file].movetp ~= nil) then
                dfd.movetp = _SLK_ORIGIN_DATA[_v.file].movetp
            end
            if (_SLK_ORIGIN_DATA[_v.file].moveHeight ~= nil) then
                dfd.moveHeight = _SLK_ORIGIN_DATA[_v.file].moveHeight
            end
        end
    end
    _v.isDef = nil
    return dfd
end

---@protected
_SET_UNIT = function(_v)
    _v._class = "unit"
    if (_v._parent == nil) then
        _v._parent = "nfrp"
    end
    local dfd = defaultData(_v)
    _v.goldcost = 0
    _v.lumbercost = 0
    _v.fmade = 0
    _v.fused = 0
    _v.regenMana = 0
    _v.regenHP = 0
    _v.regenType = "none"
    _v.tilesets = "*"
    _v.sides1 = 1
    _v.dice1 = 1
    _v.def = 0
    _v.HP = 1e4
    _v.manaN = 1e4
    _v.defType = "large"
    _v.Art = _v.Art or dfd.Art
    _v.unitSound = _v.unitSound or dfd.unitSound
    _v.unitShadow = _v.unitShadow or "ShadowFlyer"
    _v.scale = _v.scale or dfd.scale
    _v.dmgpt1 = _v.dmgpt1 or dfd.dmgpt1
    _v.backSw1 = _v.backSw1 or dfd.backSw1
    _v.castpt = _v.castpt or 0.1
    _v.castbsw = _v.castbsw or 0.1
    _v.targs1 = _v.targs1 or "vulnerable,ground,structure,organic,air" --攻击目标
    _v.movetp = _v.movetp or dfd.movetp
    _v.moveHeight = _v.moveHeight or dfd.moveHeight
    _v.spd = _v.spd or 10
    _v.rangeN1 = _v.rangeN1 or 100
    _v.acquire = _v.acquire or math.max(600, _v.rangeN1)
    _v.dmgplus1 = _v.dmgplus1 or 1
    _v.cool1 = _v.cool1 or 2.0
    _v.race = _v.race or "other"
    _v.sight = _v.sight or 1000
    _v.nsight = _v.nsight or math.floor(_v.sight / 2)
    _v.weapsOn = _v.weapsOn or 1
    _v.collision = _v.collision or 32
    if (_v.abilList == nil) then
        _v.abilList = ""
    else
        _v.abilList = _v.abilList
    end
    if (_v.weapsOn == 1) then
        _v.weapTp1 = "instant"
        _v.weapType1 = "" -- 攻击声音
        _v.Missileart_1 = "" -- 箭矢模型
        _v.Missilespeed_1 = 99999 -- 箭矢速度
        _v.Missilearc_1 = 0
    else
        _v.weapTp1 = ""
        _v.weapType1 = ""
        _v.Missileart_1 = ""
        _v.Missilespeed_1 = 0
        _v.Missilearc_1 = 0
    end
    return _v
end

---@protected
_SET_ABILITY = function(_v)
    _v._class = "ability"
    if (_v._parent == nil) then
        _v._parent = "ANcl"
    end
    return _v
end

---@protected
_SET_DESTRUCTABLE = function(_v)
    _v._class = "destructable"
    if (_v._parent == nil) then
        _v._parent = "BTsc"
    end
    _v.fogVis = _v.fogVis or 0
    _v.showInMM = _v.showInMM or 0
    return _v
end
               --- #单位 token
_unit({
    _parent = "ogru",
    Name = "F6S_UNIT_TOKEN",
    special = 1,
    abilList = "Avul,Aloc",
    upgrade = "",
    file = ".mdl",
    unitShadow = "",
    collision = 0,
    Art = "",
    movetp = "fly",
    moveHeight = 25.00,
    spd = 522,
    turnRate = 3.00,
    moveFloor = 25.00,
    weapsOn = 0,
    race = "other",
    fused = 0,
    sight = 0,
    nsight = 0,
    Builds = "",
    upgrades = "",
})

--- #单位死亡标志
_unit({
    _parent = "ogru",
    Name = "F6S_UNIT_TOKEN_DEATH",
    special = 1,
    abilList = "Avul,Aloc",
    upgrade = "",
    file = "Singluar\\clock_rune.mdl",
    unitShadow = "",
    collision = 0,
    Art = "",
    modelScale = 1.00,
    movetp = "fly",
    moveHeight = 30,
    moveFloor = 30,
    spd = 0,
    turnRate = 3.00,
    weapsOn = 0,
    race = "other",
    fused = 0,
    sight = 250,
    nsight = 250,
    Builds = "",
    upgrades = "",
    maxPitch = 0,
    maxRoll = 0,
})

-- #隐身
_ability({
    _parent = "Apiv",
    Name = "F6S_ABILITY_INVISIBLE",
    Tip = "隐身",
    Ubertip = "隐身",
    Art = "",
    hero = 0,
    race = "other",
    DataA = { 0 },
    Dur = { 0 },
    HeroDur = { 0 },
})

--- #叹号警示圈 直径128px
_unit({
    _parent = "ogru",
    Name = "F6S_TEXTURE_ALERT_CIRCLE_EXCLAMATION",
    special = 1,
    abilList = "Avul,Aloc",
    upgrade = "",
    file = "Singluar\\sign_exclamation.mdl",
    unitShadow = "",
    collision = 0,
    Art = "",
    modelScale = 0.12,
    movetp = "",
    moveHeight = 0,
    moveFloor = 0.00,
    spd = 0,
    turnRate = 3.00,
    weapsOn = 0,
    race = "other",
    fused = 0,
    sight = 250,
    nsight = 250,
    Builds = "",
    upgrades = "",
    red = 255,
    blue = 255,
    green = 255,
})

--- #叉号警示圈 直径128px
_unit({
    _parent = "ogru",
    Name = "F6S_TEXTURE_ALERT_CIRCLE_X",
    special = 1,
    abilList = "Avul,Aloc",
    upgrade = "",
    file = "Singluar\\sign_x.mdl",
    unitShadow = "",
    collision = 0,
    Art = "",
    modelScale = 0.12,
    movetp = "",
    moveHeight = 0,
    moveFloor = 0.00,
    spd = 0,
    turnRate = 3.00,
    weapsOn = 0,
    race = "other",
    fused = 0,
    sight = 250,
    nsight = 250,
    Builds = "",
    upgrades = "",
    red = 255,
    blue = 255,
    green = 255,
})

--- #JAPI_DELAY
_ability({
    _parent = "Aamk",
    Name = "F6S_JAPI_DELAY",
    Art = "",
    hero = 0,
    race = "other",
    item = 1,
    levels = 1,
    DataA = { 0 },
    DataB = { 0 },
    DataC = { 0 },
    DataD = { 1 },
})

--- #回避(伤害)+
_ability({
    _parent = "AIlf",
    Name = "F6S_ABILITY_AVOID_ADD",
    Art = "",
    levels = 2,
    DataA = { 0, -10000000 }
})

--- #回避(伤害)-
_ability({
    _parent = "AIlf",
    Name = "F6S_ABILITY_AVOID_SUB",
    Art = "",
    levels = 2,
    DataA = { 0, 10000000 }
})

--- #视野
local sightBase = { 1, 2, 3, 4, 5 }
local i = 1
while (i <= 1000) do
    for _, v in ipairs(sightBase) do
        v = math.floor(v * i)
        -- #视野+
        _ability({
            _parent = "AIsi",
            Name = "F6S_ABILITY_SIGHT_ADD_" .. v,
            Art = "",
            levels = 1,
            DataA = { 1 * v },
        })
        -- #视野-
        _ability({
            _parent = "AIsi",
            Name = "F6S_ABILITY_SIGHT_SUB_" .. v,
            Art = "",
            levels = 1,
            DataA = { -1 * v },
        })
    end
    i = i * 10
end
              GO_RESULT = {
    selection = "Common",
    font = "default",
    loading = "default",
    preview = "nil",
    font = "default",
    icons = {},
    textures = {},
    model = {},
    sound = {},
    ui = {},
    slk = {},
}
SLK_ID_ALREADY = {}

SLK_GO_INI = function(ini)
    local iniJson = json.decode(ini)
    for _, v in pairs(iniJson) do
        SLK_ID_ALREADY[v] = true
    end
end

SLK_GO_SET = function(data)
    for k, v in pairs(data) do
        if (type(v) == "function") then
            data[k] = nil
        end
    end
    table.insert(GO_RESULT.slk, data)
end

local idPrefix = {
    ability = "K",
    item = "I",
    unit = "V",
    destructable = "B",
}

local idLimit = 46655 -- zzz

local _convert

--- 10进制数字转2/8/10/16/36进制
---@param dec number
---@param cvt number 默认16;2|8|10|16|36
---@return string
function convert(dec, cvt)
    if (dec == 0) then
        return "0"
    end
    cvt = cvt or 16
    if (_convert == nil) then
        _convert = {
            [2] = string.split("01", 1),
            [8] = string.split("01234567", 1),
            [10] = string.split("0123456789", 1),
            [16] = string.split("0123456789ABCDEF", 1),
            [36] = string.split("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", 1),
        }
    end
    if (_convert[cvt] == nil) then
        return "0"
    end
    local numStr = ""
    while (dec ~= 0) do
        local yu = math.floor((dec % cvt) + 1)
        numStr = _convert[cvt][yu] .. numStr
        dec = math.floor(dec / cvt)
    end
    return numStr
end

SLK_ID_COUNT = {}
SLK_ID = function(_v)
    local _parent = _v._parent
    local _class = _v._class
    local _id_force = _v._id_force
    -- 如果自定义的ID可用，返回设定的ID
    if (_id_force ~= nil and string.len(_id_force) == 4 and true ~= SLK_ID_ALREADY[_id_force]) then
        local b = string.byte(_id_force, 1, 1)
        if (b >= 48 and b <= 57) then
            print("ID FORCE:<" .. _id_force .. "> The first character should not be a number!")
        else
            SLK_ID_ALREADY[_id_force] = true
            return _id_force
        end
    end
    local prefix = idPrefix[_class]
    if (prefix == nil) then
        prefix = "X"
    end
    if (SLK_ID_COUNT[prefix] == nil) then
        SLK_ID_COUNT[prefix] = 0
    end
    local sid
    while (true) do
        local id = convert(SLK_ID_COUNT[prefix], 36)
        SLK_ID_COUNT[prefix] = SLK_ID_COUNT[prefix] + 1
        if (SLK_ID_COUNT[prefix] > idLimit) then
            sid = "ZZZZ"
            break
        end
        if string.len(id) == 1 then
            id = "00" .. id
        elseif string.len(id) == 2 then
            id = "0" .. id
        end
        sid = prefix .. id
        if true ~= SLK_ID_ALREADY[sid] then
            SLK_ID_ALREADY[sid] = true
            break
        end
    end
    if (_class == "unit") then
        local p1st = string.sub(_parent, 1, 1)
        if (string.lower(p1st) == p1st) then
            sid = string.lower(sid)
        end
    end
    return sid
end

GO_RESULT_SELECTION = function()
    return GO_RESULT.selection
end
GO_RESULT_FONT = function()
    return GO_RESULT.font
end
GO_RESULT_LOADING = function()
    return GO_RESULT.loading
end
GO_RESULT_PREVIEW = function()
    return GO_RESULT.preview
end
GO_RESULT_ICONS = function()
    return json.encode(GO_RESULT.icons)
end
GO_RESULT_MODEL = function()
    return json.encode(GO_RESULT.model)
end
GO_RESULT_SOUND = function()
    return json.encode(GO_RESULT.sound)
end
GO_RESULT_UI = function()
    return json.encode(GO_RESULT.ui)
end
GO_RESULT_SLK = function()
    return json.encode(GO_RESULT.slk)
end
---@param this Store
Class("Store")

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("icon",
    function(this, modify)
        return this.prop("icon", modify)
    end)

    .public("salesPlayers",
    function(this, modify)
        if (modify ~= nil) then
            if (type(modify) ~= "table") then
                return this
            end
            this.prop("salesPlayers", modify)
        end
        return this.prop("salesPlayers")
    end)

    .public("salesGoods",
    function(this)
        return this.prop("salesGoods")
    end)

    .public("forEach",
    function(this, actionFunc)
        local goods = this.salesGoods()
        goods.forEach(function(key, value)
            promise(actionFunc, nil, nil, key, value)
        end)
    end)


    .public("push",
    function(this, goods, worth, stock, period, delay)
        local id = goods.id()
        if (worth == nil and isObject(goods, "ItemTpl")) then
            worth = goods.worth()
        end
        stock = math.floor(stock or 0)
        if (worth == nil or stock < 1) then
            return
        end
        period = period or 0
        delay = delay or 0
        ---@type Array
        local salesGoods = this.prop("salesGoods")
        salesGoods.set(id, {
            goods = goods,
            worth = worth,
            qty = stock,
            stock = stock,
            period = period,
            delay = delay,
        })
    end)

    .public("remove",
    function(this, goods)
        local id = goods.id()
        ---@type Array
        local salesGoods = this.prop("salesGoods")
        salesGoods.set(id, nil)
    end)

    .public("qty",
    function(this, goods, variety)
        local id = goods.id()
        ---@type Array
        local salesGoods = this.prop("salesGoods")
        local data = salesGoods.get(id)
        if (data ~= nil) then
            data.qty = math.cale(variety, data.qty)
            salesGoods.set(id, data)
            -- 只有自动补货需要补数量
            if (data.periodTimer == nil) then
                if (data.qty < data.stock and data.period > 0) then
                    data.periodTimer = time.setInterval(data.period, function(curTimer)
                        if (data.qty >= data.stock) then
                            curTimer.destroy()
                            data.periodTimer = nil
                            return
                        end
                        data.qty = data.qty + 1
                    end)
                end
            end
        end
    end)


    .public("sell",
    function(this, goods, qty, buyUnit)
        qty = math.floor(qty or 1)
        must(qty >= 1)
        must(isObject(buyUnit, "Unit"))
        local id = goods.id()
        ---@type Array
        local salesGoods = this.prop("salesGoods")
        local data = salesGoods.get(id)
        if (data == nil) then
            return
        end
        if (data.qty < qty) then
            buyUnit.owner().alert("可售数量不足", true)
            return
        end
        if (data.worth ~= nil) then
            if (Game().worthCompare(buyUnit.owner().worth(), data.worth) ~= true) then
                buyUnit.owner().alert("财力不足", true)
                return
            end
            -- 只有无限供应和自动补货需要扣数量
            if (data.period ~= 0) then
                this.qty("-=" .. qty)
            end
            buyUnit.owner().worth(data.worth, true)
        end
        event.trigger(this, EVENT.Store.Sell, { triggerStore = this, triggerUnit = buyUnit, qty = qty })
    end)
---@param this Ability
---@param resultNum number
---@param resultUnit Unit
---@param resultItem Item
---@param resultAttributes {string,number}[]
Class("Ability")
    .exec("attributes",
    function(this, resultAttributes)
        local eKey = "attributes"
        event.unregister(this, EVENT.Ability.Get, eKey)
        event.unregister(this, EVENT.Ability.Lose, eKey)
        event.unregister(this, EVENT.Ability.LevelChange, eKey)
        if (type(resultAttributes) == "table") then
            for i = #resultAttributes, 1, -1 do
                local method = resultAttributes[i][1]
                local base = resultAttributes[i][2]
                local vary = resultAttributes[i][3]
                if (type(method) ~= "string" or (base == nil and vary == nil)) then
                    table.remove(resultAttributes, i)
                end
            end
            ---@param getData noteOnAbilityGetData
            this.onEvent(EVENT.Ability.Get, eKey, function(getData)
                attribute.clever(resultAttributes, getData.triggerUnit, 0, getData.triggerAbility.level())
            end)
            ---@param loseData noteOnAbilityLoseData
            this.onEvent(EVENT.Ability.Lose, eKey, function(loseData)
                attribute.clever(resultAttributes, loseData.triggerUnit, loseData.triggerAbility.level(), -loseData.triggerAbility.level())
            end)
            ---@param lvcData noteOnAbilityLevelChangeData
            this.onEvent(EVENT.Ability.LevelChange, eKey, function(lvcData)
                attribute.clever(resultAttributes, lvcData.triggerUnit, lvcData.triggerAbility.level(), lvcData.value)
            end)
        end
    end)
    .exec("abilitySlotIndex",
    function(this, resultNum)
        PropChange(this, "hotkey", "std", Game().abilityHotkey(resultNum), false)
    end)
    .exec("bindUnit",
    function(this, resultUnit)
        if (isObject(resultUnit, "Unit")) then
            ---@type Unit
            local prev = this.prop("bindUnit")
            if (isObject(prev, "Unit") and prev.id() ~= resultUnit.id()) then
                prev.abilitySlot().remove(this.abilitySlotIndex())
                this.prop("bindUnit", NIL)
            end
        end
    end)
    .exec("bindItem",
    function(this, resultItem)
        if (isObject(resultItem, "Item")) then
            ---@type Item
            local prev = this.prop("bindItem")
            if (isObject(prev, "Item") and prev.id() ~= resultItem.id()) then
                prev.prop("bindAbility", NIL)
                this.prop("bindItem", NIL)
            end
        end
    end)
    .exec("exp",
    function(this, resultNum)
        local prevLv = this.level() or 0
        if (prevLv >= 1) then
            local lv = 0
            for i = Game().abilityLevelMax(), 1, -1 do
                if (resultNum >= Game().abilityExpNeeds(i)) then
                    lv = i
                    break
                end
            end
            if (lv ~= prevLv) then
                this.level(lv)
            end
        end
    end)
    .exec("level",
    function(this, resultNum)
        local prevLv = this.level()
        if (resultNum ~= prevLv) then
            local bu = this.bindUnit()
            event.trigger(this, EVENT.Ability.LevelChange, { triggerAbility = this, triggerUnit = bu, value = resultNum - prevLv })
            event.trigger(bu, EVENT.Ability.LevelChange, { triggerAbility = this, triggerUnit = bu, resultNum - prevLv })
            if ((this.exp() or 0) > 0) then
                if ((resultNum > 1 and resultNum > prevLv) or resultNum < prevLv) then
                    PropChange(this, "exp", "std", Game().abilityExpNeeds(resultNum), false)
                end
            end
        end
    end)
---@param this Team
Class("Team")

    .public("nameSync",
    function(this, modify)
        return this.prop("nameSync", modify)
    end)

    .public("colorSync",
    function(this, modify)
        return this.prop("colorSync", modify)
    end)

    .public("name",
    function(this, modify)
        local prev = this.prop("name")
        if (modify == nil) then
            return prev
        end
        if (prev ~= modify) then
            this.prop("name", modify)
            if (true == this.nameSync()) then
                local ms = this.members()
                if (#ms > 0) then
                    for _, i in ipairs(ms) do
                        if (modify) then
                            Player(i).name(modify)
                        end
                    end
                end
            end
        end
        return this
    end)

    .public("color",
    function(this, modify)
        local prev = this.prop("color")
        if (modify == nil) then
            return prev
        end
        if (prev ~= modify) then
            this.prop("color", modify)
            if (true == this.colorSync()) then
                local ms = this.members()
                if (#ms > 0) then
                    if (modify) then
                        for _, i in ipairs(ms) do
                            Player(i).teamColor(modify)
                        end
                    end
                end
            end
        end
        return this
    end)

    .public("members",
    function(this, modify)
        if (modify ~= nil) then
            if (type(modify) ~= "table") then
                return this
            end
            local pls = {}
            local c, mn
            if (this.colorSync()) then
                c = this.color()
            end
            if (this.colorSync()) then
                mn = this.name()
            end
            for _, m in ipairs(modify) do
                if (type(m) == "number") then
                    if (false == table.includes(pls, m)) then
                        table.insert(pls, m)
                        if (c ~= nil) then
                            Player(m).teamColor(c)
                        end
                        if (mn ~= nil) then
                            Player(m).name(mn)
                        end
                    end
                end
            end
            this.prop("members", pls)
            -- 联盟
            if (#pls > 0) then
                for _, i in ipairs(pls) do
                    for _, j in ipairs(pls) do
                        if (i ~= j) then
                            alliance.ally(Player(i), Player(j), true)
                            alliance.vision(Player(i), Player(j), true)
                            alliance.control(Player(i), Player(j), false)
                            alliance.fullControl(Player(i), Player(j), false)
                        end
                    end
                end
            end
            return this
        end
        return this.prop("members")
    end)

    .public("unit",
    function(this, tpl, x, y, facing)
        local ms = this.members()
        must(#ms > 0)
        local counter = this.prop("counter")
        local i = 0
        local c = 101
        for _, m in ipairs(ms) do
            if (counter[m] == nil) then
                counter[m] = 0
                i = m
                break
            end
            if (counter[m] < c) then
                i = m
                c = counter[m]
            end
        end
        counter[i] = counter[i] + 1
        if (counter[i] >= 100) then
            for _, m in ipairs(ms) do
                counter[m] = 0
            end
        end
        local u = Player(i).unit(tpl, x, y, facing)
        if (u) then
            u.teamColor(this.color())
        end
        return u
    end)   -- 事件反应
---@param u Unit
local function _z(u, offset)
    return u.h() + 130 + offset
end

---@param evtData noteOnUnitCritData
event.reaction(EVENT.Unit.Crit, function(evtData)
    evtData.targetUnit.attach("singluar_crit", "origin", 0.5, 1)
    ttg.model({
        model = "singluar_ttg_crit",
        size = 1.4,
        x = evtData.targetUnit.x(),
        y = evtData.targetUnit.y(),
        z = _z(evtData.targetUnit, -24),
        height = 50,
        speed = 0.5,
        duration = 0.8,
    })
end)
---@param evtData noteOnUnitAvoidData
event.reaction(EVENT.Unit.Avoid, function(evtData)
    evtData.triggerUnit.attach("singluar_ttg_avoid", "overhead", 0.3, 0.2)
end)
---@param evtData noteOnUnitImmuneInvincibleData
event.reaction(EVENT.Unit.ImmuneInvincible, function(evtData)
    evtData.triggerUnit.attach("DivineShieldTarget", "origin", 1)
    ttg.model({
        model = "singluar_ttg_immuneInvincible",
        size = 1.4,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitImmuneDefendData
event.reaction(EVENT.Unit.ImmuneDefend, function(evtData)
    ttg.model({
        model = "singluar_ttg_immune",
        size = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitImmuneReductionData
event.reaction(EVENT.Unit.ImmuneReduction, function(evtData)
    ttg.model({
        model = "singluar_ttg_immune",
        size = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitHPSuckAttackData
event.reaction(EVENT.Unit.HPSuckAttack, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnUnitHPSuckAbilityData
event.reaction(EVENT.Unit.HPSuckAbility, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnUnitMPSuckAttackData
event.reaction(EVENT.Unit.MPSuckAttack, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnUnitMPSuckAbilityData
event.reaction(EVENT.Unit.MPSuckAbility, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnUnitPunishData
event.reaction(EVENT.Unit.Punish, function(evtData)
    evtData.triggerUnit.rgba(140, 140, 140, 255, evtData.duration)
    evtData.triggerUnit.attach("singluar_ttg_punish", "head", 4.9, 0.2)
end)
---@param evtData noteOnUnitBeStunData
event.reaction(EVENT.Unit.Be.Stun, function(evtData)
    evtData.triggerUnit.attach("ThunderclapTarget", "overhead", evtData.duration)
end)
---@param evtData noteOnUnitBeSplitData
event.reaction(EVENT.Unit.Be.Split, function(evtData)
    evtData.triggerUnit.effect("SpellBreakerAttack", 0)
end)
---@param evtData noteOnUnitBeSplitSpreadData
event.reaction(EVENT.Unit.Be.SplitSpread, function(evtData)
    evtData.triggerUnit.effect("CleaveDamageTarget", 0)
end)
---@param evtData noteOnUnitHurtData
event.reaction(EVENT.Unit.Hurt, function(evtData)
    ttg.word({
        str = math.floor(evtData.damage),
        width = 7,
        size = 0.4,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, 0),
        height = 250,
        duration = 0.5,
    })
end)
---@param evtData noteOnUnitEnchantData
event.reaction(EVENT.Unit.Enchant, function(evtData)
    ttg.model({
        model = "singluar_ttg_e_" .. evtData.enchantType,
        size = 1.1,
        x = evtData.targetUnit.x() - math.rand(50, 100),
        y = evtData.targetUnit.y() - math.rand(50, 100),
        z = _z(evtData.targetUnit, -24),
        height = 200,
        speed = 0.5,
        duration = 0.5,
    })
end)
---@param this WarehouseSlot
Class("WarehouseSlot")

    .public("bindPlayer",
    function(this)
        return this.prop("bindPlayer")
    end)

    .public("storage",
    function(this, modify)
        return this.prop("storage", modify)
    end)

    .public("empty",
    function(this)
        local number = 0
        local storage = this.storage()
        for i = 1, Game().warehouseSlot(), 1 do
            if (false == isObject(storage[i], "Item")) then
                number = number + 1
            end
        end
        return number
    end)

    .public("push",
    function(this, whichItem, index)
        ---@type Item
        local it
        if (isObject(whichItem, "Item")) then
            it = whichItem
        elseif (isObject(whichItem, "ItemTpl")) then
            it = Item(whichItem)
        end
        must(isObject(it, "Item"))
        local storage = this.storage()
        local bp = this.bindPlayer()
        if (index == nil) then
            if (it.bindPlayer() == bp) then
                return
            end
            for i = 1, Game().warehouseSlot(), 1 do
                if (storage[i] == nil) then
                    index = i
                    break
                end
            end
            if (index == nil) then
                bp.alert(colour.gold("仓库已满"))
                return
            end
        end
        must(type(index) == "number")
        if (it.instance() == true) then
            it.instance(false)
        end
        if (it.bindUnit() ~= nil) then
            if (it.itemSlotIndex() ~= nil) then
                it.bindUnit().itemSlot().remove(it.itemSlotIndex())
            end
            it.prop("bindUnit", NIL)
        end
        if (it.ability() ~= nil) then
            it.ability().prop("bindUnit", NIL)
        end
        local prev = storage[index]
        if (isObject(prev, "Item")) then
            local swap = 0
            for i = 1, Game().warehouseSlot(), 1 do
                if (storage[i] == it) then
                    swap = i
                    break
                end
            end
            if (swap > 0) then
                -- 交换物品的情况
                storage[swap] = prev.warehouseSlotIndex(swap)
                storage[index] = it.bindPlayer(bp).warehouseSlotIndex(index)
            else
                local replace = 0
                for i = 1, Game().warehouseSlot(), 1 do
                    if (storage[i] == nil) then
                        replace = i
                        break
                    end
                end
                if (replace > 0) then
                    -- 挤开物品的情况
                    storage[replace] = prev.bindPlayer(bp).warehouseSlotIndex(replace)
                else
                    -- 删除物品的情况
                    this.remove(index)
                end
                storage[index] = it.bindPlayer(bp).warehouseSlotIndex(index)
            end
        else
            if (it.bindPlayer() == bp) then
                if (it.warehouseSlotIndex() ~= index) then
                    storage[it.warehouseSlotIndex()] = nil
                    storage[index] = it.bindPlayer(bp).warehouseSlotIndex(index)
                end
            else
                storage[index] = it.bindPlayer(bp).warehouseSlotIndex(index)
            end
        end
        this.storage(storage)
    end)

    .public("remove",
    function(this, index)
        local storage = this.storage()
        if (type(index) == "number" and index > 0 and index <= Game().warehouseSlot() and isObject(storage[index], "Item")) then
            storage[index].prop("warehouseSlotIndex", NIL)
            storage[index].prop("bindPlayer", NIL)
            storage[index] = nil
        end
    end)

    .public("drop",
    function(this, index, x, y)
        local storage = this.storage()
        if (isObject(storage[index], "Item") == false) then
            return
        end
        storage[index].drop(x, y)
        storage[index] = nil
    end)
---@param this Attribute
Class("Attribute")
    .initial(
    function(this)
        PropChange(this, "missile", "std", this.prop("missile") or {}, false)
        PropChange(this, "lightning", "std", this.prop("lightning") or {}, false)
        PropChange(this, "reborn", "std", this.prop("reborn") or -999, false)
        PropChange(this, "hp", "std", this.prop("hp") or 0, false)
        PropChange(this, "hpCur", "std", this.prop("hpCur") or 0, false)
        PropChange(this, "hpRegen", "std", this.prop("hpRegen") or 0, false)
        PropChange(this, "hpSuckAttack", "std", this.prop("hpSuckAttack") or 0, false)
        PropChange(this, "hpSuckAbility", "std", this.prop("hpSuckAbility") or 0, false)
        PropChange(this, "mp", "std", this.prop("mp") or 0, false)
        PropChange(this, "mpCur", "std", this.prop("mpCur") or 0, false)
        PropChange(this, "mpRegen", "std", this.prop("mpRegen") or 0, false)
        PropChange(this, "mpSuckAttack", "std", this.prop("mpSuckAttack") or 0, false)
        PropChange(this, "mpSuckAbility", "std", this.prop("mpSuckAbility") or 0, false)
        PropChange(this, "sightBase", "std", this.prop("sightBase") or 0, false)
        PropChange(this, "sightDiff", "std", this.prop("sightDiff") or 0, false)
        PropChange(this, "sight", "std", this.prop("sight") or 0, false)
        PropChange(this, "nsight", "std", this.prop("nsight") or 0, false)
        PropChange(this, "attack", "std", this.prop("attack") or 0, false)
        PropChange(this, "attackSpaceBase", "std", this.prop("attackSpaceBase") or 0, false)
        PropChange(this, "attackSpace", "std", this.prop("attackSpace") or 0, false)
        PropChange(this, "attackSpeed", "std", this.prop("attackSpeed") or 0, false)
        PropChange(this, "attackRangeAcquire", "std", this.prop("attackRangeAcquire") or 0, false)
        PropChange(this, "attackRange", "std", this.prop("attackRange") or 0, false)
        PropChange(this, "attackRipple", "std", this.prop("attackRipple") or 0, false)
        PropChange(this, "defend", "std", this.prop("defend") or 0, false)
        PropChange(this, "move", "std", this.prop("move") or 0, false)
        PropChange(this, "str", "std", this.prop("str") or 0, false)
        PropChange(this, "agi", "std", this.prop("agi") or 0, false)
        PropChange(this, "int", "std", this.prop("int") or 0, false)
        PropChange(this, "cure", "std", this.prop("cure") or 0, false)
        PropChange(this, "avoid", "std", this.prop("avoid") or 0, false)
        PropChange(this, "aim", "std", this.prop("aim") or 0, false)
        PropChange(this, "punish", "std", this.prop("punish") or 0, false)
        PropChange(this, "punishCur", "std", this.prop("punishCur") or 0, false)
        PropChange(this, "punishRegen", "std", this.prop("punishRegen") or 0, false)
        PropChange(this, "weight", "std", this.prop("weight") or 0, false)
        PropChange(this, "weightCur", "std", this.prop("weightCur") or 0, false)
        PropChange(this, "hurtIncrease", "std", this.prop("hurtIncrease") or 0, false)
        PropChange(this, "hurtReduction", "std", this.prop("hurtReduction") or 0, false)
        PropChange(this, "hurtRebound", "std", this.prop("hurtRebound") or 0, false)
        PropChange(this, "damageIncrease", "std", this.prop("damageIncrease") or 0, false)
        PropChange(this, "crit", "std", this.prop("crit") or 0, false)
        PropChange(this, "cost", "std", this.prop("cost") or 0, false)
        PropChange(this, "castChant", "std", this.prop("castChant") or 0, false)
        PropChange(this, "coolDown", "std", this.prop("coolDown") or 0, false)
        PropChange(this, "coolDownSec", "std", this.prop("coolDownSec") or 0, false)
        -- 默认各附魔强化和抵抗
        enchant.types.forEach(function(key, value)
            if (value.strengthen ~= 0 and this.enchant(key) == 0) then
                this.enchant(key, value.strengthen)
            end
            if (value.resistance ~= 0 and this.enchantResistance(key) == 0) then
                this.enchantResistance(key, value.resistance)
            end
        end)
    end)
---@param this ItemTpl
Class("ItemTpl")

    .private("onEvent",
    function(this, evt, ...)
        ---@type Array
        local onEvent = this.prop("onEvent")
        if (onEvent == nil) then
            onEvent = {}
            this.prop("onEvent", onEvent)
        end
        table.insert(onEvent, { evt, ... })
        return this
    end)

    .private("onUnitEvent",
    function(this, evt, ...)
        ---@type Array
        local onUnitEvent = this.prop("onUnitEvent")
        if (onUnitEvent == nil) then
            onUnitEvent = {}
            this.prop("onUnitEvent", onUnitEvent)
        end
        table.insert(onUnitEvent, { evt, ... })
        return this
    end)

    .public("attributes",
    function(this, modify)
        return this.prop("attributes", modify)
    end)

    .private("ability",
    function(this, modify)
        if (isObject(modify, "AbilityTpl")) then
            this.prop("ability", modify)
            return this
        end
        return this.prop("ability")
    end)

    .public("instance",
    function(this, modify)
        return this.prop("instance", modify)
    end)

    .public("modelId",
    function(this)
        return this.prop("modelId")
    end)

    .public("modelAlias",
    function(this, alias)
        return this.prop("modelAlias", alias)
    end)

    .public("modelScale",
    function(this, modify)
        return this.prop("modelScale", modify)
    end)

    .public("animateScale",
    function(this, modify)
        return this.prop("animateScale", modify)
    end)

    .public("collision",
    function(this, modify)
        return this.prop("collision", modify)
    end)

    .public("class",
    function(this, modify)
        return this.prop("class", modify)
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("icon",
    function(this, modify)
        return this.prop("icon", AIcon(modify))
    end)

    .public("period",
    function(this, modify)
        return this.prop("period", modify)
    end)

    .public("consumable",
    function(this, modify)
        return this.prop("consumable", modify)
    end)

    .public("pawnable",
    function(this, modify)
        return this.prop("pawnable", modify)
    end)

    .public("dropable",
    function(this, modify)
        return this.prop("dropable", modify)
    end)

    .public("charges",
    function(this, modify)
        return this.prop("charges", modify)
    end)

    .public("levelMax",
    function(this, modify)
        return this.prop("levelMax", modify)
    end)

    .public("level",
    function(this, modify)
        return this.prop("level", modify)
    end)

    .public("worth",
    function(this, modify)
        return this.prop("worth", modify)
    end)

    .public("description",
    function(this, modify)
        if (type(modify) == "table") then
            return this.prop("description", modify)
        end
        local description = this.prop("description")
        if (type(description) ~= "table") then
            return nil
        end
        local desc = {}
        for _, d in ipairs(description) do
            local ms = string.subBetween(d, '{', '}')
            if (#ms > 0) then
                for _, m in ipairs(ms) do
                    local allow = true
                    if (string.subPos(m[3], "bindPlayer()") ~= false) then
                        if (this.bindPlayer == nil or isObject(this.bindPlayer(), "Player") == false) then
                            allow = false
                        end
                    end
                    if (string.subPos(m[3], "bindUnit()") ~= false) then
                        if (this.bindUnit == nil or isObject(this.bindUnit(), "Unit") == false) then
                            allow = false
                        end
                    end
                    local d1 = string.sub(d, 1, m[1])
                    local d2 = string.sub(d, m[2])
                    if (allow) then
                        local l = load("return function(this) return (" .. m[3] .. ") end")
                        local to = tostring(l()(this))
                        d = d1 .. to .. d2
                    else
                        d = d1 .. d2
                    end
                end
            end
            table.insert(desc, d)
        end
        return desc
    end)
---@param this UnitTpl
Class("UnitTpl")

    .private("onEvent",
    function(this, evt, ...)
        ---@type Array
        local onEvent = this.prop("onEvent")
        if (onEvent == nil) then
            onEvent = {}
            this.prop("onEvent", onEvent)
        end
        table.insert(onEvent, { evt, ... })
        return this
    end)

    .public("attributes",
    function(this, modify)
        return this.prop("attributes", modify)
    end)

    .private("abilitySlot",
    function(this, modify)
        if (type(modify) == "table") then
            local ms = {}
            for _, m in ipairs(modify) do
                if (isObject(m, "AbilityTpl")) then
                    table.insert(ms, m)
                end
            end
            this.prop("abilitySlot", ms)
            return this
        end
        return this.prop("abilitySlot")
    end)

    .private("itemSlot",
    function(this, modify)
        if (type(modify) == "table") then
            local ms = {}
            for _, m in ipairs(modify) do
                if (isObject(m, "ItemTpl")) then
                    table.insert(ms, m)
                end
            end
            this.prop("itemSlot", ms)
            return this
        end
        return this.prop("itemSlot")
    end)

    .public("modelId",
    function(this)
        return this.prop("modelId")
    end)

    .public("modelAlias",
    function(this, alias)
        return this.prop("modelAlias", alias)
    end)

    .public("modelScale",
    function(this, modify)
        return this.prop("modelScale", modify)
    end)

    .public("animateScale",
    function(this, modify)
        return this.prop("animateScale", modify)
    end)

    .public("turnSpeed",
    function(this, modify)
        return this.prop("turnSpeed", modify)
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("properName",
    function(this, modify)
        return this.prop("properName", modify)
    end)

    .public("rgba",
    function(this, red, green, blue, alpha, duration)
        local modify
        if (type(red) == "number" or type(green) == "number" or type(blue) == "number" or type(alpha) == "number") then
            return this.prop("rgba", { red, green, blue, alpha }, duration)
        end
        return this.prop("rgba", modify)
    end)

    .public("icon",
    function(this, modify)
        return this.prop("icon", AIcon(modify))
    end)

    .public("material",
    function(this, modify)
        return this.prop("material", modify)
    end)

    .public("weaponSound",
    function(this, modify)
        return this.prop("weaponSound", modify)
    end)

    .public("moveType",
    function(this, modify)
        return this.prop("moveType", modify)
    end)

    .public("stature",
    function(this, modify)
        return this.prop("stature", modify)
    end)

    .public("period",
    function(this, modify)
        return this.prop("period", modify)
    end)

    .public("primary",
    function(this, modify)
        return this.prop("primary", modify)
    end)

    .public("flyHeight",
    function(this, modify)
        return this.prop("flyHeight", modify)
    end)

    .public("collision",
    function(this, modify)
        return this.prop("collision", modify)
    end)

    .public("levelMax",
    function(this, modify)
        return this.prop("levelMax", modify)
    end)

    .public("level",
    function(this, modify)
        return this.prop("level", modify)
    end)

    .public("abilityPoint",
    function(this, modify)
        return this.prop("abilityPoint", modify)
    end)

    .public("description",
    function(this, modify)
        if (type(modify) == "table") then
            return this.prop("description", modify)
        end
        local description = this.prop("description")
        if (type(description) ~= "table") then
            return nil
        end
        local desc = {}
        for _, d in ipairs(description) do
            local ms = string.subBetween(d, '{', '}')
            if (#ms > 0) then
                for _, m in ipairs(ms) do
                    local d1 = string.sub(d, 1, m[1])
                    local d2 = string.sub(d, m[2])
                    local l = load("return function(this) return (" .. m[3] .. ") end")
                    local to = tostring(l()(this))
                    d = d1 .. to .. d2
                end
            end
            table.insert(desc, d)
        end
        return desc
    end)
---@param this Camera
Class("Camera")

    .public("x",
    function()
        return J.GetCameraTargetPositionX()
    end)
    .public("y",
    function()
        return J.GetCameraTargetPositionY()
    end)
    .public("z",
    function()
        return J.GetCameraTargetPositionZ()
    end)

    .public("isShaking",
    function(this)
        return this.superposition("shake") > 0
    end)

    .public("isQuaking",
    function(this)
        return this.superposition("quake") > 0
    end)

    .public("reset",
    function(this, duration)
        J.CameraSetSourceNoise(0, 0)
        J.CameraSetTargetNoise(0, 0)
        J.ResetToGameCamera(duration)
        return this
    end)

    .public("quickPosition",
    function(_, x, y)
        J.SetCameraQuickPosition(x, y)
    end)

    .public("to",
    function(_, x, y, duration)
        duration = duration or 0
        J.PanCameraToTimed(x, y, duration)
    end)

    .public("farZ",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_FARZ)
        if (modify) then
            PropChange(this, "farZ", "std", v, false)
            return this.prop("farZ", modify)
        end
        return v
    end)

    .public("zOffset",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_ZOFFSET)
        if (modify) then
            PropChange(this, "zOffset", "std", v, false)
            return this.prop("zOffset", modify)
        end
        return v
    end)

    .public("fov",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_FIELD_OF_VIEW)
        if (modify) then
            PropChange(this, "fov", "std", v, false)
            return this.prop("fov", modify)
        end
        return math._r2d * v
    end)

    .public("xTra",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK)
        if (modify) then
            PropChange(this, "xTra", "std", v, false)
            return this.prop("xTra", modify)
        end
        return math._r2d * v
    end)

    .public("yTra",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_ROLL)
        if (modify) then
            PropChange(this, "yTra", "std", v, false)
            return this.prop("yTra", modify)
        end
        return math._r2d * v
    end)

    .public("zTra",
    function(this, modify)
        local v = J.GetCameraField(CAMERA_FIELD_ROTATION)
        if (modify) then
            PropChange(this, "zTra", "std", v, false)
            return this.prop("zTra", modify)
        end
        return math._r2d * v
    end)

    .public("distance",
    function(this, modify)
        local v = math.floor(J.GetCameraField(CAMERA_FIELD_TARGET_DISTANCE))
        if (modify) then
            PropChange(this, "distance", "std", v, false)
            return this.prop("distance", modify)
        end
        return v
    end)

    .public("follow",
    function(this, whichUnit)
        return this.prop("follow", whichUnit)
    end)

    .public("shake",
    function(this, magnitude, velocity, duration)
        magnitude = magnitude or 0
        velocity = velocity or 0
        duration = math.trunc(duration or 0, 2)
        if (magnitude <= 0 or velocity <= 0 or duration <= 0) then
            return
        end
        this.superposition("shake", "+=1")
        J.CameraSetTargetNoise(magnitude, velocity)
        time.setTimeout(duration, function()
            this.superposition("shake", "-=1")
            if (false == this.isShaking()) then
                J.CameraSetTargetNoise(0, 0)
            end
        end)
    end)

    .public("quake",
    function(this, magnitude, duration)
        magnitude = magnitude or 0
        duration = math.trunc(duration or 0, 2)
        if (magnitude <= 0 or duration <= 0) then
            return
        end
        local richter = magnitude
        if (richter > 5) then
            richter = 5
        end
        if (richter < 2) then
            richter = 2
        end
        this.superposition("quake", "+=1")
        J.CameraSetTargetNoiseEx(magnitude * 2, magnitude * (10 ^ richter), true)
        J.CameraSetSourceNoiseEx(magnitude * 2, magnitude * (10 ^ richter), true)
        time.setTimeout(duration, function()
            this.superposition("quake", "-=1")
            if (false == this.isQuaking()) then
                J.CameraSetSourceNoise(0, 0)
                if (false == this.isShaking()) then
                    J.CameraSetTargetNoise(0, 0)
                end
            end
        end)
    end)
---@param this AbilitySlot
Class("AbilitySlot")

    .public("bindUnit",
    function(this)
        return this.prop("bindUnit")
    end)

    .public("storage",
    function(this, modify)
        if (modify) then
            local tail
            for i = #Game().abilityHotkey(), 1, -1 do
                if (modify[i] ~= nil) then
                    tail = i
                    break
                end
            end
            if (tail > this.prop("tail")) then
                this.prop("tail", tail)
            end
        end
        return this.prop("storage", modify)
    end)

    .public("empty",
    function(this)
        local number = 0
        local storage = this.storage()
        for i = 1, #Game().abilityHotkey(), 1 do
            if (false == isObject(storage[i], "Ability")) then
                number = number + 1
            end
        end
        return number
    end)

    .public("tail",
    function(this)
        return this.prop("tail")
    end)

    .public("push",
    function(this, whichAbility, index)
        ---@type Ability
        local ab
        if (isObject(whichAbility, "Ability")) then
            ab = whichAbility
        elseif (isObject(whichAbility, "AbilityTpl")) then
            ab = Ability(whichAbility)
        end
        must(isObject(ab, "Ability"))
        local storage = this.storage()
        local bu = this.bindUnit()
        if (index == nil) then
            if (ab.bindUnit() == bu) then
                return
            end
            for i = 1, #Game().abilityHotkey() do
                if (storage[i] == nil) then
                    index = i
                    break
                end
            end
        end
        must(type(index) == "number")
        local prev = storage[index]
        if (isObject(prev, "Ability")) then
            local swap = 0
            for i = 1, #Game().abilityHotkey() do
                if (storage[i] == ab) then
                    swap = i
                    break
                end
            end
            if (swap > 0) then
                -- 交换技能的情况
                storage[swap] = prev.bindUnit(this.bindUnit()).abilitySlotIndex(swap)
                storage[index] = ab.bindUnit(this.bindUnit()).abilitySlotIndex(index)
            else
                local replace = 0
                for i = 1, #Game().abilityHotkey() do
                    if (storage[i] == nil) then
                        replace = i
                        break
                    end
                end
                if (replace > 0) then
                    -- 挤开技能的情况
                    storage[replace] = prev.bindUnit(this.bindUnit()).abilitySlotIndex(replace)
                else
                    -- 删除技能的情况
                    this.remove(index)
                end
                storage[index] = ab.bindUnit(this.bindUnit()).abilitySlotIndex(index)
                event.trigger(ab, EVENT.Ability.Get, { triggerUnit = this.bindUnit(), triggerAbility = ab })
                event.trigger(this.bindUnit(), EVENT.Ability.Get, { triggerUnit = this.bindUnit(), triggerAbility = ab })
            end
        else
            if (ab.bindUnit() == this.bindUnit()) then
                for i = 1, #Game().abilityHotkey() do
                    if (storage[i] == ab) then
                        storage[i] = nil
                        break
                    end
                end
                storage[index] = ab.bindUnit(this.bindUnit()).abilitySlotIndex(index)
            else
                storage[index] = ab.bindUnit(this.bindUnit()).abilitySlotIndex(index)
                event.trigger(storage[index], EVENT.Ability.Get, { triggerUnit = this.bindUnit(), triggerAbility = storage[index] })
                event.trigger(this.bindUnit(), EVENT.Ability.Get, { triggerUnit = this.bindUnit(), triggerAbility = storage[index] })
            end
        end
        this.storage(storage)
    end)

    .public("remove",
    function(this, index)
        local storage = this.storage()
        if (type(index) == "number" and index > 0 and index <= #Game().abilityHotkey() and isObject(storage[index], "Ability")) then
            event.trigger(storage[index], EVENT.Ability.Lose, { triggerUnit = this.bindUnit(), triggerAbility = storage[index] })
            event.trigger(this.bindUnit(), EVENT.Ability.Lose, { triggerUnit = this.bindUnit(), triggerAbility = storage[index] })
            storage[index].prop("abilitySlotIndex", NIL)
            storage[index].prop("bindUnit", NIL)
            storage[index] = nil
        end
    end)
---@param this ItemSlot
Class("ItemSlot")

    .public("bindUnit",
    function(this)
        return this.prop("bindUnit")
    end)

    .public("storage",
    function(this, modify)
        return this.prop("storage", modify)
    end)

    .public("empty",
    function(this)
        local number = 0
        local storage = this.storage()
        for i = 1, #Game().itemHotkey(), 1 do
            if (false == isObject(storage[i], "Item")) then
                number = number + 1
            end
        end
        return number
    end)

    .public("push",
    function(this, whichItem, index)
        ---@type Item
        local it
        if (isObject(whichItem, "Item")) then
            it = whichItem
        elseif (isObject(whichItem, "ItemTpl")) then
            it = Item(whichItem)
        end
        must(isObject(it, "Item"))
        local storage = this.storage()
        local bu = this.bindUnit()
        if (index == nil) then
            if (it.bindUnit() == bu) then
                return
            end
            for i = 1, #Game().itemHotkey(), 1 do
                if (storage[i] == nil) then
                    index = i
                    break
                end
            end
            if (index == nil) then
                bu.owner().alert("背包已满已移至个人仓库", false)
                bu.owner().warehouseSlot().push(whichItem)
                return
            end
        end
        must(type(index) == "number")
        if (it.instance() == true) then
            it.instance(false)
        end
        local prev = storage[index]
        if (isObject(prev, "Item")) then
            local swap = 0
            for i = 1, #Game().itemHotkey(), 1 do
                if (storage[i] == it) then
                    swap = i
                    break
                end
            end
            if (swap > 0) then
                -- 交换物品的情况
                storage[swap] = prev.bindUnit(bu).itemSlotIndex(swap)
                storage[index] = it.bindUnit(bu).itemSlotIndex(index)
            else
                local replace = 0
                for i = 1, #Game().itemHotkey(), 1 do
                    if (storage[i] == nil) then
                        replace = i
                        break
                    end
                end
                if (replace > 0) then
                    -- 挤开物品的情况
                    storage[replace] = prev.bindUnit(bu).itemSlotIndex(replace)
                else
                    -- 删除物品的情况
                    this.remove(index)
                end
                storage[index] = it.bindUnit(bu).itemSlotIndex(index)
                event.trigger(it, EVENT.Item.Get, { triggerItem = it, triggerUnit = bu })
                event.trigger(bu, EVENT.Item.Get, { triggerItem = it, triggerUnit = bu })
            end
        else
            if (it.bindUnit() == bu) then
                if (it.itemSlotIndex() ~= index) then
                    storage[it.itemSlotIndex()] = nil
                    storage[index] = it.bindUnit(bu).itemSlotIndex(index)
                end
            else
                storage[index] = it.bindUnit(bu).itemSlotIndex(index)
                event.trigger(storage[index], EVENT.Item.Get, { triggerItem = storage[index], triggerUnit = bu })
                event.trigger(bu, EVENT.Item.Get, { triggerItem = storage[index], triggerUnit = bu })
            end
        end
    end)

    .public("remove",
    function(this, index)
        local storage = this.storage()
        if (type(index) == "number" and index > 0 and index <= #Game().itemHotkey() and isObject(storage[index], "Item")) then
            local bu = this.bindUnit()
            event.trigger(storage[index], EVENT.Item.Lose, { triggerItem = storage[index], triggerUnit = bu })
            event.trigger(bu, EVENT.Item.Lose, { triggerItem = storage[index], triggerUnit = bu })
            storage[index].prop("itemSlotIndex", NIL)
            storage[index].prop("bindUnit", NIL)
            storage[index] = nil
        end
    end)

    .public("drop",
    function(this, index, x, y)
        local storage = this.storage()
        if (isObject(storage[index], "Item") == false) then
            return
        end
        if (x == nil or y == nil) then
            if (isObject(this.bindUnit(), "Unit")) then
                x = this.bindUnit().x()
                y = this.bindUnit().y()
            else
                x = 0
                y = 0
            end
        end
        storage[index].drop(x, y)
        storage[index] = nil
    end)

    .public("dropAll",
    function(this, x, y)
        for i = 1, #Game().itemHotkey() do
            this.drop(i, x, y)
        end
    end)
---@param this Player
Class("Player")
    .construct(
    function(this, options)
        href(this, J.Player(options.index - 1))
        PropChange(this, "warehouseSlot", "std", WarehouseSlot(this), false)
        PropChange(this, "index", "std", options.index, false) -- 玩家索引[1-16]
        PropChange(this, "mapLv", "std", math.max(1, japi.DzAPI_Map_GetMapLevel(this.__HANDLE__) or 1), false)
        PropChange(this, "isRedVip", "std", japi.DzAPI_Map_IsRedVIP(this.__HANDLE__) or false, false)
        PropChange(this, "isBlueVip", "std", japi.DzAPI_Map_IsBlueVIP(this.__HANDLE__) or false, false)
        PropChange(this, "isPlatformVIP", "std", japi.DzAPI_Map_IsPlatformVIP(this.__HANDLE__) or false, false)
        PropChange(this, "dzMallItem", "std", {}, false)
        PropChange(this, "dead", "std", 0, false)
        PropChange(this, "kill", "std", 0, false)
        PropChange(this, "hurt", "std", 0, false)
        PropChange(this, "damage", "std", 0, false)
        PropChange(this, "apm", "std", 0, false)
        PropChange(this, "isUser", "std", J.GetPlayerController(this.__HANDLE__) == MAP_CONTROL_USER, false)
        local isComputer = J.GetPlayerController(this.__HANDLE__) == MAP_CONTROL_COMPUTER or J.GetPlayerSlotState(this.__HANDLE__) ~= PLAYER_SLOT_STATE_PLAYING
        PropChange(this, "isComputer", "std", isComputer, false)
        PropChange(this, "name", "std", J.GetPlayerName(this.__HANDLE__), false)
        PropChange(this, "teamColor", "std", options.index, false)
        PropChange(this, "worth", "std", {}, false)
        PropChange(this, "prestige", "std", "-", false)
        PropChange(this, "sell", "std", 50, false)
        PropChange(this, "chatPattern", "std", Array(), false)
        --叠加态(叠加态可以轻松管理可叠层的状态控制)
        this.superposition("hurt", 0) --受到伤害态
        this.superposition("damage", 0) --造成伤害态
        this.superposition("mark", 0) --贴图显示态
        --
        local playerRace = J.GetPlayerRace(this.__HANDLE__)
        if (playerRace == RACE_UNDEAD or playerRace == RACE_PREF_UNDEAD or playerRace == RACE_DEMON or playerRace == RACE_PREF_DEMON) then
            playerRace = RACE_UNDEAD_NAME
        elseif (playerRace == RACE_NIGHTELF or playerRace == RACE_PREF_NIGHTELF) then
            playerRace = RACE_NIGHTELF_NAME
        elseif (playerRace == RACE_ORC or playerRace == RACE_PREF_ORC) then
            playerRace = RACE_ORC_NAME
        else
            playerRace = RACE_HUMAN_NAME
        end
        PropChange(this, "race", "std", playerRace, false)

        local playerSlotState = J.GetPlayerSlotState(this.__HANDLE__)
        if (playerSlotState == PLAYER_SLOT_STATE_EMPTY) then
            playerSlotState = PLAYER_STATUS.empty
        elseif (playerSlotState == PLAYER_SLOT_STATE_PLAYING) then
            playerSlotState = PLAYER_STATUS.playing
        elseif (playerSlotState == PLAYER_SLOT_STATE_LEFT) then
            playerSlotState = PLAYER_STATUS.leave
        end
        PropChange(this, "status", "std", playerSlotState, false)

        J.SetPlayerHandicapXP(this.__HANDLE__, 0) -- 经验置0
        event.pool(player.evtDead, function(tgr)
            J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_DEATH, nil)
        end)
        event.pool(player.evtAttacked, function(tgr)
            J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_ATTACKED, nil)
        end)
        event.pool(player.evtOrder, function(tgr)
            J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, nil)
            J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
            J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_ISSUED_ORDER, nil)
        end)
        if (false == isComputer) then
            event.pool(player.evtLeave, function(tgr)
                J.TriggerRegisterPlayerEvent(tgr, this.__HANDLE__, EVENT_PLAYER_LEAVE)
            end)
            event.pool(player.evtEsc, function(tgr)
                J.TriggerRegisterPlayerEvent(tgr, this.__HANDLE__, EVENT_PLAYER_END_CINEMATIC)
            end)
            event.pool(player.evtChat, function(tgr)
                J.TriggerRegisterPlayerChatEvent(tgr, this.__HANDLE__, "", false)
            end)
            event.pool(player.evtSelection, function(tgr)
                J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_SELECTED, nil)
            end)
            event.pool(player.evtDeSelection, function(tgr)
                J.TriggerRegisterPlayerUnitEvent(tgr, this.__HANDLE__, EVENT_PLAYER_UNIT_DESELECTED, nil)
            end)
        end
    end)

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
---@param this FrameList
Class("FrameList")

    .public("show",
    function(this, modify)
        if (type(modify) == "boolean") then
            for _, t in ipairs(this.childTexts()) do
                local sgOpt = t.prop("showGradient")
                if (type(sgOpt) == "table") then
                    t.showGradient(modify, sgOpt)
                else
                    t.show(modify)
                end
            end
            return CLink(this, "Frame", "show", modify)
        end
        return CLink(this, "Frame", "show")
    end)

    .public("childTexts",
    function(this, index)
        local ct = this.prop("childTexts")
        if (type(index) == "number") then
            return ct[index]
        end
        return ct
    end)

    .public("childButtons",
    function(this, index)
        local cb = this.prop("childButtons")
        if (type(index) == "number") then
            return cb[index]
        end
        return cb
    end)

    .public("max",
    function(this)
        return this.prop("max")
    end)

    .public("direction",
    function(this, modify)
        return this.prop("direction", modify)
    end)

    .public("fontSize",
    function(this, modify)
        if (modify ~= nil) then
            for _, t in ipairs(this.childTexts()) do
                t.fontSize(modify)
            end
            this.prop("fontSize", modify)
            return this
        end
        return this.prop("fontSize")
    end)

    .public("onMouseLeftClick",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        for i, b in ipairs(this.childButtons()) do
            if (type(func) == "function") then
                b.onMouseLeftClick(key, function(evtData)
                    evtData.key = b.prop("key") or i
                    func(evtData)
                end)
            else
                b.onMouseLeftClick(key, nil)
            end
        end
        return this
    end)

    .public("onMouseEnter",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        for i, b in ipairs(this.childButtons()) do
            if (type(func) == "function") then
                b:onMouseEnter(key, function(evtData)
                    evtData.key = b.prop("key") or i
                    func(evtData)
                end)
            else
                b.onMouseEnter(key, nil)
            end
        end
        return this
    end)

    .public("onMouseLeave",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        for i, b in ipairs(this.childButtons()) do
            if (type(func) == "function") then
                b:onMouseLeave(key, function(evtData)
                    evtData.key = b.prop("key") or i
                    func(evtData)
                end)
            else
                b.onMouseLeave(key, nil)
            end
        end
        return this
    end)

    .public("content",
    function(this, data)
        if (type(data) ~= "table") then
            return
        end
        local _max = this.max()
        local fs = this.fontSize()
        local lineWidth = 0
        local lineHeight = mbstring.viewHeight(1, fs)
        local tr = {}
        local mi = 0
        for i = 1, _max, 1 do
            tr[i] = ''
            if (data[i] ~= nil and type(data[i].text) == "string" and data[i].text ~= '') then
                mi = mi + 1
                tr[i] = data[i].text
                local vw = mbstring.viewWidth(tr[i], fs)
                if (vw > lineWidth) then
                    lineWidth = vw
                end
            end
        end
        local dct = this.direction()
        if (dct == "horizontal") then
            this.size(lineWidth * mi, lineHeight)
        else
            this.size(lineWidth, lineHeight * _max)
        end
        for i = 1, _max, 1 do
            local txt = this.childTexts(i)
            local btn = this.childButtons(i)
            if (data[i] == nil) then
                txt.text("")
                btn.show(false)
            else
                if (data[i].showGradient ~= nil) then
                    txt.prop("showGradient", data[i].showGradient)
                else
                    txt.prop("showGradient", NIL)
                end
                if (data[i].key ~= nil) then
                    btn.prop("key", data[i].key)
                else
                    btn.prop("key", NIL)
                end
                if (type(data[i].texture) == "string") then
                    btn.texture(data[i].texture)
                else
                    btn.texture("Singluar\\ui\\nil.tga")
                end
                if (type(data[i].textAlign) == "number") then
                    txt.textAlign(data[i].textAlign)
                end
                txt.text(tr[i])
                txt.size(lineWidth, lineHeight)
                if (dct == "horizontal") then
                    txt.relation(FRAME_ALIGN_LEFT, this, FRAME_ALIGN_LEFT, lineWidth * (i - 1), 0)
                else
                    txt.relation(FRAME_ALIGN_TOP, this, FRAME_ALIGN_TOP, 0, -lineHeight * (i - 1))
                end
                btn.size(lineWidth, lineHeight)
                btn.show(true)
            end
        end
        return this
    end)
---@param this UnitTpl
Class("UnitTpl")
    .inherit("Attribute")
    .construct(
    function(this, options)
        local modelAlias = this.prop("modelAlias")
        if (modelAlias == nil) then
            modelAlias = options.modelAlias
            PropChange(this, "modelAlias", "std", modelAlias, false)
        end
        local id = slk.n2i(modelAlias .. "|U")
        local uSlk = slk.i2v(id)
        local movetp = UNIT_MOVE_TYPE.foot
        if (uSlk.slk.movetp == "amph") then
            movetp = UNIT_MOVE_TYPE.amphibious
        elseif (uSlk.slk.movetp == "fly") then
            movetp = UNIT_MOVE_TYPE.fly
        elseif (uSlk.slk.movetp == "float") then
            movetp = UNIT_MOVE_TYPE.float
        end
        local name = modelAlias
        PropChange(this, "hp", "std", this.prop("hp") or 1e4, false)
        PropChange(this, "hpCur", "std", this.prop("hpCur") or 1e4, false)
        PropChange(this, "mp", "std", this.prop("mp") or 1e4, false)
        PropChange(this, "mpCur", "std", this.prop("mpCur") or 1e4, false)
        PropChange(this, "animateScale", "std", this.prop("animateScale") or 1, false)
        PropChange(this, "turnSpeed", "std", this.prop("turnSpeed") or 1, false)
        PropChange(this, "properName", "std", this.prop("properName") or "", false)
        PropChange(this, "material", "std", this.prop("material") or UNIT_MATERIAL.flesh, false)
        PropChange(this, "stature", "std", this.prop("stature") or 50, false)
        PropChange(this, "period", "std", this.prop("period") or -1, false)
        PropChange(this, "levelMax", "std", this.prop("levelMax") or Game().unitLevelMax(), false)
        PropChange(this, "level", "std", this.prop("level") or 0, false)
        PropChange(this, "abilityPoint", "std", this.prop("abilityPoint") or 0, false)
        PropChange(this, "sightBase", "std", this.prop("sightBase") or math.floor(uSlk.slk.sight), false)
        PropChange(this, "sightDiff", "std", this.prop("sightDiff") or math.floor(uSlk.slk.sight - math.floor(uSlk.slk.nsight)), false)
        PropChange(this, "sight", "std", this.prop("sight") or math.floor(uSlk.slk.sight), false)
        PropChange(this, "nsight", "std", this.prop("nsight") or math.floor(uSlk.slk.nsight), false)
        PropChange(this, "attackSpaceBase", "std", this.prop("attackSpaceBase") or math.floor(uSlk.slk.cool1 or 0), false)
        PropChange(this, "attackRangeAcquire", "std", this.prop("attackRangeAcquire") or math.floor(uSlk.slk.acquire), false)
        PropChange(this, "attackRange", "std", this.prop("attackRange") or math.floor(uSlk.slk.rangeN1 or 0), false)
        PropChange(this, "move", "std", this.prop("move") or math.floor(uSlk.slk.spd or 0), false)
        PropChange(this, "modelId", "std", this.prop("modelId") or c2i(id), false)
        PropChange(this, "modelScale", "std", this.prop("modelScale") or math.trunc(uSlk.slk.modelScale or 1, 2), false)
        PropChange(this, "name", "std", this.prop("name") or name, false)
        PropChange(this, "rgba", "std", this.prop("rgba") or { math.floor(uSlk.slk.red), math.floor(uSlk.slk.green), math.floor(uSlk.slk.blue), 255 }, false)
        PropChange(this, "moveType", "std", this.prop("moveType") or movetp, false)
        PropChange(this, "flyHeight", "std", this.prop("flyHeight") or math.floor(uSlk.slk.moveHeight or 0), false)
        PropChange(this, "collision", "std", this.prop("collision") or math.floor(uSlk.slk.collision or 0), false)
        PropChange(this, "icon", "std", this.prop("icon") or uSlk.slk.Art or "Singluar\\ui\\default.tga", false)
        PropChange(this, "scale", "std", this.prop("scale") or math.trunc(uSlk.slk.scale or 1, 2), false)
        PropChange(this, "isAttackAble", "std", true, false)
        --叠加态(叠加态可以轻松管理可叠层的状态控制)
        local s = "<SUPERPOSITION>"
        PropChange(this, s .. "collision", "std", this.prop(s .. "collision") or 1, false) --可碰撞
        PropChange(this, s .. "attack", "std", this.prop(s .. "attack") or 1, false) --可攻击
        PropChange(this, s .. "select", "std", this.prop(s .. "select") or 1, false) --可选择
        PropChange(this, s .. "invulnerable", "std", this.prop(s .. "invulnerable") or 0, false) --无敌
        PropChange(this, s .. "invisible", "std", this.prop(s .. "invisible") or 0, false) --隐身
        PropChange(this, s .. "pause", "std", this.prop(s .. "pause") or 0, false) --暂停态
        PropChange(this, s .. "show", "std", this.prop(s .. "show") or 1, false) --显示态
        PropChange(this, s .. "hurt", "std", this.prop(s .. "hurt") or 0, false) --受到伤害态
        PropChange(this, s .. "damage", "std", this.prop(s .. "damage") or 0, false) --造成伤害态
        PropChange(this, s .. "stun", "std", this.prop(s .. "stun") or 0, false) --眩晕态
        PropChange(this, s .. "punish", "std", this.prop(s .. "punish") or 0, false) --硬直态
        PropChange(this, s .. "silent", "std", this.prop(s .. "silent") or 0, false) --沉默态
        PropChange(this, s .. "unArm", "std", this.prop(s .. "unArm") or 0, false) --缴械态
        PropChange(this, s .. "crackFly", "std", this.prop(s .. "crackFly") or 0, false) --击飞态
        PropChange(this, s .. "leap", "std", this.prop(s .. "leap") or 0, false) --冲锋态
        PropChange(this, s .. "whirlwind", "std", this.prop(s .. "whirlwind") or 0, false) --剑刃风暴态
    end)

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

---@param this Item
---@param resultNum number
---@param resultBool boolean
---@param resultStr string
---@param resultAbility Ability
---@param resultUnit Unit
Class("Item")
    .exec("bindUnit",
    function(this, resultUnit)
        if (isObject(resultUnit, "Unit")) then
            ---@type Unit
            local prev = this.prop("bindUnit")
            if (isObject(prev, "Unit") and prev.id() ~= resultUnit.id()) then
                prev.itemSlot().remove(this.itemSlotIndex())
                this.prop("bindUnit", NIL)
            end
        end
    end)
    .exec("attributes",
    function(this, resultAttributes)
        local eKey = "attributes"
        event.unregister(this, EVENT.Item.Get, eKey)
        event.unregister(this, EVENT.Item.Lose, eKey)
        event.unregister(this, EVENT.Item.LevelChange, eKey)
        if (type(resultAttributes) == "table") then
            for i = #resultAttributes, 1, -1 do
                local method = resultAttributes[i][1]
                local base = resultAttributes[i][2]
                local vary = resultAttributes[i][3]
                if (type(method) ~= "string" or (base == nil and vary == nil)) then
                    table.remove(resultAttributes, i)
                end
            end
            ---@param getData noteOnItemGetData
            this.onEvent(EVENT.Item.Get, eKey, function(getData)
                attribute.clever(resultAttributes, getData.triggerUnit, 0, getData.triggerItem.level())
            end)
            ---@param loseData noteOnItemLoseData
            this.onEvent(EVENT.Item.Lose, eKey, function(loseData)
                attribute.clever(resultAttributes, loseData.triggerUnit, loseData.triggerItem.level(), -loseData.triggerItem.level())
            end)
            ---@param lvcData noteOnItemLevelChangeData
            this.onEvent(EVENT.Item.LevelChange, eKey, function(lvcData)
                attribute.clever(resultAttributes, lvcData.triggerUnit, lvcData.triggerItem.level(), lvcData.value)
            end)
        end
    end)
    .exec("itemSlotIndex",
    function(this, resultNum)
        this.prop("hotkey", Game().itemHotkey(resultNum))
        local ab = this.prop("bindAbility")
        if (isObject(ab, "Ability")) then
            ab.prop("hotkey", Game().itemHotkey(resultNum))
        end
    end)
    .exec("ability",
    function(this, resultAbility)
        if (isObject(resultAbility, "Ability")) then
            ---@type Ability
            local prev = this.prop("ability")
            if (isObject(prev, "Ability") and prev.id() ~= resultAbility.id()) then
                prev.prop("bindItem", NIL)
            end
            resultAbility.bindItem(this)
        end
    end)
    .exec("instance",
    function(this, resultBool)
        local cur = this.__HANDLE__
        if (resultBool == true) then
            if (cur == nil) then
                local x = this.prop("x")
                local y = this.prop("y")
                cur = J.CreateUnit(PlayerPassive.handle(), this.modelId(), x, y, 270)
                href(this, cur)
                japi.EXSetUnitMoveType(cur, 0x00)
                group.push(this)
            end
        else
            if (cur ~= nil) then
                href(this, nil)
                Game().freePosition(this.prop("x"), this.prop("y"))
                this.prop("x", NIL)
                this.prop("y", NIL)
                group.remove(this)
            end
        end
        this.cls()
    end)
    .exec("modelAlias",
    function(this, resultStr)
        if (this.__HANDLE__ ~= nil) then
            japi.DzSetUnitID(this.__HANDLE__, c2i(slk.n2i(resultStr .. "|I")))
        end
    end)
    .exec("modelScale",
    function(this, resultNum)
        if (this.__HANDLE__ ~= nil) then
            J.SetUnitScale(this.__HANDLE__, resultNum, resultNum, resultNum)
        end
    end)
    .exec("animateScale",
    function(this, resultNum)
        if (this.__HANDLE__ ~= nil) then
            J.SetUnitTimeScale(this.__HANDLE__, resultNum)
        end
    end)
    .exec("period",
    function(this, resultNum)
        if (isObject(this.prop("periodTimer"), "Timer")) then
            this.prop("periodTimer").destroy()
            this.prop("periodTimer", NIL)
        end
        if (resultNum > 0) then
            this.prop("periodTimer", time.setTimeout(resultNum, function()
                this.prop("periodTimer", NIL)
                if (this.__HANDLE__ ~= nil) then
                    href(this, nil)
                end
            end))
        end
    end)
    .exec("exp",
    function(this, resultNum)
        local prevLv = this.prop("level") or 0
        if (prevLv >= 1) then
            local lv = 0
            for i = Game().itemLevelMax(), 1, -1 do
                if (resultNum >= Game().itemExpNeeds(i)) then
                    lv = i
                    break
                end
            end
            if (lv ~= prevLv) then
                this.level(lv)
            end
        end
    end)
    .exec("level",
    function(this, resultNum)
        local prevLv = this.prop("level") or 0
        if (resultNum ~= prevLv) then
            local bu = this.bindUnit()
            event.trigger(this, EVENT.Item.LevelChange, { triggerItem = this, triggerUnit = bu, value = resultNum - prevLv })
            event.trigger(bu, EVENT.Item.LevelChange, { triggerItem = this, triggerUnit = bu, resultNum - prevLv })
            local ab = this.ability()
            if isObject(ab, "Ability") then
                if (resultNum <= ab.levelMax() and ab.level() ~= resultNum) then
                    ab.level(resultNum)
                end
            end
            if ((this.exp() or 0) > 0) then
                if ((resultNum > 1 and resultNum > prevLv) or resultNum < prevLv) then
                    PropChange(this, "exp", "std", Game().itemExpNeeds(resultNum), false)
                end
            end
        end
    end)       Class("Frame")

    .public("handle",
    function(this)
        return this.__FRAME_ID__
    end)

    .public("frameIndex",
    function(this)
        return this.prop("frameIndex")
    end)

    .public("kit",
    function(this)
        return this.prop("kit")
    end)

    .public("adaptive",
    function(this, modify)
        if (type(modify) == "boolean") then
            this.prop("adaptive", modify)
            local cs = this.children()
            if (#cs > 0) then
                for _, c in ipairs(cs) do
                    local adap = c.adaptive()
                    c.adaptive(modify)
                    if (adap ~= modify) then
                        local rel = c.relation()
                        if (type(rel) == "table") then
                            c.relation(table.unpack(rel))
                        end
                        local s = c.size()
                        if (type(s) == "table") then
                            c.size(table.unpack(s))
                        end
                    end
                end
            end
            return this
        end
        return this.prop("adaptive")
    end)

    .public("anchor",
    function(this)
        return this.prop("anchor")
    end)

    .public("parent",
    function(this, modify)
        if (view.isGameUI(this)) then
            -- 游戏UI禁止
            return
        end
        local p = this.prop("parent")
        if (modify ~= nil and modify ~= p) then
            local c = p.prop("children")
            table.delete(c, this)
            c = modify.prop("children")
            if (false == table.includes(c, this)) then
                table.insert(c, this)
                this.prop("adaptive", modify.adaptive())
            end
            this.prop("parent", modify)
            --japi.DzFrameSetParent(this.handle(), modify.handle())
            return this
        end
        return p
    end)

    .public("children",
    function(this)
        return this.prop("children")
    end)

    .public("size",
    function(this, w, h)
        if (w ~= nil and h ~= nil) then
            if (view.isGameUI(this)) then
                -- 游戏UI禁止
                return this
            end
            local aw = w
            if (true == this.adaptive()) then
                aw = japi.FrameAdaptive(w)
            end
            local _, updated = PROP(this, "size", { aw, h })
            if (updated == true) then
                this.prop("unAdaptiveSize", { w, h })
                view.setAnchor(this)
            end
            return this
        end
        return this.prop("size")
    end)

    .public("relation",
    function(this, point, relativeFrame, relativePoint, x, y)
        if (point ~= nil and relativeFrame ~= nil and relativePoint ~= nil and x ~= nil and y ~= nil) then
            if (view.isGameUI(this)) then
                -- 游戏UI禁止
                return this
            end
            local ax = x
            if (true == this.adaptive()) then
                ax = japi.FrameAdaptive(x)
            end
            local _, updated = PROP(this, "relation", { point, relativeFrame, relativePoint, ax, y })
            if (updated == true) then
                this.prop("unAdaptiveRelation", { point, relativeFrame, relativePoint, x, y })
                view.setAnchor(this)
            end
            return this
        end
        return this.prop("relation")
    end)

    .public("absolut",
    function(this, point, x, y)
        return this.relation(point, FrameGameUI, point, x, y)
    end)

    .public("show",
    function(this, modify, delay)
        if (view.isGameUI(this)) then
            -- 游戏UI禁止
            return this
        end
        if (type(modify) == "boolean") then
            local showDelay = this.prop("showDelay")
            if (isObject(showDelay, "Timer")) then
                showDelay.destroy()
                showDelay = nil
            end
            delay = delay or 0
            local act = function()
                local _, updated = PROP(this, "show", modify)
                if (updated) then
                    view.triggerFrameEvent(this)
                end
            end
            if (delay >= 0.1) then
                this.prop("showDelay", time.setTimeout(delay, function()
                    this.prop("showDelay", NIL)
                    act()
                end))
            else
                act()
            end
            return this
        end
        local o = this
        local s = o.prop("show") or false
        while (s == true) do
            local p = o.parent()
            if (p == nil or p == FrameGameUI) then
                break
            end
            o = p
            s = o.prop("show")
            if (s == false) then
                break
            end
        end
        return s
    end)

    .public("onMouseLeftClick",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        ---@type Array
        local list = this.prop("evtList")
        if (list.onMouseLeftClick == nil) then
            list.onMouseLeftClick = Array()
        end
        list.onMouseLeftClick.set(key, func)
        view.triggerFrameEvent(this, "onMouseLeftClick")
        return this
    end)

    .public("onMouseRightClick",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        ---@type Array
        local list = this.prop("evtList")
        if (list.onMouseRightClick == nil) then
            list.onMouseRightClick = Array()
        end
        list.onMouseRightClick.set(key, func)
        view.triggerFrameEvent(this, "onMouseRightClick")
        return this
    end)

    .public("onMouseMove",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        ---@type Array
        local list = this.prop("evtList")
        if (list.onMouseMove == nil) then
            list.onMouseMove = Array()
        end
        list.onMouseMove.set(key, func)
        view.triggerFrameEvent(this, "onMouseMove")
        return this
    end)

    .public("onMouseEnter",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        ---@type Array
        local list = this.prop("evtList")
        if (list.onMouseEnter == nil) then
            list.onMouseEnter = Array()
        end
        list.onMouseEnter.set(key, func)
        view.triggerFrameEvent(this, "onMouseEnter")
        return this
    end)

    .public("onMouseLeave",
    function(this, ...)
        local key, func = datum.keyFunc(...)
        ---@type Array
        local list = this.prop("evtList")
        if (list.onMouseLeave == nil) then
            list.onMouseLeave = Array()
        end
        list.onMouseLeave.set(key, func)
        view.triggerFrameEvent(this, "onMouseLeave")
        return this
    end)

---@param this FrameTooltips
Class("FrameTooltips")

    .public("kit",
    function(this, modify)
        return this.prop("kit", modify)
    end)

    .public("childText",
    function(this)
        return this.prop("childTxt")
    end)

    .public("childIcons",
    function(this)
        return this.prop("childIcons")
    end)

    .public("childBars",
    function(this)
        return this.prop("childBars")
    end)

    .public("childList",
    function(this)
        return this.prop("childList")
    end)

    .public("textAlign",
    function(this, align)
        this.childText().textAlign(align)
        return this
    end)

    .public("fontSize",
    function(this, fontSize)
        this.childText().fontSize(fontSize)
        return this
    end)

    .public("onMouseLeftClick",
    function(this, ...)
        this.childList().onMouseLeftClick(...)
        return this
    end)

    .public("content",
    function(this, data)
        if (type(data) == "string") then
            data = { tips = data }
        end
        local icons = data.icons
        local bars = data.bars
        local list = data.list
        local tips = data.tips
        local fs = this.childText().fontSize()
        if (type(tips) == "string") then
            tips = string.explode("|n", tips)
        end
        ---@type table<number,{bg:FrameBackdrop,txt:FrameText}>
        local childIcons = this.childIcons()
        ---@type FrameBar[]
        local childBars = this.childBars()
        ---@type FrameList
        local childList = this.childList()

        local kit = this.kit()

        local temp = {}
        local w = 0
        local xEx = 0
        local paddingX = 0.012
        local paddingY = 0.008
        if (type(icons) == "table" and #icons > 0) then
            -- 当有顶部图标时，tooltips自动调节为左对齐
            japi.DzFrameSetTextAlignment(this.childText().handle(), TEXT_ALIGN_LEFT)
            this.childText().relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, paddingX, 0)
            xEx = xEx + paddingX
            --
            table.insert(temp, '')
            table.insert(temp, '')
        elseif (type(tips) == "table" and #tips == 1) then
            -- 当只有一行文本时，tooltips自动调节为居中
            japi.DzFrameSetTextAlignment(this.childText().handle(), TEXT_ALIGN_CENTER)
            this.childText().relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, 0, 0)
        else
            -- 多行文本时，tooltips以代码为标准
            local ag = this.childText().textAlign()
            japi.DzFrameSetTextAlignment(this.childText().handle(), ag)
            local ox = 0
            local oy = 0
            if (ag == TEXT_ALIGN_LEFT_TOP or ag == TEXT_ALIGN_LEFT or ag == TEXT_ALIGN_LEFT_BOTTOM) then
                ox = paddingX
                xEx = xEx + paddingX
            end
            if (ag == TEXT_ALIGN_RIGHT_TOP or ag == TEXT_ALIGN_RIGHT or ag == TEXT_ALIGN_RIGHT_BOTTOM) then
                ox = -paddingX
            end
            if (ag == TEXT_ALIGN_LEFT_TOP or ag == TEXT_ALIGN_TOP or ag == TEXT_ALIGN_RIGHT_TOP) then
                oy = -paddingY
            end
            if (ag == TEXT_ALIGN_LEFT_BOTTOM or ag == TEXT_ALIGN_BOTTOM or ag == TEXT_ALIGN_RIGHT_BOTTOM) then
                oy = paddingY
            end
            this.childText().relation(FRAME_ALIGN_CENTER, this, FRAME_ALIGN_CENTER, ox, oy)
        end
        local wic = 0
        for i = 1, #childIcons, 1 do
            if (type(icons) ~= "table" or icons[i] == nil) then
                childIcons[i].bg.show(false)
            else
                if (i <= 1) then
                    childIcons[i].bg.relation(FRAME_ALIGN_LEFT_TOP, this, FRAME_ALIGN_LEFT_TOP, xEx, -mbstring.viewHeight(1.2, fs))
                else
                    childIcons[i].bg.relation(FRAME_ALIGN_LEFT, childIcons[i - 1].txt, FRAME_ALIGN_RIGHT, 0.01, 0)
                end
                childIcons[i].txt.text(icons[i].text).fontSize(fs - 1)
                childIcons[i].bg.texture(AUIKit(kit, icons[i].texture, "tga"))
                childIcons[i].bg.show(true)
                -- 宽高计算
                wic = wic + paddingX + 0.01 + mbstring.viewWidth(icons[i].text, fs)
            end
        end
        w = math.max(w, wic)
        for i = 1, #childBars, 1 do
            if (type(bars) ~= "table" or bars[i] == nil) then
                childBars[i].show(false)
            else
                if (i <= 1) then
                    if (type(icons) == "table" and icons[1] ~= nil) then
                        childBars[i].relation(FRAME_ALIGN_LEFT_TOP, childIcons[1].bg, FRAME_ALIGN_LEFT_BOTTOM, 0.001, -mbstring.viewHeight(2.4 - 0.6, fs))
                    else
                        childBars[i].relation(FRAME_ALIGN_LEFT_TOP, this, FRAME_ALIGN_LEFT_TOP, xEx, -mbstring.viewHeight(2.4, fs))
                    end
                else
                    childBars[i].relation(FRAME_ALIGN_LEFT_TOP, childBars[i - 1], FRAME_ALIGN_LEFT_BOTTOM, 0, -mbstring.viewHeight(1.8, fs))
                end
                childBars[i].text(LAYOUT_ALIGN_LEFT_TOP, bars[i].text)
                childBars[i].fontSize(LAYOUT_ALIGN_LEFT_TOP, fs - 1)
                childBars[i].texture("value", AUIKit(kit, bars[i].texture, "tga"))
                childBars[i].value(bars[i].ratio, bars[i].width, bars[i].height)
                childBars[i].show(true)
                -- 宽高计算
                table.insert(temp, '')
                table.insert(temp, '')
                w = math.max(w, bars[i].width or 0)
            end
        end
        if (type(tips) == "table" and #tips > 0) then
            for _, s in ipairs(tips) do
                local vw = mbstring.viewWidth(s, fs)
                if (vw > w) then
                    w = vw
                end
                table.insert(temp, s)
            end
        end
        if (type(list) ~= "table" or #list <= 0) then
            childList.show(false)
        else
            for _, l in ipairs(list) do
                l.texture = AUIKit(kit, l.texture, "tga")
            end
            childList
                .relation(FRAME_ALIGN_LEFT_BOTTOM, this, FRAME_ALIGN_LEFT_BOTTOM, xEx, paddingY * 1.4)
                .fontSize(fs - 1)
                .content(list)
                .show(true)
            -- 宽高计算
            table.insert(temp, '')
            table.insert(temp, '')
            table.insert(temp, '')
            local lSize = childList.prop("unAdaptiveSize")
            w = math.max(w, lSize[1] or 0)
        end
        local h = mbstring.viewHeight(#temp, fs)
        w = paddingX * 2 + w
        h = paddingY * 2 + h
        this.size(w, h)
        this.childText()
            .size(w, h)
            .text(string.implode("|n", temp))
        return this
    end)
---@param this Item
Class("Item")

    .public("onEvent",
    function(this, evt, ...)
        event.register(this, evt, ...)
        return this
    end)

    .public("onUnitEvent",
    function(this, evt, ...)
        local opt = { ... }
        local key
        local callFunc
        if (type(opt[1]) == "function") then
            key = this.id() .. evt
            callFunc = opt[1]
        elseif (type(opt[1]) == "string" and type(opt[2]) == "function") then
            key = this.id() .. opt[1]
            callFunc = opt[2]
        end
        if (key ~= nil) then
            local eKey = "ioue#" .. key
            if (callFunc == nil) then
                event.unregister(this, EVENT.Item.Get, eKey)
                event.unregister(this, EVENT.Item.Lose, eKey)
            else
                ---@param getData noteOnItemGetData
                this.onEvent(EVENT.Item.Get, eKey, function(getData)
                    event.register(getData.triggerUnit, evt, eKey, function(callData)
                        callData.triggerItem = getData.triggerItem
                        callFunc(callData)
                    end)
                end)
                ---@param loseData noteOnItemLoseData
                this.onEvent(EVENT.Item.Lose, eKey, function(loseData)
                    event.register(loseData.triggerUnit, evt, eKey)
                end)
            end
        end
        return this
    end)

    .public("cls",
    function(this)
        -- 清除掉绑定的数据和对象
        ---@type Player
        local bindPlayer = this.prop("bindPlayer")
        if (isObject(bindPlayer, "Player")) then
            bindPlayer.warehouseSlot().remove(this.warehouseSlotIndex())
        end
        ---@type Unit
        local bindUnit = this.prop("bindUnit")
        if (isObject(bindUnit, "Unit")) then
            bindUnit.itemSlot().remove(this.itemSlotIndex())
        end
        this.prop("itemSlot", NIL)
    end)

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("ability",
    function(this, modify)
        if (isObject(modify, "AbilityTpl")) then
            this.prop("ability", Ability(modify))
            return this
        end
        return this.prop("ability")
    end)

    .public("itemSlotIndex",
    function(this, modify)
        return this.prop("itemSlotIndex", modify)
    end)

    .public("warehouseSlotIndex",
    function(this, modify)
        return this.prop("warehouseSlotIndex", modify)
    end)

    .public("hotkey",
    function(this)
        return this.prop("hotkey")
    end)

    .public("bindPlayer",
    function(this, modify)
        return this.prop("bindPlayer", modify)
    end)

    .public("bindUnit",
    function(this, modify)
        if (isObject(modify, "Unit")) then
            this.prop("bindUnit", modify)
            if (this.ability() ~= nil) then
                this.ability().bindUnit(modify)
            end
            return this
        end
        return this.prop("bindUnit")
    end)

    .public("x",
    function(this)
        if (this.instance() == false) then
            return 0
        end
        return this.prop("x")
    end)

    .public("y",
    function(this)
        if (this.instance() == false) then
            return 0
        end
        return this.prop("y")
    end)

    .public("z",
    function(this)
        if (this.instance() == false) then
            return 0
        end
        return japi.Z(this.x(), this.y())
    end)

    .public("position",
    function(this, x, y)
        if (type(x) == "number" and type(y) == "number") then
            if (false == this.instance()) then
                this.instance(true)
            end
            x, y = Game().findPosition(x, y, this.id())
            this.prop("x", x)
            this.prop("y", y)
            J.SetUnitPosition(this.handle(), x, y)
        end
        return this
    end)

    .public("periodRemain",
    function(this)
        ---@type Timer
        local periodTimer = this.prop("periodTimer")
        if (isObject(periodTimer, "Timer")) then
            return periodTimer.remain()
        end
        return -1
    end)

    .public("exp",
    function(this, modify)
        return this.prop("exp", modify)
    end)

    .public("expNeed",
    function(this, whichLevel)
        whichLevel = whichLevel or (1 + this.level())
        whichLevel = math.max(1, whichLevel)
        whichLevel = math.min(Game().itemLevelMax(), whichLevel)
        return Game().itemExpNeeds(math.floor(whichLevel))
    end)

    .public("recoveryPrice",
    function(this)
        ---@type Player
        local bp = this.bindPlayer()
        if (isObject(bp, "Player") == false) then
            local bu = this.bindUnit()
            if (isObject(bu, "Unit")) then
                bp = bu.owner()
            else
                return nil, nil
            end
        end
        return Game().worthCale(this.worth(), "*", 0.01 * bp.sell()), bp
    end)

    .public("sellingPrice",
    function(this)
        ---@type Player
        local bs = this.bindStore()
        return Game().worthCale(this.worth(), "*", 1), bs
    end)

    .public("drop",
    function(this, x, y)
        local u = this.bindUnit()
        if (isObject(u, "Unit") == false) then
            local bp = this.bindPlayer()
            if (isObject(bp, "Player")) then
                u = bp.selection()
                if (false == table.equal(u.owner(), bp)) then
                    return
                end
            else
                return
            end
        end
        local ux = u.x()
        local uy = u.y()
        x = x or ux
        y = y or uy
        local v = Vcm("war3_dropItem")
        if (x == ux and y == uy) then
            event.trigger(u, EVENT.Item.Drop, { triggerItem = this, triggerUnit = u })
            event.trigger(this, EVENT.Item.Drop, { triggerItem = this, triggerUnit = u })
            this.position(x, y)
            async.call(u.owner(), function()
                v.play()
            end)
        else
            u.distanceAction({ x, y }, 200, function()
                event.trigger(u, EVENT.Item.Drop, { triggerItem = this, triggerUnit = u })
                event.trigger(this, EVENT.Item.Drop, { triggerItem = this, triggerUnit = u })
                async.call(u.owner(), function()
                    v.play()
                end)
                time.setTimeout(0.15, function()
                    this.position(x, y)
                end)
            end)
        end
    end)

    .public("pawn",
    function(this)
        local rp, bp = this.recoveryPrice()
        if (isObject(bp, "Player")) then
            rp = Game().worthRound(rp)
            bp.worth("+", rp)
            local v = Vcm("war3_receiveGold")
            async.call(bp, function()
                v.play()
            end)
            event.trigger(this, EVENT.Item.Pawn, { triggerItem = this, triggerUnit = this.bindUnit() })
            event.trigger(this.bindUnit(), EVENT.Item.Pawn, { triggerItem = this, triggerUnit = this.bindUnit() })
        end
        this.destroy()
    end)

    .public("effective",
    function(this, evtData)
        ---@type Ability
        local ba = this.ability()
        if (isObject(ba, "Ability")) then
            ba.effective(evtData)
        end
    end)
---@param this Player
Class("Player")

    .public("onEvent",
    function(this, evt, ...)
        event.register(this, evt, ...)
        return this
    end)

    .public("onSelectUnit",
    function(this, qty, callFunc)
        event.register(this, EVENT.Player.SelectUnit .. "#" .. qty, callFunc)
        return this
    end)

    .public("onSelectItem",
    function(this, qty, callFunc)
        event.register(this, EVENT.Player.SelectItem .. "#" .. qty, callFunc)
        return this
    end)

    .public("onChat",
    function(this, pattern, callFunc)
        if (false == event.has(this, EVENT.Player.Chat)) then
            event.register(this, EVENT.Player.Chat, function(evtData)
                ---@type Array
                local chatPattern = this.prop("chatPattern")
                chatPattern.forEach(function(p, c)
                    local m = string.match(evtData.chatString, p)
                    if (m ~= nil) then
                        evtData.matchedString = m
                        promise(c, nil, nil, evtData)
                    end
                end)
            end)
        end
        ---@type Array
        local chatPattern = this.prop("chatPattern")
        if (type(callFunc) == "function") then
            chatPattern.set(pattern, callFunc)
        else
            chatPattern.set(pattern, nil)
        end
        return this
    end)

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("isNeutral",
    function(this)
        return this.prop("index") >= 13
    end)

    .public("isComputer",
    function(this)
        return this.prop("isComputer")
    end)

    .public("isUser",
    function(this)
        return this.prop("isUser")
    end)

    .public("isPlaying",
    function(this)
        return this.prop("status") == PLAYER_STATUS.playing
    end)

    .public("isRedVip",
    function(this)
        return this.prop("isRedVip")
    end)

    .public("isBlueVip",
    function(this)
        return this.prop("isBlueVip")
    end)

    .public("isPlatformVIP",
    function(this)
        return this.prop("isPlatformVIP")
    end)

    .public("isHurting",
    function(this)
        return this.superposition("hurt") > 0
    end)

    .public("isDamaging",
    function(this)
        return this.superposition("damage") > 0
    end)

    .public("isMarking",
    function(this)
        return this.superposition("mark") > 0
    end)

    .public("hasMallItem",
    function(this, k)
        if (k == nil) then
            return false
        end
        local i = this.prop("dzMallItem")
        if (i[k] == nil) then
            i[k] = japi.DzAPI_Map_HasMallItem(this.handle(), k) or false
        end
        return i[k]
    end)

    .public("index",
    function(this)
        return this.prop("index")
    end)

    .public("mapLv",
    function(this)
        return this.prop("mapLv")
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("teamColor",
    function(this, modify)
        return this.prop("teamColor", modify)
    end)

    .public("race",
    function(this, modify)
        return this.prop("race", modify)
    end)

    .public("status",
    function(this, modify)
        return this.prop("status", modify)
    end)

    .public("worth",
    function(this, operator, data)
        local w = this.prop("worth")
        if (type(operator) == "string" and type(data) == "table") then
            if (operator == "=") then
                this.prop("worth", Game().worthL2U(Game().worthU2L(data)))
            else
                this.prop("worth", Game().worthCale(w, operator, data))
            end
            return this
        end
        return w
    end)

    .public("sell",
    function(this, modify)
        return this.prop("sell", modify)
    end)

    .public("prestige",
    function(this, modify)
        return this.prop("prestige", modify)
    end)

    .public("select",
    function(this, targetUnit)
        this.prop("selection", NIL)
        if (isObject(targetUnit, "Unit")) then
            async.call(this, function()
                J.ClearSelection()
                J.SelectUnit(targetUnit.handle(), true)
            end)
        end
    end)

    .public("selection",
    function(this)
        return this.prop("selection")
    end)

    .public("apm",
    function(this)
        return math.floor(this.prop("apm"))
    end)

    .public("dead",
    function(this)
        return math.floor(this.prop("dead"))
    end)

    .public("kill",
    function(this)
        return math.floor(this.prop("kill"))
    end)

    .public("hurt",
    function(this)
        return math.trunc(this.prop("hurt"), 3)
    end)

    .public("damage",
    function(this)
        return math.trunc(this.prop("damage"), 3)
    end)

    .public("quit",
    function(this, reason)
        reason = reason or ""
        href(this, nil)
        if (this.isUser()) then
            Dialog(reason, { { value = "Q", label = J.GetLocalizedString("GAMEOVER_QUIT_MISSION") } }, function(_)
                async.call(this, function()
                    J.EndGame(true)
                end)
            end).show(this)
        end
    end)

    .public("unit",
    function(this, tpl, x, y, facing)
        return Unit(tpl, this, x, y, facing)
    end)

    .public("warehouseSlot",
    function(this)
        return this.prop("warehouseSlot")
    end)

    .public("mark",
    function(this, path, duration, red, green, blue)
        if (path ~= nil and not this.isNeutral() and this.isPlaying()) then
            red = red or 255
            green = green or 255
            blue = blue or 255
            duration = math.trunc(duration or 3, 2)
            async.call(this, function()
                texture.cinematicFilterGeneric(0.50, BLEND_MODE_ADDITIVE, path, red, green, blue, 255, red, green, blue, 0)
            end)
            this.superposition("mark", "+=1")
            time.setTimeout(duration, function()
                this.superposition("mark", "-=1")
                async.call(this, function()
                    texture.cinematicFilterGeneric(0.50, BLEND_MODE_ADDITIVE, path, red, green, blue, 0, red, green, blue, 255)
                end)
            end)
        end
        return this
    end)

    .public("alert",
    function(this, modify, vcm)
        if (type(modify) == "string" and string.len(modify) > 0) then
            if (type(vcm) ~= "boolean") then
                vcm = true
            end
            if (vcm) then
                local vcmWar3Err = Vcm('war3_error')
                if (vcmWar3Err) then
                    async.call(this, function()
                        vcmWar3Err.play()
                    end)
                end
            end
            local alertTimer = this.prop("alertTimer")
            if (isObject(alertTimer, "Timer")) then
                alertTimer.destroy()
                this.prop("alertTimer", NIL)
            end
            this.prop("alert", modify)
            local t = math.max(3, 0.2 * mbstring.len(modify))
            this.prop("alertTimer", time.setTimeout(t, function()
                this.prop("alertTimer", NIL)
                this.prop("alert", "")
            end))
            return this
        end
        return this.prop("alert")
    end)       local isDef = function(path)
    local i = string.find(path, ":")
    return i == 1
end

---@private
---@param _v{Name,Description,Tip,Ubertip,Hotkey,level,race,type,goldcost,lumbercost,manaN,regenMana,mana0,HP,regenHP,regenType,fmade,fused,stockStart,stockRegen,stockMax,sight,nsight,collision,modelScale,file,fileVerFlags,scaleBull,scale,selZ,selCircOnWater,red,green,blue,occH,maxPitch,maxRoll,impactZ,impactSwimZ,launchX,launchY,launchZ,launchSwimZ,unitSound,RandomSoundLabel,MovementSoundLabel,LoopingSoundFadeOut,LoopingSoundFadeIn,auto,abilList,Sellitems,Sellunits,Markitems,Builds,Buttonpos_1,Buttonpos_2,Art,Specialart,unitShadow,buildingShadow,shadowH,shadowW,shadowX,shadowY,shadowOnWater,death,deathType,movetp,moveHeight,moveFloor,spd,maxSpd,minSpd,turnRate,acquire,minRange,weapsOn,Missileart_1,Missilespeed_1,Missilearc_1,MissileHoming_1,targs1,atkType1,weapTp1,weapType1,spillRadius1,spillDist1,damageLoss1,showUI1,backSw1,dmgpt1,rangeN1,RngBuff1,dmgplus1,dmgUp1,sides1,dice1,splashTargs1,cool1,Farea1,targCount1,Qfact1,Qarea1,Hfact1,Harea1,Missileart_2,Missilespeed_2,Missilearc_2,MissileHoming_2,targs2,atkType2,weapTp2,weapType2,spillRadius2,spillDist2,damageLoss2,showUI2,backSw2,dmgpt2,rangeN2,RngBuff2,dmgplus2,dmgUp2,sides2,dice2,splashTargs2,cool2,Farea2,targCount2,Qfact2,Qarea2,Hfact2,Harea2,defType,defUp,def,armor,targType,Propernames,nameCount,Awakentip,Revivetip,Primary,STR,STRplus,AGI,AGIplus,INT,INTplus,heroAbilList,hideHeroMinimap,hideHeroBar,hideHeroDeathMsg,Requiresacount,Requires1,Requires2,Requires3,Requires4,Requires5,Requires6,Requires7,Requires8,Reviveat,buffRadius,buffType,Revive,Trains,Upgrade,requirePlace,preventPlace,requireWaterRadius,pathTex,uberSplat,nbrandom,nbmmlcon,canBuildOn,isBuildOn,tilesets,special,campaign,inEditor,dropItems,hostilePal,useClickHelper,tilesetSpecific,Requires,Requiresamount,DependencyOr,Researches,upgrades,EditorSuffix,Casterupgradename,Casterupgradetip,Castrerupgradeart,ScoreScreenIcon,animProps,Attachmentanimprops,Attachmentlinkprops,Boneprops,castpt,castbsw,blend,run,walk,propWin,orientInterp,teamColor,customTeamColor,elevPts,elevRad,fogRad,fatLOS,repulse,repulsePrio,repulseParam,repulseGroup,isbldg,bldtm,bountyplus,bountysides,bountydice,goldRep,lumberRep,reptm,lumberbountyplus,lumberbountysides,lumberbountydice,cargoSize,hideOnMinimap,points,prio,formation,canFlee,canSleep,_id_force,_class,_type,_parent,_attr}
_unit = function(_v)
    _v = _SET_UNIT(_v)
    _v._id = SLK_ID(_v)
    SLK_GO_SET(_v)
    return _v
end

---@private
---@param _v{checkDep,Requires,Requiresamount,Effectsound,Effectsoundlooped,EditorSuffix,Name,Untip,Unubertip,Tip,Ubertip,Researchtip,Researchubertip,Unorder,Orderon,Order,Orderoff,Unhotkey,Hotkey,Researchhotkey,UnButtonpos_1,UnButtonpos_2,Buttonpos_1,Buttonpos_2,Researchbuttonpos1,Researchbuttonpos2,Unart,Researchart,Art,SpecialArt,Specialattach,Missileart_1,Missilespeed_1,Missilearc_1,MissileHoming_1,LightningEffect,EffectArt,TargetArt,Targetattachcount,Targetattach,Targetattach1,Targetattach2,Targetattach3,Targetattach4,Targetattach5,Areaeffectart,Animnames,CasterArt,Casterattachcount,Casterattach,Casterattach1,hero,item,race,levels,reqLevel,priority,BuffID,EfctID,Tip,Ubertip,targs,DataA,DataB,DataC,DataD,DataE,DataF,Cast,Cool,Dur,HeroDur,Cost,Rng,Area,_id_force,_class,_type,_parent,_desc,_attr,_ring,_remarks,_lv,_onSkillStudy,_onSkillEffect,_onRing}
_ability = function(_v)
    _v = _SET_ABILITY(_v)
    _v._id = SLK_ID(_v)
    SLK_GO_SET(_v)
    return _v
end

---@private
---@param _v{file,}
_destructable = function(_v)
    _v = _SET_DESTRUCTABLE(_v)
    _v._id = SLK_ID(_v)
    SLK_GO_SET(_v)
    return _v
end

_assets_selection = function(typeName)
    if (type(typeName) == "string") then
        GO_RESULT.selection = string.trim(typeName)
    end
end

_assets_font = function(ttfName)
    if (type(ttfName) == "string") then
        ttfName = string.trim(string.gsub(ttfName, "%.ttf", ""))
        GO_RESULT.font = ttfName
    end
end

_assets_loading = function(tga)
    if (type(tga) == "string") then
        tga = string.trim(string.gsub(tga, "%.tga", ""))
        GO_RESULT.loading = tga
    end
end

_assets_preview = function(tga)
    if (type(tga) == "string") then
        tga = string.trim(string.gsub(tga, "%.tga", ""))
        GO_RESULT.preview = tga
    end
end

_assets_icon = function(path, alias)
    if (path) then
        path = string.trim(string.gsub(path, "%.tga", ""))
        alias = alias or path
        if (not isDef(path)) then
            table.insert(GO_RESULT.icons, { path, alias })
        end
    end
end

_assets_model = function(path, alias, class, options)
    if (path) then
        class = class or "common"
        path = string.gsub(path, "%.mdx", "")
        path = string.gsub(path, "%.mdl", "")
        path = string.trim(path)
        alias = alias or path
        local _is = isDef(path)
        if (not _is) then
            table.insert(GO_RESULT.model, { path, alias })
        end
        if (class ~= "common") then
            options = options or {}
            if (options.Art ~= nil) then
                _assets_icon(options.Art, alias)
                if (isDef(options.Art)) then
                    options.Art = string.sub(options.Art, 2)
                else
                    options.Art = "war3mapIcon\\" .. alias .. ".tga"
                end
            end
            local file
            if (_is) then
                file = string.sub(path, 2)
            else
                file = "war3mapModel\\" .. alias .. ".mdl"
            end
            if (class == "unit") then
                local v = {
                    isDef = _is,
                    weapsOn = 1,
                    file = file,
                    Name = alias .. "|U",
                }
                _unit(table.merge(v, options))
            elseif (class == "item") then
                _unit(table.merge(options, {
                    isDef = _is,
                    _parent = "nbse",
                    targType = "item",
                    type = "",
                    collision = 0,
                    pathTex = "",
                    buildingShadow = "",
                    selCircOnWater = 1,
                    occH = 0,
                    uberSplat = "",
                    canFlee = 0,
                    campaign = 0,
                    weapsOn = 0,
                    file = file,
                    Name = alias .. "|I",
                    EditorSuffix = "",
                    abilList = "Avul",
                    movetp = "",
                    spd = 0,
                    sight = 100,
                    nsight = 100,
                    hideOnMinimap = 1,
                }))
            elseif (class == "destructable") then
                _destructable(table.merge(options, {
                    file = file,
                    portraitmodel = file,
                    Name = "　" .. alias .. "　",
                }))
            end
        end
    end
end

_assets_sound = function(path, alias, soundType)
    if (path) then
        path = string.trim(string.gsub(path, "%.mp3", ""))
        alias = alias or path
        table.insert(GO_RESULT.sound, { path, alias, soundType })
    end
end

_assets_ui = function(kit)
    if (kit) then
        table.insert(GO_RESULT.ui, kit)
    end
end
--[[ json.lua
    A compact pure-Lua JSON library.
    The main functions are: json.encode, json.decode.
    ## json.encode:
    This expects the following to be true of any tables being encoded:
     * They only have string or number keys. Number keys must be represented as
       strings in json; this is part of the json spec.
     * They are not recursive. Such a structure cannot be specified in json.
    A Lua table is considered to be an array if and only if its set of keys is a
    consecutive sequence of positive integers starting at 1. Arrays are encoded like
    so: `[2, 3, false, "hi"]`. Any other type of Lua table is encoded as a json
    object, encoded like so: `{"key1": 2, "key2": false}`.
    Because the Lua nil value cannot be a key, and as a table value is considerd
    equivalent to a missing key, there is no way to express the json "null" value in
    a Lua table. The only way this will output "null" is if your entire input obj is
    nil itself.
    An empty Lua table, {}, could be considered either a json object or array -
    it's an ambiguous edge case. We choose to treat this as an object as it is the
    more general type.
    To be clear, none of the above considerations is a limitation of this code.
    Rather, it is what we get when we completely observe the json specification for
    as arbitrary a Lua object as json is capable of expressing.
    ## json.decode:
    This function parses json, with the exception that it does not pay attention to
    \u-escaped unicode code points in strings.
    It is difficult for Lua to return null as a value. In order to prevent the loss
    of keys with a null value in a json string, this function uses the one-off
    table value json.null (which is just an empty table) to indicate null values.
    This way you can check if a value is null with the conditional
    `val == json.null`.
    If you have control over the data and are using Lua, I would recommend just
    avoiding null values in your data to begin with.
--]]
json = {}

-- Internal functions.

local function kindOf(obj)
    if type(obj) ~= "table" then
        return type(obj)
    end
    local i = 0
    for _ in pairs(obj) do
        i = i + 1
    end
    if i == #obj then
        return "array"
    else
        return "table"
    end
end

local function escapeStr(s)
    local in_char = { "\\", '"', "/", "\b", "\f", "\n", "\r", "\t" }
    local out_char = { "\\", '"', "/", "b", "f", "n", "r", "t" }
    for i, c in ipairs(in_char) do
        s = s:gsub(c, "\\" .. out_char[i])
    end
    return s
end

-- Returns pos, did_find; there are two cases:
-- 1. Delimiter found: pos = pos after leading space + delim; did_find = true.
-- 2. Delimiter not found: pos = pos after leading space;     did_find = false.
-- This throws an error if err_if_missing is true and the delim is not found.
local function skipDelim(str, pos, delim, err_if_missing)
    pos = pos + #str:match("^%s*", pos)
    if str:sub(pos, pos) ~= delim then
        if err_if_missing then
            error("Expected " .. delim .. " near position " .. pos)
        end
        return pos, false
    end
    return pos + 1, true
end

-- Expects the given pos to be the first character after the opening quote.
-- Returns val, pos; the returned pos is after the closing quote character.
local function parseStrVal(str, pos, val)
    val = val or ""
    local early_end_error = "End of input found while parsing string."
    if pos > #str then
        error(early_end_error)
    end
    local c = str:sub(pos, pos)
    if c == '"' then
        return val, pos + 1
    end
    if c ~= "\\" then
        return parseStrVal(str, pos + 1, val .. c)
    end
    -- We must have a \ character.
    local esc_map = { b = "\b", f = "\f", n = "\n", r = "\r", t = "\t" }
    local nextc = str:sub(pos + 1, pos + 1)
    if not nextc then
        error(early_end_error)
    end
    return parseStrVal(str, pos + 2, val .. (esc_map[nextc] or nextc))
end

-- Returns val, pos; the returned pos is after the number's final character.
local function parseNumVal(str, pos)
    local num_str = str:match("^-?%d+%.?%d*[eE]?[+-]?%d*", pos)
    local val = tonumber(num_str)
    if not val then
        error("Error parsing number at position " .. pos .. ".")
    end
    return val, pos + #num_str
end

json.null = {} -- This is a one-off table to represent the null value.

-- Public values and functions.

function json.encode(obj, as_key)
    local sss = {}
    local ss = {}
    local kind = kindOf(obj) -- This is 'array' if it's an array or type(obj) otherwise.
    local into = function(str)
        ss[#ss + 1] = str
        if (#ss >= 100) then
            table.insert(sss, ss)
            ss = {}
        end
    end
    if kind == "array" then
        if as_key then
            error("Can't encode array as key.")
        end
        into("[")
        for i, val in ipairs(obj) do
            if #sss > 0 or i > 1 then
                into(", ")
            end
            into(json.encode(val))
        end
        into("]")
    elseif kind == "table" then
        if as_key then
            error("Can't encode table as key.")
        end
        into("{")
        for k, v in pairs(obj) do
            if #sss > 0 or #ss > 1 then
                into(", ")
            end
            into(json.encode(k, true))
            into(":")
            into(json.encode(v))
        end
        into("}")
    elseif kind == "string" then
        return '"' .. escapeStr(obj) .. '"'
    elseif kind == "number" then
        if as_key then
            return '"' .. tostring(obj) .. '"'
        end
        return tostring(obj)
    elseif kind == "boolean" then
        return tostring(obj)
    elseif kind == "nil" then
        return "null"
    else
        error("Unjsonifiable type: " .. kind .. ".")
    end
    if (#ss > 0) then
        table.insert(sss, ss)
    end
    ss = nil
    local concat = ""
    for _, s in ipairs(sss) do
        concat = concat .. table.concat(s)
    end
    return concat
end

function json.decode(str, pos, end_delim)
    pos = pos or 1
    if str == nil then
        stack()
        error("json str is nil.")
    end
    if pos > #str then
        stack()
        error("Reached unexpected end of input.")
    end
    local pos2 = pos + #str:match("^%s*", pos) -- Skip whitespace.
    local first = str:sub(pos2, pos2)
    if first == "{" then
        -- Parse an object.
        local obj, key, delim_found = {}, true, true
        pos2 = pos2 + 1
        while true do
            key, pos2 = json.decode(str, pos2, "}")
            if key == nil then
                return obj, pos2
            end
            if not delim_found then
                error("Comma missing between object items.")
            end
            pos2 = skipDelim(str, pos2, ":", true) -- true -> error if missing.
            obj[key], pos2 = json.decode(str, pos2)
            pos2, delim_found = skipDelim(str, pos2, ",")
        end
    elseif first == "[" then
        -- Parse an array.
        local arr, val, delimFound = {}, true, true
        pos2 = pos2 + 1
        while true do
            val, pos2 = json.decode(str, pos2, "]")
            if val == nil then
                return arr, pos2
            end
            if not delimFound then
                error("Comma missing between array items.")
            end
            arr[#arr + 1] = val
            pos2, delimFound = skipDelim(str, pos2, ",")
        end
    elseif first == '"' then
        -- Parse a string.
        return parseStrVal(str, pos2 + 1)
    elseif first == "-" or first:match("%d") then
        -- Parse a number.
        return parseNumVal(str, pos2)
    elseif first == end_delim then
        -- End of an object or array.
        return nil, pos2 + 1
    else
        -- Parse true, false, or null.
        local literals = { ["true"] = true, ["false"] = false, ["null"] = json.null }
        for lit_str, lit_val in pairs(literals) do
            local lit_end = pos2 + #lit_str - 1
            if str:sub(pos2, lit_end) == lit_str then
                return lit_val, lit_end + 1
            end
        end
        error("Invalid json syntax starting at " .. "position " .. pos2 .. ": " .. str:sub(pos2, pos2 + 10))
    end
end
---@param this Attribute
Class("Attribute")

    .public("missile",
    function(this)
        ---@type Missile[]
        local missiles = this.prop("missile")
        if (#missiles == 0) then
            return nil
        end
        local len = #missiles
        local mc = missiles[len]
        for i = (len - 1), 1, -1 do
            local m = missiles[i]
            if (m.priority() > mc.priority()) then
                mc = m
            end
        end
        return mc
    end)

    .public("missilePush",
    function(this, missile)
        if (isObject(missile, "Missile")) then
            ---@type Missile[]
            local missiles = this.prop("missile")
            table.insert(missiles, missile)
        end
        return this
    end)

    .public("missileRemove",
    function(this, missileId)
        if (type(missileId) == "string") then
            ---@type Missile[]
            local missiles = this.prop("missile")
            if (#missiles > 0) then
                for i = #missiles, 1, -1 do
                    if (missiles[i].id() == missileId) then
                        table.remove(missiles, i)
                    end
                end
            end
        end
        return this
    end)

    .public("lightning",
    function(this)
        ---@type Lightning[]
        local lightnings = this.prop("lightning")
        if (#lightnings == 0) then
            return nil
        end
        local len = #lightnings
        local lt = lightnings[len]
        for i = (len - 1), 1, -1 do
            local l = lightnings[i]
            if (l.priority() > lt.priority()) then
                lt = l
            end
        end
        return lt
    end)

    .public("lightningPush",
    function(this, lightning)
        if (isObject(lightning, "Lightning")) then
            ---@type Lightning[]
            local lightnings = this.prop("lightning")
            table.insert(lightnings, lightning)
        end
        return this
    end)

    .public("lightningRemove",
    function(this, lightningId)
        if (type(lightningId) == "string") then
            ---@type Lightning[]
            local lightnings = this.prop("lightning")
            if (#lightnings > 0) then
                for i = #lightnings, 1, -1 do
                    if (lightnings[i].id() == lightnings) then
                        table.remove(lightnings, i)
                    end
                end
            end
        end
        return this
    end)

    .public("reborn",
    function(this, modify)
        return this.prop("reborn", modify)
    end)

    .public("hp",
    function(this, modify)
        return this.prop("hp", modify)
    end)

    .public("hpCur",
    function(this, modify)
        return this.prop("hpCur", modify)
    end)

    .public("hpRegen",
    function(this, modify)
        return this.prop("hpRegen", modify)
    end)

    .public("hpSuckAttack",
    function(this, modify)
        return this.prop("hpSuckAttack", modify)
    end)

    .public("hpSuckAbility",
    function(this, modify)
        return this.prop("hpSuckAbility", modify)
    end)

    .public("mp",
    function(this, modify)
        return this.prop("mp", modify)
    end)

    .public("mpCur",
    function(this, modify)
        return this.prop("mpCur", modify)
    end)

    .public("mpRegen",
    function(this, modify)
        return this.prop("mpRegen", modify)
    end)

    .public("mpSuckAttack",
    function(this, modify)
        return this.prop("mpSuckAttack", modify)
    end)

    .public("mpSuckAbility",
    function(this, modify)
        return this.prop("mpSuckAbility", modify)
    end)

    .public("sight",
    function(this, modify)
        return this.prop("sight", modify)
    end)

    .public("nsight",
    function(this, modify)
        return this.prop("nsight", modify)
    end)

    .public("sightBase",
    function(this, modify)
        return this.prop("sightBase", modify)
    end)

    .public("sightDiff",
    function(this, modify)
        return this.prop("sightDiff", modify)
    end)

    .public("attack",
    function(this, modify)
        return this.prop("attack", modify)
    end)

    .public("attackSpaceBase",
    function(this, modify)
        return this.prop("attackSpaceBase", modify)
    end)

    .public("attackSpace",
    function(this)
        return this.prop("attackSpace")
    end)

    .public("attackSpeed",
    function(this, modify)
        return this.prop("attackSpeed", modify)
    end)

    .public("attackRangeAcquire",
    function(this, modify)
        return this.prop("attackRangeAcquire", modify)
    end)

    .public("attackRange",
    function(this, modify)
        return this.prop("attackRange", modify)
    end)

    .public("attackRipple",
    function(this, modify)
        return this.prop("attackRipple", modify)
    end)

    .public("defend",
    function(this, modify)
        return this.prop("defend", modify)
    end)

    .public("move",
    function(this, modify)
        return this.prop("move", modify)
    end)

    .public("str",
    function(this, modify)
        return this.prop("str", modify)
    end)

    .public("agi",
    function(this, modify)
        return this.prop("agi", modify)
    end)

    .public("int",
    function(this, modify)
        return this.prop("int", modify)
    end)

    .public("cure",
    function(this, modify)
        return this.prop("cure", modify)
    end)

    .public("avoid",
    function(this, modify)
        return this.prop("avoid", modify)
    end)

    .public("aim",
    function(this, modify)
        return this.prop("aim", modify)
    end)

    .public("punish",
    function(this, modify)
        return this.prop("punish", modify)
    end)

    .public("punishCur",
    function(this, modify)
        return this.prop("punishCur", modify)
    end)

    .public("punishRegen",
    function(this, modify)
        return this.prop("punishRegen", modify)
    end)

    .public("weight",
    function(this, modify)
        return this.prop("weight", modify)
    end)

    .public("weightCur",
    function(this, modify)
        return this.prop("weightCur", modify)
    end)

    .public("hurtIncrease",
    function(this, modify)
        return this.prop("hurtIncrease", modify)
    end)

    .public("hurtReduction",
    function(this, modify)
        return this.prop("hurtReduction", modify)
    end)

    .public("hurtRebound",
    function(this, modify)
        return this.prop("hurtRebound", modify)
    end)

    .public("damageIncrease",
    function(this, modify)
        return this.prop("damageIncrease", modify)
    end)

    .public("crit",
    function(this, modify)
        return this.prop("crit", modify)
    end)

    .public("cost",
    function(this, modify)
        return this.prop("cost", modify)
    end)

    .public("castChant",
    function(this, modify)
        return this.prop("castChant", modify)
    end)

    .public("coolDown",
    function(this, modify)
        return this.prop("coolDown", modify)
    end)

    .public("coolDownSec",
    function(this, modify)
        return this.prop("coolDownSec", modify)
    end)

    .public("odds",
    function(this, key, modify)
        if (modify ~= nil) then
            this.prop("<ODDS>" .. key, modify)
            return this
        end
        return this.prop("<ODDS>" .. key) or 0
    end)

    .public("resistance",
    function(this, key, modify)
        if (modify ~= nil) then
            this.prop("<RESISTANCE>" .. key, modify)
            return this
        end
        return this.prop("<RESISTANCE>" .. key) or 0
    end)

    .public("enchant",
    function(this, key, modify)
        if (modify ~= nil) then
            this.prop("e_" .. key, modify)
            return this
        end
        return this.prop("e_" .. key) or 0
    end)

    .public("enchantResistance",
    function(this, key, modify)
        if (modify ~= nil) then
            this.resistance("e_" .. key, modify)
            return this
        end
        return this.resistance("e_" .. key) or 0
    end)

    .public("enchantWeapon",
    function(this, key, modify)
        if (modify ~= nil) then
            this.prop("<WEAPON>e_" .. key, modify)
            return this
        end
        return this.prop("<WEAPON>e_" .. key) or 0
    end)

    .public("enchantAppend",
    function(this, key, modify)
        if (modify ~= nil) then
            this.prop("<APPEND>e_" .. key, modify)
            return this
        end
        return this.prop("<APPEND>e_" .. key) or 0
    end)
    
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
---@param this AbilityTpl
Class("AbilityTpl")

    .private("onEvent",
    function(this, evt, ...)
        ---@type Array
        local onEvent = this.prop("onEvent")
        if (onEvent == nil) then
            onEvent = {}
            this.prop("onEvent", onEvent)
        end
        table.insert(onEvent, { evt, ... })
        return this
    end)

    .private("onUnitEvent",
    function(this, evt, ...)
        ---@type Array
        local onUnitEvent = this.prop("onUnitEvent")
        if (onUnitEvent == nil) then
            onUnitEvent = {}
            this.prop("onUnitEvent", onUnitEvent)
        end
        table.insert(onUnitEvent, { evt, ... })
        return this
    end)

    .public("attributes",
    function(this, modify)
        return this.prop("attributes", modify)
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("targetType",
    function(this, modify)
        return this.prop("targetType", modify)
    end)

    .public("icon",
    function(this, modify)
        return this.prop("icon", AIcon(modify))
    end)

    .public("castAnimation",
    function(this, modify)
        return this.prop("castAnimation", modify)
    end)

    .public("keepAnimation",
    function(this, modify)
        return this.prop("keepAnimation", modify)
    end)

    .public("castTargetFilter",
    function(this, modify)
        return this.prop("castTargetFilter", modify)
    end)

    .public("hpCostAdv",
    function(this, base, vary)
        this.prop("hpCostBase", base)
        this.prop("hpCostVary", vary)
        return this
    end)

    .public("mpCostAdv",
    function(this, base, vary)
        this.prop("mpCostBase", base)
        this.prop("mpCostVary", vary)
        return this
    end)

    .public("worthCostAdv",
    function(this, base, vary)
        this.prop("worthCostBase", base)
        this.prop("worthCostVary", vary)
        return this
    end)

    .public("coolDownAdv",
    function(this, base, vary)
        this.prop("coolDownBase", base)
        this.prop("coolDownVary", vary)
        return this
    end)

    .public("castChantAdv",
    function(this, base, vary)
        this.prop("castChantBase", base)
        this.prop("castChantVary", vary)
        return this
    end)

    .public("castKeepAdv",
    function(this, base, vary)
        this.prop("castKeepBase", base)
        this.prop("castKeepVary", vary)
        return this
    end)

    .public("castDistanceAdv",
    function(this, base, vary)
        this.prop("castDistanceBase", base)
        this.prop("castDistanceVary", vary)
        return this
    end)

    .public("castRadiusAdv",
    function(this, base, vary)
        this.prop("castRadiusBase", base)
        this.prop("castRadiusVary", vary)
        return this
    end)

    .public("castWidthAdv",
    function(this, base, vary)
        this.prop("castWidthBase", base)
        this.prop("castWidthVary", vary)
        return this
    end)

    .public("castHeightAdv",
    function(this, base, vary)
        this.prop("castHeightBase", base)
        this.prop("castHeightVary", vary)
        return this
    end)

    .public("hpCost",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        local cost = this.prop("hpCostBase") + (whichLevel - 1) * this.prop("hpCostVary")
        if (type(this.bindUnit) == "function") then
            ---@type Unit
            local u = this.bindUnit()
            if (isObject(u, "Unit")) then
                cost = cost * (1 + 0.01 * u.cost())
            end
        end
        return math.ceil(math.max(0, cost))
    end)

    .public("mpCost",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        local cost = this.prop("mpCostBase") + (whichLevel - 1) * this.prop("mpCostVary")
        if (type(this.bindUnit) == "function") then
            ---@type Unit
            local u = this.bindUnit()
            if (isObject(u, "Unit")) then
                cost = cost * (1 + 0.01 * u.cost())
            end
        end
        return math.ceil(math.max(0, cost))
    end)

    .public("worthCost",
    function(this, whichLevel)
        local base = this.prop("worthCostBase")
        if (base == nil) then
            return
        end
        whichLevel = whichLevel or this.level()
        local worthKeys = Game().worth().keys()
        local val = {}
        local vary
        if (whichLevel > 1) then
            vary = this.prop("worthCostVary")
        end
        for _, k in ipairs(worthKeys) do
            if (type(base[k]) == "number" and base[k] ~= 0) then
                val[k] = base[k]
            end
            if (type(vary) == "table" and type(vary[k]) == "number" and vary[k] ~= 0) then
                val[k] = (val[k] or 0) + (whichLevel - 1) * vary[k]
            end
        end
        if (type(this.bindUnit) == "function") then
            ---@type Unit
            local u = this.bindUnit()
            if (isObject(u, "Unit")) then
                local percent = u.cost()
                val = Game().worthCale(val, "*", 1 + 0.01 * percent)
            end
        end
        return Game().worthL2U(val)
    end)

    .public("coolDown",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        local cd = this.prop("coolDownBase") + (whichLevel - 1) * this.prop("coolDownVary")
        if (type(this.bindUnit) == "function") then
            ---@type Unit
            local u = this.bindUnit()
            if (isObject(u, "Unit")) then
                cd = cd * (1 + 0.01 * u.coolDown()) + u.coolDownSec()
            end
        end
        return math.max(0, math.trunc(cd))
    end)

    .public("castChant",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        local castChant = this.prop("castChantBase") + (whichLevel - 1) * this.prop("castChantVary")
        if (type(this.bindUnit) == "function") then
            ---@type Unit
            local u = this.bindUnit()
            if (isObject(u, "Unit")) then
                castChant = castChant * (1 + 0.01 * u.castChant())
            end
        end
        return math.max(0, math.trunc(castChant, 2))
    end)

    .public("castKeep",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        return math.max(0, math.trunc(this.prop("castKeepBase") + (whichLevel - 1) * this.prop("castKeepVary")))
    end)

    .public("castDistance",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        return math.max(0, math.round(this.prop("castDistanceBase") + (whichLevel - 1) * this.prop("castDistanceVary")))
    end)

    .public("castRadius",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        return math.max(0, math.round(this.prop("castRadiusBase") + (whichLevel - 1) * this.prop("castRadiusVary")))
    end)

    .public("castWidth",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        return math.max(0, math.round(this.prop("castWidthBase") + (whichLevel - 1) * this.prop("castWidthVary")))
    end)

    .public("castHeight",
    function(this, whichLevel)
        whichLevel = whichLevel or this.level()
        return math.max(0, math.round(this.prop("castHeightBase") + (whichLevel - 1) * this.prop("castHeightVary")))
    end)

    .public("levelMax",
    function(this, modify)
        return this.prop("levelMax", modify)
    end)

    .public("level",
    function(this, modify)
        return this.prop("level", modify)
    end)

    .public("levelUpNeedPoint",
    function(this, modify)
        return this.prop("levelUpNeedPoint", modify)
    end)

    .public("description",
    function(this, modify)
        if (type(modify) == "table") then
            return this.prop("description", modify)
        end
        local description = this.prop("description")
        if (type(description) ~= "table") then
            return nil
        end
        local desc = {}
        for _, d in ipairs(description) do
            local ms = string.subBetween(d, '{', '}')
            if (#ms > 0) then
                for _, m in ipairs(ms) do
                    local allow = true
                    if (string.subPos(m[3], "bindUnit()") ~= false) then
                        if (this.bindUnit == nil or isObject(this.bindUnit(), "Unit") == false) then
                            allow = false
                        end
                    end
                    local d1 = string.sub(d, 1, m[1])
                    local d2 = string.sub(d, m[2])
                    if (allow) then
                        local l = load("return function(this) return (" .. m[3] .. ") end")
                        local to = tostring(l()(this))
                        d = d1 .. to .. d2
                    else
                        d = d1 .. d2
                    end
                end
            end
            table.insert(desc, d)
        end
        return desc
    end)

    .public("banCursor",
    function(this, modify)
        return this.prop("banCursor", modify)
    end)

    .public("isBanCursor",
    function(this, options)
        local cond = this.banCursor()
        if (type(cond) ~= "function") then
            return false
        end
        return cond(options)
    end)         ---@class
view = view or {}

-- 窗口大小修改绑定
view._adaptiveFrames = view._adaptiveFrames or nil
view._frameEventKeys = view._frameEventKeys or {
    "onMouseLeftClick", "onMouseLeftRelease",
    "onMouseRightClick", "onMouseRightRelease",
    "onMouseMove", "onMouseEnter", "onMouseLeave"
}

---@param whichFrame Frame
function view.isGameUI(whichFrame)
    if (FrameGameUI == nil) then
        return whichFrame.handle() == japi.DzGetGameUI()
    end
    return whichFrame.id() == FrameGameUI.id()
end

--- 锚指的是一个frame的中心，相对于屏幕左下角的{X,Y,W,H}(RX)
---@param whichFrame Frame
---@return noteAnchorData
function view.setAnchor(whichFrame)
    local relative = whichFrame.relation()
    local size = whichFrame.size()
    if (relative ~= nil and size ~= nil) then
        ---@type noteAnchorData
        local anchorParent = relative[2].anchor()
        if (anchorParent ~= nil) then
            local point = relative[1]
            local relativePoint = relative[3]
            -- 偏移度
            local aw
            local ah
            local pw
            local ph
            if (point == FRAME_ALIGN_LEFT_TOP or point == FRAME_ALIGN_LEFT or point == FRAME_ALIGN_LEFT_BOTTOM) then
                aw = 1
            elseif (point == FRAME_ALIGN_TOP or point == FRAME_ALIGN_CENTER or point == FRAME_ALIGN_BOTTOM) then
                aw = 0
            elseif (point == FRAME_ALIGN_RIGHT_TOP or point == FRAME_ALIGN_RIGHT or point == FRAME_ALIGN_RIGHT_BOTTOM) then
                aw = -1
            end
            if (point == FRAME_ALIGN_LEFT_TOP or point == FRAME_ALIGN_TOP or point == FRAME_ALIGN_RIGHT_TOP) then
                ah = -1
            elseif (point == FRAME_ALIGN_LEFT or point == FRAME_ALIGN_CENTER or point == FRAME_ALIGN_RIGHT) then
                ah = 0
            elseif (point == FRAME_ALIGN_LEFT_BOTTOM or point == FRAME_ALIGN_BOTTOM or point == FRAME_ALIGN_RIGHT_BOTTOM) then
                ah = 1
            end
            if (relativePoint == FRAME_ALIGN_LEFT_TOP or relativePoint == FRAME_ALIGN_LEFT or relativePoint == FRAME_ALIGN_LEFT_BOTTOM) then
                pw = -1
            elseif (relativePoint == FRAME_ALIGN_TOP or relativePoint == FRAME_ALIGN_CENTER or relativePoint == FRAME_ALIGN_BOTTOM) then
                pw = 0
            elseif (relativePoint == FRAME_ALIGN_RIGHT_TOP or relativePoint == FRAME_ALIGN_RIGHT or relativePoint == FRAME_ALIGN_RIGHT_BOTTOM) then
                pw = 1
            end
            if (relativePoint == FRAME_ALIGN_LEFT_TOP or relativePoint == FRAME_ALIGN_TOP or relativePoint == FRAME_ALIGN_RIGHT_TOP) then
                ph = 1
            elseif (relativePoint == FRAME_ALIGN_LEFT or relativePoint == FRAME_ALIGN_CENTER or relativePoint == FRAME_ALIGN_RIGHT) then
                ph = 0
            elseif (relativePoint == FRAME_ALIGN_LEFT_BOTTOM or relativePoint == FRAME_ALIGN_BOTTOM or relativePoint == FRAME_ALIGN_RIGHT_BOTTOM) then
                ph = -1
            end
            if (aw ~= nil and ah ~= nil and pw ~= nil and ph ~= nil) then
                local offsetX = relative[4]
                local offsetY = relative[5]
                local parentX = anchorParent[1]
                local parentY = anchorParent[2]
                local parentW = anchorParent[3]
                local parentH = anchorParent[4]
                local anchorX
                local anchorY
                local anchorW = size[1]
                local anchorH = size[2]
                local pwHalf = parentW / 2
                local phHalf = parentH / 2
                local awHalf = anchorW / 2
                local ahHalf = anchorH / 2
                anchorX = offsetX + parentX + pw * pwHalf + aw * awHalf
                anchorY = offsetY + parentY + ph * phHalf + ah * ahHalf
                anchorX = math.min(anchorX, 0.8 - awHalf)
                anchorX = math.max(anchorX, awHalf)
                anchorY = math.min(anchorY, 0.6 - ahHalf)
                anchorY = math.max(anchorY, ahHalf)
                whichFrame.prop("anchor", { anchorX, anchorY, anchorW, anchorH })
            end
        end
    end
    local child = whichFrame.children()
    if (isArray(child)) then
        child.forEach(function(_, c)
            view.setAnchor(c)
        end)
    end
end

---@protected
---@param whichFrame Frame
---@param key string|nil
function view.registerFrameEvent(whichFrame, evt, key)
    if (whichFrame == nil or evt == nil or key == nil) then
        return
    end
    ---@type table<string,Array>
    local list = whichFrame.prop("evtList")
    local isShow = whichFrame.show() and (false == whichFrame.isDestroy())
    if (isArray(list[evt])) then
        local func = list[evt].get(key)
        local ek = whichFrame.id() .. key
        if (isShow == false or type(func) ~= "function") then
            if (evt == "onMouseLeftClick") then
                mouse.onLeftRelease(ek, nil)
            elseif (evt == "onMouseRightClick") then
                mouse.onRightRelease(ek, nil)
            elseif (evt == "onMouseMove") then
                mouse.onMove(ek, 1, nil)
            elseif (evt == "onMouseEnter") then
                mouse.onMove(ek .. '_E', nil)
            elseif (evt == "onMouseLeave") then
                mouse.onMove(ek .. '_L', nil)
            end
        else
            if (evt == "onMouseLeftClick") then
                mouse.onLeftRelease(ek, function(evtData)
                    local anchor = whichFrame.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (rx < xMax and rx > xMin and ry < yMax and ry > yMin) then
                            func({ triggerFrame = whichFrame, triggerPlayer = evtData.triggerPlayer })
                        end
                    end
                end)
            elseif (evt == "onMouseRightClick") then
                mouse.onRightRelease(ek, function(evtData)
                    local anchor = whichFrame.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (rx < xMax and rx > xMin and ry < yMax and ry > yMin) then
                            func({ triggerFrame = whichFrame, triggerPlayer = evtData.triggerPlayer })
                        end
                    end
                end)
            elseif (evt == "onMouseMove") then
                mouse.onMove(ek, function(evtData)
                    local anchor = whichFrame.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (rx < xMax and rx > xMin and ry < yMax and ry > yMin) then
                            func({ triggerFrame = whichFrame, triggerPlayer = evtData.triggerPlayer })
                        end
                    end
                end)
            elseif (evt == "onMouseEnter") then
                mouse.onMove(ek .. '_E', function(evtData)
                    local entering = whichFrame.prop("mouseEntering" .. key) or 0
                    if (entering > 1) then
                        return
                    end
                    local anchor = whichFrame.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (rx < xMax and rx > xMin and ry < yMax and ry > yMin) then
                            whichFrame.prop("mouseEntering" .. key, entering + 1)
                            func({ triggerFrame = whichFrame, triggerPlayer = evtData.triggerPlayer })
                        end
                    end
                end)
            elseif (evt == "onMouseLeave") then
                mouse.onMove(ek .. '_L', function(evtData)
                    local entering = whichFrame.prop("mouseEntering" .. key) or 0
                    if (entering == 0) then
                        return
                    end
                    local anchor = whichFrame.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (rx > xMax or rx < xMin or ry > yMax or ry < yMin) then
                            whichFrame.prop("mouseEntering" .. key, NIL)
                            func({ triggerFrame = whichFrame, triggerPlayer = evtData.triggerPlayer })
                        end
                    end
                end)
            end
        end
    end
end

---@protected
---@param whichFrame Frame
---@param key string|nil
---@param evt string|nil
function view.clearFrameEvent(whichFrame)
    ---@type table<string,Array>
    local list = whichFrame.prop("evtList")
    if (list ~= nil) then
        local es = view._frameEventKeys
        for _, e in ipairs(es) do
            if (isArray(list[e])) then
                list[e].forEach(function(key)
                    list[e].set(key, nil)
                    view.registerFrameEvent(whichFrame, e, key)
                end, true)
            end
        end
        whichFrame:clear("evtList")
    end
end

---@protected
---@param whichFrame Frame
---@param key string|nil
---@param evt string|nil
function view.triggerFrameEvent(whichFrame, evt)
    if (whichFrame == nil) then
        return
    end
    if (whichFrame.isDestroy()) then
        return
    end
    ---@type table<string,Array>
    local list = whichFrame.prop("evtList")
    if (evt) then
        if (isArray(list[evt])) then
            list[evt].forEach(function(key)
                view.registerFrameEvent(whichFrame, evt, key)
            end)
        end
    else
        local es = view._frameEventKeys
        for _, e in ipairs(es) do
            if (isArray(list[e])) then
                list[e].forEach(function(key)
                    view.registerFrameEvent(whichFrame, e, key)
                end)
            end
        end
    end
    local child = whichFrame.children()
    if (isArray(child)) then
        child.forEach(function(_, c)
            view.triggerFrameEvent(c, evt)
        end)
    end
end
---@param this Unit
Class("Unit")

    .public("onEvent",
    function(this, evt, ...)
        event.register(this, evt, ...)
        return this
    end)

    .public("handle",
    function(this)
        return this.__HANDLE__
    end)

    .public("periodRemain",
    function(this)
        ---@type Timer
        local periodTimer = this.prop("periodTimer")
        if (isObject(periodTimer, "Timer")) then
            return periodTimer.remain()
        end
        return -1
    end)

    .public("exp",
    function(this, modify)
        return this.prop("exp", modify)
    end)

    .public("expNeed",
    function(this, whichLevel)
        whichLevel = whichLevel or (1 + this.level())
        whichLevel = math.max(1, whichLevel)
        whichLevel = math.min(Game().unitLevelMax(), whichLevel)
        return Game().unitExpNeeds(math.floor(whichLevel))
    end)

    .public("isSelf",
    function(this, Who)
        return this.id() == Who.id()
    end)

    .public("isOther",
    function(this, Who)
        return not this.isSelf(Who)
    end)

    .public("isEnemy",
    function(this, JudgePlayer)
        return J.IsUnitEnemy(this.handle(), JudgePlayer.handle())
    end)

    .public("isAlly",
    function(this, JudgePlayer)
        return J.IsUnitAlly(this.handle(), JudgePlayer.handle())
    end)

    .public("isAlive",
    function(this)
        return this.prop("isAlive")
    end)

    .public("isDead",
    function(this)
        return not this.prop("isAlive")
    end)

    .public("isGround",
    function(this)
        return this.prop("moveType") == UNIT_MOVE_TYPE.foot
    end)

    .public("isAir",
    function(this)
        return this.prop("moveType") == UNIT_MOVE_TYPE.fly
    end)

    .public("isWater",
    function(this)
        local mt = this.prop("moveType")
        return mt == UNIT_MOVE_TYPE.amphibious or mt == UNIT_MOVE_TYPE.float
    end)

    .public("isMelee",
    function(this)
        return this.missile() == nil and this.lightning() == nil
    end)

    .public("isRanged",
    function(this)
        return this.missile() ~= nil or this.lightning() ~= nil
    end)

    .public("isPause",
    function(this)
        return this.superposition("pause") > 0
    end)

    .public("isShow",
    function(this)
        return this.superposition("show") > 0
    end)

    .public("isCollision",
    function(this)
        return this.superposition("collision") > 0
    end)

    .public("isSelectable",
    function(this)
        return this.superposition("select") > 0
    end)

    .public("isAttackAble",
    function(this)
        return this.prop("isAttackAble") == true
    end)

    .public("isInvulnerable",
    function(this)
        return this.superposition("invulnerable") > 0
    end)

    .public("isInvisible",
    function(this)
        return this.superposition("invisible") > 0
    end)

    .public("isHurting",
    function(this)
        return this.superposition("hurt") > 0
    end)

    .public("isDamaging",
    function(this)
        return this.superposition("damage") > 0
    end)

    .public("isStunning",
    function(this)
        return this.superposition("stun") > 0
    end)

    .public("isPunishing",
    function(this)
        return this.superposition("punish") > 0
    end)

    .public("isSilencing",
    function(this)
        return this.superposition("silent") > 0
    end)

    .public("isUnArming",
    function(this)
        return this.superposition("unArm") > 0
    end)

    .public("isCrackFlying",
    function(this)
        return this.superposition("crackFly") > 0
    end)

    .public("isLeaping",
    function(this)
        return this.superposition("leap") > 0
    end)

    .public("isWhirlwind",
    function(this)
        return this.superposition("whirlwind") > 0
    end)

    .public("isAbilityChantCasting",
    function(this)
        return isObject(this.prop("abilityChantCastTimer"), "Timer")
    end)

    .public("isAbilityKeepCasting",
    function(this)
        return isObject(this.prop("abilityKeepCastTimer"), "Timer")
    end)

    .public("isInterrupt",
    function(this)
        return this.isDead() or this.isStunning() or this.isCrackFlying() or this.isLeaping() or this.isWhirlwind() or this.isSilencing()
    end)

    .public("hasAbility",
    function(this, whichTpl)
        if (false == isObject(whichTpl, "AbilityTpl")) then
            return false
        end
        local has = false
        local ss = this.abilitySlot().storage()
        for _, v in ipairs(ss) do
            if (v.prop("tpl").id() == whichTpl.id()) then
                has = true
                break
            end
        end
        return has
    end)

    .public("hasItem",
    function(this, whichTpl)
        if (false == isObject(whichTpl, "ItemTpl")) then
            return false
        end
        local has = false
        local ss = this.itemSlot().storage()
        for _, v in ipairs(ss) do
            if (v.prop("tpl").id() == whichTpl.id()) then
                has = true
                break
            end
        end
        return has
    end)

    .public("x",
    function(this)
        return J.GetUnitX(this.handle())
    end)

    .public("y",
    function(this)
        return J.GetUnitY(this.handle())
    end)

    .public("z",
    function(this)
        return japi.Z(this.x(), this.y())
    end)

    .public("h",
    function(this)
        return this.z() + this.flyHeight() + this.collision() / 2
    end)

    .public("facing",
    function(this, modify)
        if (modify ~= nil) then
            J.SetUnitFacing(this.handle(), modify)
            return this
        end
        return J.GetUnitFacing(this.handle())
    end)

    .public("owner",
    function(this, modify)
        return this.prop("owner", modify)
    end)

    .public("teamColor",
    function(this, modify)
        return this.prop("teamColor", modify)
    end)

    .public("lastHurtSource",
    function(this, modify)
        return this.prop("lastHurtSource", modify)
    end)

    .public("lastDamageTarget",
    function(this, modify)
        return this.prop("lastDamageTarget", modify)
    end)

    .public("position",
    function(this, x, y)
        if (type(x) == "number" and type(y) == "number") then
            J.SetUnitPosition(this.handle(), x, y)
        end
    end)

    .public("animate",
    function(this, animate)
        if (type(animate) == "string") then
            J.SetUnitAnimation(this.handle(), animate)
        elseif (type(animate) == "number") then
            J.SetUnitAnimationByIndex(this.handle(), math.floor(animate))
        end
    end)

    .public("animateProperties",
    function(this, animate, enable)
        J.AddUnitAnimationProperties(this.handle(), animate, enable)
    end)

    .public("kill",
    function(this)
        J.KillUnit(this.handle())
    end)

    .public("exploded",
    function(this)
        J.SetUnitExploded(this.handle())
        J.KillUnit(this.handle())
    end)

    .public("orderStop",
    function(this)
        J.IssueImmediateOrder(this.handle(), "stop")
    end)

    .public("orderHold",
    function(this)
        J.IssueImmediateOrder(this.handle(), "holdposition")
    end)

    .public("orderAttack",
    function(this, tx, ty)
        J.IssuePointOrder(this.handle(), "attack", tx, ty)
    end)

    .public("orderFollowTargetUnit",
    function(this, targetUnit)
        J.IssueTargetOrder(this.handle(), "move", targetUnit.handle())
    end)

    .public("orderAttackTargetUnit",
    function(this, targetUnit)
        J.IssueTargetOrder(this.handle(), "attack", targetUnit.handle())
    end)

    .public("orderMove",
    function(this, tx, ty)
        J.IssuePointOrder(this.handle(), "move", tx, ty)
    end)

    .public("orderAIMove",
    function(this, tx, ty)
        J.IssuePointOrderById(this.handle(), 851988, tx, ty)
    end)

    .public("orderPatrol",
    function(this, tx, ty)
        J.IssuePointOrderById(this.handle(), 851990, tx, ty)
    end)

    .public("orderRoute",
    function(this, isLoop, routes)
        if (type(routes) == "table" and #routes > 0) then
            this.prop("orderRoute", routes)
            this.prop("orderRouteLoop", isLoop or false)
        else
            this.orderRouteDestroy()
        end
    end)

    .public("orderRouteSet",
    function(this, index, route)
        local r = this.prop("orderRoute")
        if (type(r) == "table") then
            if (index <= 0 or index > (#r + 1)) then
                index = #r + 1
                r[index] = route
            else
                if (route == nil) then
                    table.remove(r, index)
                else
                    r[index] = route
                end
            end
        end
    end)

    .public("orderRouteDestroy",
    function(this)
        event.register(this, EVENT.Unit.MoveRoute, "SLOrderRoute", nil)
        this.prop("orderRoute", NIL)
        this.prop("orderRouteLoop", NIL)
        this.prop("orderRouteIdx", NIL)
        this.prop("orderRoutePause", NIL)
        local t = this.prop("orderRoutePauseTimer")
        if (isObject(t, "Timer")) then
            t.destroy()
            this.prop("orderRoutePauseTimer", NIL)
        end
    end)

    .public("orderRoutePause",
    function(this)
        local i = this.prop("orderRouteIdx")
        if (i >= 1) then
            this.prop("orderRoutePause", i)
            this.prop("orderRoutePauseTimer", time.setTimeout(10, function()
                this.orderRouteDestroy()
            end))
        end
    end)

    .public("orderRouteResume",
    function(this)
        local r = this.prop("orderRoute")
        local i = this.prop("orderRouteIdx")
        this.prop("orderRoutePause", NIL)
        local t = this.prop("orderRoutePauseTimer")
        if (isObject(t, "Timer")) then
            t.destroy()
            this.prop("orderRoutePauseTimer", NIL)
        end
        if (type(r) == "table" and type(i) == "number") then
            this.orderMove(r[i][1], r[i][2])
        end
    end)

    .public("effect",
    function(this, model, duration)
        return effect.xyz(model, this.x(), this.y(), this.h(), duration)
    end)

    .public("attach",
    function(this, model, attach, duration)
        if (model == nil or attach == nil) then
            return
        end
        return effect.attach(model, this, attach, duration)
    end)

    .public("abilitySlot",
    function(this)
        return this.prop("abilitySlot")
    end)

    .public("abilityChantCastingSet",
    function(this)
        ---@type Timer
        local t = this.prop("abilityChantCastTimer")
        if (isObject(t, "Timer")) then
            return t.period() * this.prop("abilityChantCastTimerStatic")
        end
        return 0
    end)

    .public("abilityChantCastingRemain",
    function(this)
        ---@type Timer
        local t = this.prop("abilityChantCastTimer")
        if (isObject(t, "Timer")) then
            return t.period() * (this.prop("abilityChantCastTimerStatic") - this.prop("abilityChantCastTimerInc"))
        end
        return 0
    end)

    .public("abilityKeepCastingSet",
    function(this)
        ---@type Timer
        local t = this.prop("abilityKeepCastTimer")
        if (isObject(t, "Timer")) then
            return t.period() * this.prop("abilityKeepCastTimerStatic")
        end
        return 0
    end)

    .public("abilityKeepCastingRemain",
    function(this)
        ---@type Timer
        local t = this.prop("abilityKeepCastTimer")
        if (isObject(t, "Timer")) then
            return t.period() * (this.prop("abilityKeepCastTimerStatic") - this.prop("abilityKeepCastTimerInc"))
        end
        return 0
    end)

    .public("itemSlot",
    function(this)
        return this.prop("itemSlot")
    end)

    .public("distanceAction",
    function(this, target, judgeDistance, callFunc)
        local distanceTimer = this.prop("distanceTimer")
        if (isObject(distanceTimer, "Timer")) then
            distanceTimer.destroy()
            distanceTimer = nil
            this.prop("distanceTimer", NIL)
        end
        --- 距离判断
        local _x, _y = math.coordinate(target)
        local d1 = math.distance(_x, _y, this.x(), this.y())
        if (d1 > judgeDistance) then
            local px, py = math.polar(_x, _y, judgeDistance - 75, math.angle(_x, _y, this.x(), this.y()))
            J.IssuePointOrder(this.handle(), "move", px, py)
            this.prop("distanceTimer", time.setInterval(0.1, function(curTimer)
                if (this.isInterrupt()) then
                    curTimer.destroy()
                    this.prop("distanceTimer", NIL)
                    return
                end
                _x, _y = math.coordinate(target)
                local d2 = math.distance(_x, _y, this.x(), this.y())
                if (d2 <= judgeDistance) then
                    curTimer.destroy()
                    this.prop("distanceTimer", NIL)
                    callFunc()
                end
            end))
        else
            callFunc()
        end
    end)

    .public("pickItem",
    function(this, targetItem)
        if (isObject(targetItem, "Item") and targetItem.instance() == true) then
            this.distanceAction(targetItem, 150, function()
                if (targetItem.instance() == true) then
                    this.itemSlot().push(targetItem)
                    local v = Vcm("war3_pickItem")
                    if (isObject(v, "Vcm")) then
                        async.call(this.owner(), function()
                            v.play()
                        end)
                    end
                end
            end)
        end
    end)                             --- 提取一些需要的参数
damaging.defined("prop", function(options)
    options.defend = options.targetUnit.defend()
    options.avoid = options.targetUnit.avoid() - options.sourceUnit.aim()
end)

--- 判断无视装甲类型
damaging.defined("breakArmor", function(options)
    local ignore = { defend = false, avoid = false, invincible = false }
    if (#options.breakArmor > 0) then
        for _, b in ipairs(options.breakArmor) do
            if (b ~= nil) then
                ignore[b.value] = true
                --- 触发无视防御事件
                event.trigger(options.sourceUnit, EVENT.Unit.BreakArmor, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit, breakType = b })
                --- 触发被破防事件
                event.trigger(options.targetUnit, EVENT.Unit.Be.BreakArmor, { triggerUnit = options.targetUnit, breakUnit = options.sourceUnit, breakType = b })
            end
        end
    end
    --- 处理护甲
    if (ignore.defend == true and options.defend > 0) then
        options.defend = 0
    end
    --- 处理回避
    if (ignore.avoid == true and options.avoid > 0) then
        options.avoid = 0
    end
    --- 单位是否无视无敌
    if (true == options.targetUnit.isInvulnerable()) then
        if (ignore.invincible == false) then
            --- 触发无敌抵御事件
            options.damage = 0
            event.trigger(options.sourceUnit, EVENT.Unit.ImmuneInvincible, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit })
            return
        end
    end
end)

--- 自身攻击暴击
damaging.defined("crit", function(options)
    local approve = (options.sourceUnit ~= nil and (options.damageSrc == DAMAGE_SRC.attack or options.damageSrc == DAMAGE_SRC.ability))
    if (approve) then
        local crit = options.sourceUnit.crit()
        if (crit > 0) then
            local odds = options.sourceUnit.odds("crit") - options.targetUnit.resistance("crit")
            if (odds > math.rand(1, 100)) then
                options.damage = options.damage * (1 + crit * 0.01)
                --- 触发时自动无视回避
                options.avoid = 0
                --- 触发暴击事件
                ability.crit({ sourceUnit = options.sourceUnit, targetUnit = options.targetUnit })
            end
        end
    end
end)

--- 回避
damaging.defined("avoid", function(options)
    local approve = (options.avoid > 0 and (options.damageSrc == DAMAGE_SRC.attack or options.damageSrc == DAMAGE_SRC.rebound))
    if (approve) then
        if (options.avoid > math.rand(1, 100)) then
            -- 触发回避事件
            options.damage = 0
            event.trigger(options.targetUnit, EVENT.Unit.Avoid, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit })
            event.trigger(options.sourceUnit, EVENT.Unit.Be.Avoid, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit })
            return
        end
    end
end)

--- 伤害加深(%)
damaging.defined("damageIncrease", function(options)
    local approve = (options.sourceUnit ~= nil)
    if (approve) then
        local damageIncrease = options.sourceUnit.damageIncrease()
        if (damageIncrease > 0) then
            options.damage = options.damage * (1 + damageIncrease * 0.01)
        end
    end
end)

--- 受伤加深(%)
damaging.defined("hurtIncrease", function(options)
    local hurtIncrease = options.targetUnit.hurtIncrease()
    if (hurtIncrease > 0) then
        options.damage = options.damage * (1 + hurtIncrease * 0.01)
    end
end)

--- 反伤(%)
damaging.defined("hurtRebound", function(options)
    -- 抵抗
    local approve = (options.sourceUnit ~= nil and options.damageSrc == DAMAGE_SRC.rebound)
    if (approve) then
        local resistance = options.sourceUnit.resistance("hurtRebound")
        if (resistance > 0) then
            options.damage = math.max(0, options.damage * (1 - resistance * 0.01))
            if (options.damage < 1) then
                options.damage = 0
                return
            end
        end
    end
    -- 反射
    approve = (options.sourceUnit ~= nil and (options.damageSrc == DAMAGE_SRC.attack or options.damageSrc == DAMAGE_SRC.ability))
    if (approve) then
        local hurtRebound = options.targetUnit.hurtRebound()
        local odds = options.targetUnit.odds("hurtRebound")
        if (hurtRebound > 0 and odds > math.rand(1, 100)) then
            local dmgRebound = math.trunc(options.damage * hurtRebound * 0.01, 3)
            if (dmgRebound >= 1.000) then
                local damagedArrived = function()
                    --- 触发反伤事件
                    ability.damage({
                        sourceUnit = options.targetUnit,
                        targetUnit = options.sourceUnit,
                        damage = dmgRebound,
                        damageSrc = DAMAGE_SRC.rebound,
                        damageType = options.damageType,
                    })
                end
                if (options.damageSrc == DAMAGE_SRC.attack) then
                    -- 攻击下
                    if (options.sourceUnit.isMelee()) then
                        damagedArrived()
                    elseif (options.sourceUnit.isRanged()) then
                        local lt = options.sourceUnit.lightning()
                        if (isObject(lt, "Lightning")) then
                            local lDur = 0.3
                            local lDelay = lDur * 0.6
                            ability.lightning(lt.lightningType(), options.targetUnit.x(), options.targetUnit.y(), targetUnit.h(), sourceUnit.x(), sourceUnit.y(), sourceUnit.h(), lDur)
                            time.setTimeout(lDelay, function()
                                damagedArrived()
                            end)
                        else
                            local m = options.sourceUnit.missile()
                            if (isObject(m, "Missile")) then
                                ability.missile({
                                    modelAlias = m.modelAlias(),
                                    sourceUnit = options.targetUnit,
                                    targetUnit = options.sourceUnit,
                                    speed = m.speed(),
                                    height = 0,
                                    acceleration = m.acceleration(),
                                    onEnd = function() damagedArrived() end,
                                })
                            end
                        end
                    end
                elseif (options.damageSrc == DAMAGE_SRC.ability) then
                    -- 技能情况
                    damagedArrived()
                end
            end
        end
    end
end)

--- 防御
damaging.defined("defend", function(options)
    if (options.defend < 0) then
        options.damage = options.damage + math.abs(options.defend)
    elseif (options.defend > 0) then
        options.damage = options.damage - options.defend
        if (options.damage < 1) then
            -- 触发防御完全抵消事件
            options.damage = 0
            event.trigger(options.targetUnit, EVENT.Unit.ImmuneDefend, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit })
            return
        end
    end
end)

--- 减伤(%)
damaging.defined("hurtReduction", function(options)
    local hurtReduction = options.targetUnit.hurtReduction()
    if (hurtReduction > 0) then
        options.damage = options.damage * (1 - hurtReduction * 0.01)
        if (options.damage < 1) then
            -- 触发减伤完全抵消事件
            options.damage = 0
            event.trigger(options.targetUnit, EVENT.Unit.ImmuneReduction, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit })
            return
        end
    end
end)

--- 攻击吸血
damaging.defined("hpSuckAttack", function(options)
    local approve = (options.sourceUnit ~= nil and options.damageSrc == DAMAGE_SRC.attack)
    if (approve) then
        local percent = options.sourceUnit.hpSuckAttack() - options.targetUnit.resistance("hpSuckAttack")
        local val = options.damage * percent * 0.01
        if (percent > 0 and val > 0) then
            options.sourceUnit.hpCur("+=" .. val)
            --- 触发吸血事件
            event.trigger(options.sourceUnit, EVENT.Unit.HPSuckAttack, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit, value = val, percent = percent })
            event.trigger(options.targetUnit, EVENT.Unit.Be.HPSuckAttack, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit, value = val, percent = percent })
        end
    end
end)

--- 技能吸血
damaging.defined("hpSuckAbility", function(options)
    local approve = (options.sourceUnit ~= nil and options.damageSrc == DAMAGE_SRC.ability)
    if (approve) then
        local percent = options.sourceUnit.hpSuckAbility() - options.targetUnit.resistance("hpSuckAbility")
        local val = options.damage * percent * 0.01
        if (percent > 0 and val > 0) then
            options.sourceUnit.hpCur("+=" .. val)
            --- 触发技能吸血事件
            event.trigger(options.sourceUnit, EVENT.Unit.HPSuckAbility, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit, value = val, percent = percent })
            event.trigger(options.targetUnit, EVENT.Unit.Be.HPSuckAbility, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit, value = val, percent = percent })
        end
    end
end)

--- 攻击吸魔;吸魔会根据伤害，扣减目标的魔法值，再据百分比增加自己的魔法值;目标魔法值不足 1 从而吸收时，则无法吸取
damaging.defined("mpSuckAttack", function(options)
    local approve = (options.sourceUnit ~= nil and options.damageSrc == DAMAGE_SRC.attack and options.sourceUnit.mp() > 0 and options.targetUnit.mpCur() > 0)
    if (approve) then
        local percent = options.sourceUnit.mpSuckAttack() - options.targetUnit.resistance("mpSuckAttack")
        if (percent > 0) then
            local mana = math.min(options.targetUnit.mp(), options.damage)
            local val = mana * percent * 0.01
            if (val > 1) then
                options.targetUnit.mpCur("-=" .. val)
                options.sourceUnit.mpCur("+=" .. val)
                --- 触发吸魔事件
                event.trigger(options.sourceUnit, EVENT.Unit.MPSuckAttack, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit, value = val, percent = percent })
                event.trigger(options.targetUnit, EVENT.Unit.Be.MPSuckAttack, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit, value = val, percent = percent })
            end
        end
    end
end)

--- 技能吸魔;吸魔会根据伤害，扣减目标的魔法值，再据百分比增加自己的魔法值;目标魔法值不足 1 从而吸收时，则无法吸取
damaging.defined("mpSuckAbility", function(options)
    local approve = (options.sourceUnit ~= nil and options.damageSrc == DAMAGE_SRC.ability and options.sourceUnit.mp() > 0 and options.targetUnit.mpCur() > 0)
    if (approve) then
        local percent = options.sourceUnit.mpSuckAbility() - options.targetUnit.resistance("mpSuckAbility")
        if (percent > 0) then
            local mana = math.min(options.targetUnit.mp(), options.damage)
            local val = mana * percent * 0.01
            if (val > 1) then
                options.targetUnit.mpCur("-=" .. val)
                options.sourceUnit.mpCur("+=" .. val)
                --- 触发技能吸魔事件
                event.trigger(options.sourceUnit, EVENT.Unit.MPSuckAbility, { triggerUnit = options.sourceUnit, targetUnit = options.targetUnit, value = val, percent = percent })
                event.trigger(options.targetUnit, EVENT.Unit.Be.MPSuckAbility, { triggerUnit = options.targetUnit, sourceUnit = options.sourceUnit, value = val, percent = percent })
            end
        end
    end
end)

--- 硬直
damaging.defined("punishCur", function(options)
    local approve = (options.targetUnit.punish() > 0 and options.targetUnit.isPunishing() == false)
    if (approve) then
        options.targetUnit.punishCur("-=" .. options.damage)
    end
end)

--- 伤害类型占比处理
damaging.defined("enchant", function(options)
    options.damageTypeRatio = {}
    options.enchantType = {}
    local damageTypeOcc = 0
    local ratio = {}
    if (options.damageSrc == DAMAGE_SRC.attack and options.sourceUnit ~= nil) then
        -- 附加攻击形态的伤害类型
        enchant.types.forEach(function(ek, _)
            local ew = options.sourceUnit.enchantWeapon(ek)
            if (ew > 0) then
                damageTypeOcc = damageTypeOcc + ew
                if (ratio[ek] == nil) then
                    ratio[ek] = 0
                end
                ratio[ek] = ratio[ek] + ew
                table.insert(options.enchantType, ek)
            end
        end)
    elseif (type(options.damageType) == "table" and #options.damageType > 0) then
        for _, d in ipairs(options.damageType) do
            if (type(d) == "table" and d.value) then
                damageTypeOcc = damageTypeOcc + 1
                if (ratio[d.value] == nil) then
                    ratio[d.value] = 0
                end
                ratio[d.value] = ratio[d.value] + 1
                table.insert(options.enchantType, d.value)
            end
        end
    end
    if (damageTypeOcc == 0) then
        damageTypeOcc = 1
        ratio[DAMAGE_TYPE.common.value] = 1
    end
    local dtu = 1 / damageTypeOcc
    for _, dt in ipairs(DAMAGE_TYPE_KEYS) do
        if (ratio[dt] == nil) then
            ratio[dt] = 0
        end
        options.damageTypeRatio[dt] = dtu * ratio[dt]
    end
end)

-- 附魔类型(加成|抵抗|上身)
damaging.defined("enchantAppend", function(options)
    for _, et in ipairs(options.enchantType) do
        local addition = 0
        if (options.sourceUnit ~= nil) then
            local amplify = options.sourceUnit.enchant(et)
            if (amplify ~= 0) then
                addition = addition + amplify * 0.01
            end
        end
        local resistance = options.targetUnit.enchantResistance(et)
        if (resistance ~= 0) then
            addition = addition - resistance * 0.01
        end
        local d = options.damage * addition * options.damageTypeRatio[et]
        --- 触发附魔事件
        event.trigger(options.targetUnit, EVENT.Unit.Enchant, {
            triggerUnit = options.sourceUnit, targetUnit = options.targetUnit,
            enchantType = et,
            radio = options.damageTypeRatio[et], damage = d, addition = addition
        })
        options.damage = options.damage + d
    end
    if (#options.enchantType > 0) then
        enchant.append(options.targetUnit, options.sourceUnit, options.enchantType)
    end
end)
---@param this Unit
---@param resultNum number
---@param resultStr string
Class("Unit")
    .exec("attributes",
    function(this, resultAttributes)
        local eKey = "attributes"
        event.unregister(this, EVENT.Unit.Born, eKey)
        event.unregister(this, EVENT.Unit.LevelChange, eKey)
        if (type(resultAttributes) == "table") then
            for i = #resultAttributes, 1, -1 do
                local method = resultAttributes[i][1]
                local base = resultAttributes[i][2]
                local vary = resultAttributes[i][3]
                if (type(method) ~= "string" or (base == nil and vary == nil)) then
                    table.remove(resultAttributes, i)
                end
            end
            ---@param getData noteOnUnitBornData
            this.onEvent(EVENT.Unit.Born, eKey, function(getData)
                attribute.clever(resultAttributes, getData.triggerUnit, 0, getData.triggerUnit.level())
            end)
            ---@param lvcData noteOnUnitLevelChangeData
            this.onEvent(EVENT.Unit.LevelChange, eKey, function(lvcData)
                attribute.clever(resultAttributes, lvcData.triggerUnit, lvcData.triggerUnit.level(), lvcData.value)
            end)
        end
    end)
    .exec("sight",
    function(this, resultNum)
        local diff = math.floor(resultNum - this.prop("sightBase"))
        ability.sight(this.__HANDLE__, diff)
        this.prop("nsight", resultNum - this.prop("sightDiff"))
    end)
    .exec("nsight",
    function(this, resultNum)
        if (this.prop("sight") ~= nil) then
            local diff = math.floor(resultNum + this.prop("sightDiff") - this.prop("sightBase"))
            ability.sight(this.__HANDLE__, diff)
            this.prop("sight", resultNum + this.prop("sightDiff"))
        end
    end)
    .exec("attackSpaceBase",
    function(this, resultNum)
        resultNum = math.min(5, math.max(0.1, resultNum))
        local attackSpeed = this.prop("attackSpeed") or 0
        if (attackSpeed ~= 0) then
            resultNum = math.trunc(resultNum / (1 + math.min(math.max(attackSpeed, -80), 400) * 0.01))
        end
        japi.SetUnitState(this.__HANDLE__, UNIT_STATE_ATTACK_SPACE, resultNum)
        this.prop("attackSpace", resultNum)
    end)
    .exec("attackSpeed",
    function(this, resultNum)
        resultNum = math.min(400, math.max(-80, resultNum))
        local space = math.trunc(this.prop("attackSpaceBase") / (1 + resultNum * 0.01))
        space = math.min(5, math.max(0.1, space))
        japi.SetUnitState(this.__HANDLE__, UNIT_STATE_ATTACK_SPACE, space)
        this.prop("attackSpace", space)
    end)
    .exec("attackRangeAcquire",
    function(this, resultNum)
        resultNum = math.floor(resultNum)
        resultNum = math.min(9999, math.max(this.prop("attackRange") or 0, resultNum))
        J.SetUnitAcquireRange(this.__HANDLE__, resultNum)
    end)
    .exec("attackRange",
    function(this, resultNum)
        resultNum = math.floor(resultNum)
        resultNum = math.min(9999, math.max(0, resultNum))
        japi.SetUnitState(this.__HANDLE__, UNIT_STATE_ATTACK_RANGE, resultNum)
        local atkRangeAcquire = this.prop("attackRangeAcquire")
        if (atkRangeAcquire == nil or atkRangeAcquire < resultNum) then
            this.prop("attackRangeAcquire", resultNum)
            J.SetUnitAcquireRange(this.__HANDLE__, resultNum)
        end
    end)
    .exec("hp",
    function(this, resultNum)
        local hp = this.prop("hp")
        if (type(hp) == "number" and hp > 0) then
            local cur = this.prop("hpCur") or resultNum
            local percent = math.trunc(cur / hp)
            this.prop("hpCur", math.max(1, math.max(0, percent) * resultNum))
        end
    end)
    .exec("hpCur",
    function(this, resultNum)
        local hp = this.prop("hp")
        if (hp ~= nil) then
            local hpc = resultNum / hp * 1e4
            if (resultNum >= 1) then
                hpc = math.max(1, hpc)
            end
            J.SetUnitState(this.__HANDLE__, UNIT_STATE_LIFE, hpc)
            if (resultNum < hp) then
                monitor.listen("monitor-life_back", this)
            else
                if (this.prop("hpRegen") >= 0) then
                    monitor.ignore("monitor-life_back", this)
                else
                    monitor.listen("monitor-life_back", this)
                end
            end
        end
    end)
    .exec("hpRegen",
    function(this, resultNum)
        if (resultNum ~= nil and resultNum ~= 0) then
            monitor.listen("monitor-life_back", this)
        else
            monitor.ignore("monitor-life_back", this)
        end
    end)
    .exec("mp",
    function(this, resultNum)
        if (resultNum == 0) then
            this.prop("mpCur", 0)
        else
            local mp = this.prop("mp")
            if (type(mp) == "number" and mp > 0) then
                local cur = this.prop("mpCur") or resultNum
                local percent = math.trunc(cur / mp)
                this.prop("mpCur", math.max(1, math.max(0, percent) * resultNum))
            end
        end
    end)
    .exec("mpCur",
    function(this, resultNum)
        local mp = this.prop("mp")
        if (mp ~= nil and mp > 0) then
            if (resultNum < mp) then
                monitor.listen("monitor-mana_back", this)
            else
                if (this.prop("mpRegen") >= 0) then
                    monitor.ignore("monitor-mana_back", this)
                else
                    monitor.listen("monitor-mana_back", this)
                end
            end
        end
    end)
    .exec("mpRegen",
    function(this, resultNum)
        if (resultNum ~= nil and resultNum ~= 0) then
            monitor.listen("monitor-mana_back", this)
        else
            monitor.ignore("monitor-mana_back", this)
        end
    end)
    .exec("move",
    function(this, resultNum)
        resultNum = math.floor(resultNum)
        resultNum = math.min(522, math.max(0, resultNum))
        J.SetUnitMoveSpeed(this.__HANDLE__, resultNum)
    end)
    .exec("punish",
    function(this, resultNum)
        resultNum = math.floor(resultNum)
        resultNum = math.max(0, resultNum)
        if (this.prop("punishCur") == nil or this.prop("punish") <= 0) then
            this.prop("punishCur", resultNum)
        end
    end)
    .exec("punishCur",
    function(this, resultNum)
        local punish = this.prop("punish")
        if (punish == nil or punish <= 0) then
            monitor.ignore("monitor-punish_back", this)
        else
            resultNum = math.min(punish, resultNum)
            if (resultNum <= 0) then
                if (this.isPunishing() ~= true) then
                    monitor.ignore("monitor-punish_back", this)
                    if (this.isAlive()) then
                        local percent = 50
                        local resistance = this.resistance("punish")
                        if (resistance > 0) then
                            percent = percent - resistance
                            if (percent < 5) then
                                percent = 5
                            end
                        end
                        local dur = 5
                        local reduceAtkSpd = math.floor(percent)
                        local reduceMove = math.floor(percent * 0.01 * math.min(522, this.prop("move")))
                        this.prop("attackSpeed", "-=" .. reduceAtkSpd .. ";" .. dur)
                        this.prop("move", "-=" .. reduceMove .. ";" .. dur)
                        this.prop("animateScale", "-=" .. percent * 0.005 .. ";" .. dur)
                        --- 触发硬直事件
                        this.superposition("punish", "+=1")
                        event.trigger(this, EVENT.Unit.Punish, { triggerUnit = this, sourceUnit = this.lastHurtSource(), percent = percent, duration = dur })
                        time.setTimeout(dur + 0.5, function()
                            this.superposition("punish", "-=1")
                            this.punishCur(this.punish())
                        end)
                    end
                end
            elseif (resultNum < punish) then
                monitor.listen("monitor-punish_back", this)
            end
        end
    end)
    .exec("punishRegen",
    function(this, _)
        local punish = this.prop("punish")
        if (punish == nil or punish <= 0) then
            monitor.ignore("monitor-punish_back", this)
        elseif (this.isPunishing()) then
            monitor.ignore("monitor-punish_back", this)
        else
            monitor.listen("monitor-punish_back", this)
        end
    end)
    .exec("modelAlias",
    function(this, resultStr)
        if (this.prop("modelAlias") ~= resultStr) then
            japi.DzSetUnitID(this.__HANDLE__, c2i(slk.n2i(resultStr .. "|U")))
            PropChange(this, "modelAlias", "std", resultStr, false)
            PropReExec(this)
        end
    end)
    .exec("modelScale",
    function(this, resultNum)
        J.SetUnitScale(this.__HANDLE__, resultNum, resultNum, resultNum)
    end)
    .exec("animateScale",
    function(this, resultNum)
        J.SetUnitTimeScale(this.__HANDLE__, resultNum)
    end)
    .exec("turnSpeed",
    function(this, resultNum)
        J.SetUnitTurnSpeed(this.__HANDLE__, resultNum)
    end)
    .exec("rgba",
    function(this, result)
        local prev = this.prop("rgba")
        result[1] = prev[1]
        result[2] = prev[2]
        result[3] = prev[3]
        result[4] = prev[4]
        J.SetUnitVertexColor(this.__HANDLE__, result[1], result[2], result[3], result[4])
    end)
    .exec("moveType",
    function(this, result)
        if (result == UNIT_MOVE_TYPE.foot) then
            japi.EXSetUnitMoveType(this.__HANDLE__, MOVE_TYPE_FOOT)
        elseif (result == UNIT_MOVE_TYPE.fly) then
            japi.EXSetUnitMoveType(this.__HANDLE__, MOVE_TYPE_FLY)
        elseif (result == UNIT_MOVE_TYPE.amphibious) then
            japi.EXSetUnitMoveType(this.__HANDLE__, MOVE_TYPE_AMPH)
        elseif (result == UNIT_MOVE_TYPE.float) then
            japi.EXSetUnitMoveType(this.__HANDLE__, MOVE_TYPE_FLOAT)
        end
    end)
    .exec("period",
    function(this, resultNum)
        if (isObject(this.prop("periodTimer"), "Timer")) then
            this.prop("periodTimer").destroy()
            this.prop("periodTimer", NIL)
        end
        if (resultNum > 0) then
            this.prop("periodTimer", time.setTimeout(resultNum, function()
                this.prop("periodTimer", NIL)
                J.KillUnit(this.__HANDLE__)
            end))
        end
    end)
    .exec("flyHeight",
    function(this, resultNum)
        J.UnitAddAbility(this.__HANDLE__, SINGLUAR_ID["ability_fly"])
        J.UnitRemoveAbility(this.__HANDLE__, SINGLUAR_ID["ability_fly"])
        J.SetUnitFlyHeight(this.__HANDLE__, resultNum, 9999)
        if (resultNum > 0) then
            this.prop("moveType", UNIT_MOVE_TYPE.fly)
        else
            this.prop("moveType", UNIT_MOVE_TYPE.foot)
        end
    end)
    .exec("exp",
    function(this, resultNum)
        local prevLv = this.prop("level") or 0
        if (prevLv >= 1) then
            local lv = 0
            for i = Game().unitLevelMax(), 1, -1 do
                if (resultNum >= Game().unitExpNeeds(i)) then
                    lv = i
                    break
                end
            end
            if (lv ~= prevLv) then
                if (lv > prevLv) then
                    this.prop("level", lv)
                elseif (lv < prevLv) then
                    this.prop("level", lv)
                end
            end
        end
    end)
    .exec("level",
    function(this, resultNum)
        local prevLv = this.prop("level") or 0
        if (resultNum > 1 and resultNum > prevLv) then
            this.effect("AIemTarget", 0)
            PropChange(this, "exp", "std", Game().unitExpNeeds(resultNum), false)
        elseif (resultNum < prevLv) then
            this.effect("DispelMagicTarget", 0)
            PropChange(this, "exp", "std", Game().unitExpNeeds(resultNum), false)
        end
        event.trigger(this, EVENT.Unit.LevelChange, { triggerUnit = this, value = resultNum - prevLv })
    end)
    .exec("owner",
    function(this, result)
        J.SetUnitOwner(this.__HANDLE__, result.handle(), true)
    end)
    .exec("teamColor",
    function(this, resultNum)
        J.SetUnitColor(this.__HANDLE__, PLAYER_COLOR[resultNum])
    end)
    .exec("orderRoute",
    function(this, result)
        local prev = this.prop("orderRoute")
        if (false == datum.equal(prev, result)) then
            this.prop("orderRouteIdx", 1)
        end
        event.register(this, EVENT.Unit.MoveRoute, "SLOrderRoute", function(evtData)
            local u = evtData.triggerUnit
            local r = u.prop("orderRoute")
            local i = u.prop("orderRouteIdx")
            if (i > 0 and i <= #r) then
                local call = r[i][3]
                if (evtData.inc == true) then
                    i = i + 1
                end
                if (i > #r and u.prop("orderRouteLoop")) then
                    i = 1
                end
                u.prop("orderRouteIdx", i)
                if (evtData.inc == true and type(call) == "function") then
                    u.orderRoutePause()
                    call(u)
                else
                    if (i > 0 and i <= #r) then
                        u.orderMove(r[i][1], r[i][2])
                    else
                        u.orderRouteDestroy()
                    end
                end
            else
                u.orderRouteDestroy()
            end
        end)
        if (prev == nil) then
            PropChange(this, "orderRoute", "std", result, false)
        end
        this.orderRouteResume()
    end)
    .exec("<SUPERPOSITION>collision",
    function(this, resultNum)
        J.SetUnitPathing(this.__HANDLE__, resultNum > 0)
    end)
    .exec("<SUPERPOSITION>select",
    function(this, resultNum)
        if (resultNum > 0) then
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_locust"]) >= 1) then
                J.UnitRemoveAbility(this.__HANDLE__, SINGLUAR_ID["ability_locust"])
            end
        else
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_locust"]) < 1) then
                J.UnitAddAbility(this.__HANDLE__, SINGLUAR_ID["ability_locust"])
            end
        end
    end)
    .exec("<SUPERPOSITION>attack",
    function(this, resultNum)
        local isAttackAble = this.prop("isAttackAble")
        if (resultNum > 0 and isAttackAble == false) then
            this.prop("isAttackAble", true)
            japi.DzUnitDisableAttack(this.__HANDLE__, false)
        elseif (resultNum <= 0 and isAttackAble == true) then
            this.prop("isAttackAble", false)
            japi.DzUnitDisableAttack(this.__HANDLE__, true)
        end
    end)
    .exec("<SUPERPOSITION>invulnerable",
    function(this, resultNum)
        if (resultNum > 0) then
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_invulnerable"]) < 1) then
                J.UnitAddAbility(this.__HANDLE__, SINGLUAR_ID["ability_invulnerable"])
            end
        else
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_invulnerable"]) >= 1) then
                J.UnitRemoveAbility(this.__HANDLE__, SINGLUAR_ID["ability_invulnerable"])
            end
        end
    end)
    .exec("<SUPERPOSITION>invisible",
    function(this, resultNum)
        if (resultNum > 0) then
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_invisible"]) < 1) then
                J.UnitAddAbility(this.__HANDLE__, SINGLUAR_ID["ability_invisible"])
            end
        else
            if (J.GetUnitAbilityLevel(this.__HANDLE__, SINGLUAR_ID["ability_invisible"]) >= 1) then
                J.UnitRemoveAbility(this.__HANDLE__, SINGLUAR_ID["ability_invisible"])
            end
        end
    end)
    .exec("<SUPERPOSITION>pause",
    function(this, resultNum)
        J.PauseUnit(this.__HANDLE__, resultNum > 0)
    end)
    .exec("<SUPERPOSITION>show",
    function(this, resultNum)
        J.ShowUnit(this.__HANDLE__, resultNum > 0)
    end)
---@param this Ability
Class("Ability")

    .public("onEvent",
    function(this, evt, ...)
        event.register(this, evt, ...)
        return this
    end)

    .public("onUnitEvent",
    function(this, evt, ...)
        local opt = { ... }
        local key
        local callFunc
        if (type(opt[1]) == "function") then
            key = this.id() .. evt
            callFunc = opt[1]
        elseif (type(opt[1]) == "string" and type(opt[2]) == "function") then
            key = this.id() .. opt[1]
            callFunc = opt[2]
        end
        if (key ~= nil) then
            local eKey = "aoue#" .. key
            if (callFunc == nil) then
                event.unregister(this, EVENT.Ability.Get, eKey)
                event.unregister(this, EVENT.Ability.Lose, eKey)
            else
                ---@param getData noteOnAbilityGetData
                this.onEvent(EVENT.Ability.Get, eKey, function(getData)
                    event.register(getData.triggerUnit, evt, eKey, function(callData)
                        callData.triggerAbility = getData.triggerAbility
                        callFunc(callData)
                    end)
                end)
                ---@param loseData noteOnAbilityLoseData
                this.onEvent(EVENT.Ability.Lose, eKey, function(loseData)
                    event.register(loseData.triggerUnit, evt, eKey)
                end)
            end
        end
        return this
    end)

    .public("abilitySlotIndex",
    function(this, modify)
        return this.prop("abilitySlotIndex", modify)
    end)

    .public("hotkey",
    function(this)
        return this.prop("hotkey")
    end)

    .public("bindUnit",
    function(this, modify)
        return this.prop("bindUnit", modify)
    end)

    .public("bindItem",
    function(this, modify)
        return this.prop("bindItem", modify)
    end)

    .public("coolDownTimer",
    function(this)
        return this.prop("coolDownTimer")
    end)

    .public("coolDownRemain",
    function(this)
        if (isObject(this.prop("coolDownTimer"), "Timer")) then
            return this.prop("coolDownTimer").remain()
        end
        return 0
    end)

    .public("prohibitReason",
    function(this)
        local reason
        if (this.prop("prohibitor").get("preCast") == true) then
            reason = "吟唱中"
        end
        if (this.prop("prohibitor").get("keepCast") == true) then
            reason = "施法中"
        end
        if (this.prop("prohibitor").get("coolDown") == true) then
            reason = "冷却中"
        end
        if (this.prop("prohibitor").get("MP") == true) then
            reason = "MP不足"
        end
        if (this.prop("prohibitor").get("HP") == true) then
            reason = "HP不足"
        end
        if (this.prop("prohibitor").get("worth") == true) then
            reason = "财物不足"
        end
        if (this.prop("prohibitor").get("stun") == true) then
            reason = "被眩晕"
        end
        if (this.prop("prohibitor").get("silent") == true) then
            reason = "被沉默"
        end
        return reason
    end)

    .public("ban",
    function(this, reason)
        this.prop("prohibitor").set(reason, true)
        return this
    end)

    .public("allow",
    function(this, reason)
        this.prop("prohibitor").set(reason, nil)
        return this
    end)

    .public("exp",
    function(this, modify)
        if (modify ~= nil) then
            if (this.level() > 1 and this.prop("exp") <= 0) then
                -- 技能等级提前提升过，则补回之前的升级经验，当作是早已获取
                this.prop("exp", Game().abilityExpNeeds(this.level()))
            end
        end
        return this.prop("exp", modify)
    end)

    .public("expNeed",
    function(this, whichLevel)
        whichLevel = whichLevel or (1 + this.level())
        whichLevel = math.max(1, whichLevel)
        whichLevel = math.min(Game().abilityLevelMax(), whichLevel)
        return Game().abilityExpNeeds(math.floor(whichLevel))
    end)

    .public("coolingInstant",
    function(this)
        ---@type Timer
        local t = this.prop("coolDownTimer")
        if (isObject(t, "Timer") and t.remain() > 0.01) then
            t.remain(0.01)
        end
    end)

    .public("isCooling",
    function(this)
        return this.prop("prohibitor").get("coolDown") == true
    end)

    .public("isProhibiting",
    function(this)
        local bu = this.bindUnit()
        local count = this.prop("prohibitor").count()
        if (isObject(bu, "Unit")) then
            if (bu.isStunning()) then
                this.ban("stun")
            else
                this.allow("stun")
            end
            if (bu.isCrackFlying()) then
                this.ban("crackFly")
            else
                this.allow("crackFly")
            end
            if (bu.isLeaping()) then
                this.ban("leap")
            else
                this.allow("leap")
            end
            if (bu.isWhirlwind()) then
                this.ban("whirlwind")
            else
                this.allow("whirlwind")
            end
            if (bu.isSilencing()) then
                this.ban("silent")
            else
                this.allow("silent")
            end
            if (this.hpCost() > 0 and this.hpCost() > bu.hpCur()) then
                this.ban("HP")
            else
                this.allow("HP")
            end
            if (this.mpCost() > 0 and this.mpCost() > bu.mpCur()) then
                this.ban("MP")
            else
                this.allow("MP")
            end
            local w = this.worthCost()
            if (w ~= nil and Game().worthGreater(w, bu.owner().worth())) then
                this.ban("worth")
            else
                this.allow("worth")
            end
        elseif (count > 0) then
            this.prop("prohibitor", Array())
            count = 0
        end
        local status = count > 0
        this.prop("prohibiting", status)
        return status
    end)

    .public("isCastTarget",
    function(this, targetObj)
        local tt = this.targetType()
        if (tt == ABILITY_TARGET_TYPE.TAG_U and isObject(targetObj, "Unit") == false) then
            return false
        end
        local cta = this.prop("castTargetFilter")
        if (cta == nil or type(cta) ~= "function") then
            return false
        end
        return cta(this, targetObj)
    end)

    .public("effective",
    function(this, evtData)
        local triggerUnit = this.bindUnit()
        if (isObject(triggerUnit, "Unit") == false) then
            return
        end
        if (this.targetType() == ABILITY_TARGET_TYPE.TAG_U and isObject(evtData.targetUnit, "Unit")) then
            if (this.isCastTarget(evtData.targetUnit) == false) then
                return
            end
        end
        async.call(triggerUnit.owner(), function()
            Cursor().abilityStop()
        end)
        if (this.isProhibiting() == true or triggerUnit.isInterrupt() or triggerUnit.isPause()) then
            return
        end
        evtData = evtData or {}
        evtData.triggerAbility = this
        evtData.triggerUnit = triggerUnit
        if (evtData.targetX == nil or evtData.targetY == nil or evtData.targetZ == nil) then
            if (isObject(evtData.targetUnit, "Unit")) then
                evtData.targetX = evtData.targetUnit.x()
                evtData.targetY = evtData.targetUnit.y()
                evtData.targetZ = evtData.targetUnit.z()
            end
        end
        --- 距离判断
        local castDistance = this.castDistance()
        local distTarget
        if (isObject(evtData.targetUnit, "Unit")) then
            distTarget = evtData.targetUnit
        elseif (evtData.targetX and evtData.targetY) then
            distTarget = { evtData.targetX, evtData.targetY }
        else
            distTarget = triggerUnit
        end
        triggerUnit.distanceAction(distTarget, castDistance, function()
            local hpCast = this.hpCost()
            local mpCast = this.mpCost()
            local worthCost = this.worthCost()
            if (hpCast > 0 and triggerUnit.hpCur() <= hpCast) then
                return
            end
            if (mpCast > 0 and triggerUnit.mpCur() < mpCast) then
                return
            end
            if (worthCost ~= nil and Game().worthLess(triggerUnit.owner().worth(), worthCost)) then
                return
            end
            if (this.targetType() == ABILITY_TARGET_TYPE.TAG_C) then
                evtData.targetUnits = group.catch({
                    key = "Unit",
                    x = evtData.targetX,
                    y = evtData.targetY,
                    radius = this.castRadius(),
                    func = function(enumUnit)
                        return this.isCastTarget(enumUnit)
                    end
                })
            elseif (this.targetType() == ABILITY_TARGET_TYPE.TAG_S) then
                evtData.targetUnits = group.catch({
                    key = "Unit",
                    x = evtData.targetX,
                    y = evtData.targetY,
                    width = this.castWidth(),
                    height = this.castHeight(),
                    func = function(enumUnit)
                        return this.isCastTarget(enumUnit)
                    end
                })
            end
            --- 预执行
            if (hpCast > 0) then
                triggerUnit.hpCur("-=" .. hpCast)
            end
            if (mpCast > 0) then
                triggerUnit.mpCur("-=" .. mpCast)
            end
            if (worthCost ~= nil) then
                triggerUnit.owner().worth("-", worthCost)
            end
            --- 有目标坐标时，改一下面向角度
            if (evtData.targetX and evtData.targetY) then
                evtData.triggerUnit.facing(math.angle(evtData.triggerUnit.x(), evtData.triggerUnit.y(), evtData.targetX, evtData.targetY))
            end
            local otherData = {
                triggerAbility = this,
                triggerUnit = triggerUnit,
            }
            --- 触发使用物品
            local bIt = this.bindItem()
            if (isObject(bIt, "Item")) then
                evtData.triggerItem = bIt
                event.trigger(bIt, EVENT.Item.Used, evtData)
                event.trigger(triggerUnit, EVENT.Item.Used, evtData)
            end
            --- 触发技能开始施放（但未生效）
            event.trigger(this, EVENT.Ability.Spell, evtData)
            event.trigger(triggerUnit, EVENT.Ability.Spell, evtData)
            local spell = function()
                event.trigger(this, EVENT.Ability.Effective, evtData) --触发技能被施放
                event.trigger(triggerUnit, EVENT.Ability.Effective, evtData) --触发单位施放了技能
            end
            local stop = function()
                event.trigger(this, EVENT.Ability.Stop, otherData) --触发技能被停止
                event.trigger(triggerUnit, EVENT.Ability.Stop, otherData) --触发单位停止施放技能
            end
            local over = function()
                event.trigger(this, EVENT.Ability.Over, otherData) --触发持续技能结束
                event.trigger(triggerUnit, EVENT.Ability.Over, otherData) --触发单位持续技能结束
            end
            local cd = function()
                local coolDown = this.coolDown()
                if (coolDown > 0) then
                    local coolDownTimer = this.prop("coolDownTimer")
                    if (isObject(coolDownTimer, "Timer")) then
                        coolDownTimer.destroy()
                        this.prop("coolDownTimer", NIL)
                    end
                    this.ban("coolDown")
                    this.prop("coolDownTimer", time.setTimeout(coolDown, function(curTimer)
                        curTimer.destroy()
                        this.prop("coolDownTimer", NIL)
                        this.allow("coolDown")
                    end))
                end
            end
            -- preCast
            local preCast = this.castChant()
            if (preCast > 0) then
                this.ban("preCast")
                triggerUnit.superposition("pause", "+=1")
                if (this.castAnimation()) then
                    time.setTimeout(0, function()
                        triggerUnit.animate(this.castAnimation())
                    end)
                end
                local animateScale = triggerUnit.animateScale()
                triggerUnit.animateScale(1 / preCast)
                triggerUnit.prop("abilitySpellReset", function(status)
                    triggerUnit.prop("abilitySpellReset", NIL)
                    local t = triggerUnit.prop("abilityChantCastTimer")
                    t.destroy()
                    triggerUnit.prop("abilityChantCastTimer", NIL)
                    this.allow("preCast")
                    triggerUnit.animateScale(animateScale)
                    triggerUnit.superposition("pause", "-=1")
                    if (status == false) then
                        stop()
                    end
                end)
                local ti = 0
                local period = 0.05
                triggerUnit.prop("abilityChantCastTimerInc", ti)
                triggerUnit.prop("abilityChantCastTimerStatic", preCast / period)
                triggerUnit.prop("abilityChantCastTimer", time.setInterval(period, function(spellTimer)
                    ti = ti + 1
                    triggerUnit.prop("abilityChantCastTimerInc", ti)
                    if (triggerUnit.isInterrupt()) then
                        spellTimer.destroy()
                        local r1 = triggerUnit.prop("abilitySpellReset")
                        if (type(r1) == "function") then
                            r1(false)
                        end
                    elseif (ti >= triggerUnit.prop("abilityChantCastTimerStatic")) then
                        spellTimer.destroy()
                        local r1 = triggerUnit.prop("abilitySpellReset")
                        if (type(r1) == "function") then
                            r1(true)
                        end
                        spell()
                        -- keepCast
                        local keepCast = this.castKeep()
                        if (keepCast > 0) then
                            this.ban("keepCast")
                            triggerUnit.superposition("pause", "+=1")
                            triggerUnit.prop("abilitySpellReset", function(status)
                                triggerUnit.prop("abilitySpellReset", NIL)
                                local t = triggerUnit.prop("abilityKeepCastTimer")
                                t.destroy()
                                this.allow("keepCast")
                                triggerUnit.prop("abilityKeepCastTimer", NIL)
                                triggerUnit.superposition("pause", "-=1")
                                if (status == false) then
                                    stop()
                                end
                            end)
                            ti = 0
                            triggerUnit.prop("abilityKeepCastTimerInc", ti)
                            triggerUnit.prop("abilityKeepCastTimerStatic", keepCast / period)
                            triggerUnit.prop("abilityKeepCastTimer", time.setInterval(period, function(keepTimer)
                                ti = ti + 1
                                triggerUnit.prop("abilityKeepCastTimerInc", ti)
                                if (triggerUnit.isInterrupt()) then
                                    keepTimer.destroy()
                                    local r2 = triggerUnit.prop("abilitySpellReset")
                                    if (type(r2) == "function") then
                                        r2(false)
                                    end
                                elseif (ti >= triggerUnit.prop("abilityKeepCastTimerStatic")) then
                                    keepTimer.destroy()
                                    local r2 = triggerUnit.prop("abilitySpellReset")
                                    if (type(r2) == "function") then
                                        r2(true)
                                        over()
                                    end
                                else
                                    if (this.keepAnimation() and ti % 20 == 0) then
                                        triggerUnit.animate(this.keepAnimation())
                                    end
                                end
                            end))
                        end
                    end
                end))
                cd()
            else
                spell()
                cd()
            end
        end)
    end)
---@param this Game
Class("Game")

    .public("onEvent",
    function(this, evt, ...)
        event.register(this, evt, ...)
        return this
    end)

    .public("name",
    function(this, modify)
        return this.prop("name", modify)
    end)

    .public("playingQuantityStart",
    function(this)
        return this.prop("playingQuantityStart")
    end)

    .public("playingQuantity",
    function(this, modify)
        return this.prop("playingQuantity", modify)
    end)

    .public("defineDescription",
    function(this, key, descSetting)
        if (type(descSetting) == "function") then
            ---@type Array
            local desc = this.prop("description")
            desc.set(key, descSetting)
        end
        return this
    end)

    .public("combineDescription",
    function(this, obj, options, ...)
        local joiner = {}
        ---@type Array
        local desc = this.prop("description")
        options = options or {}
        local _join
        _join = function(ts)
            if (type(ts) == "string") then
                if (string.subPos(ts, "|n") == false) then
                    table.insert(joiner, ts)
                else
                    _join(string.explode("|n", ts))
                end
            elseif (type(ts) == "table") then
                for _, v in ipairs(ts) do
                    _join(v)
                end
            end
        end
        for _, data in ipairs({ ... }) do
            if (type(data) == "string" and data == "<D>" and type(obj.description) == "function") then
                _join(obj.description())
            elseif (type(data) == "string" and desc.keyExists(data)) then
                _join(desc.get(data)(obj, options))
            else
                _join(data)
            end
        end
        return joiner
    end)

    .public("fog",
    function(this, enableFog)
        J.FogEnable(enableFog)
        return this
    end)

    .public("mark",
    function(this, enableMark)
        J.FogMaskEnable(enableMark)
        return this
    end)

    .public("findPosition",
    function(this, x, y)
        local nx = 0
        local ny = 0
        local d = 32
        if (x ~= nil and y ~= nil) then
            x = d * math.round(x / d)
            y = d * math.round(y / d)
            nx = x
            ny = y
            local pd = this.prop("findPosition")
            local ik = x .. '_' .. y
            local bic = 0
            local bor = 1
            local bi = 0
            while (pd[ik] == 1) do
                if (bi == 0) then
                    bic = bic + 1
                    bor = bor + 2
                    nx = x + d * bic
                    ny = y + d * bic
                elseif (bi < bor * 1 - 0) then
                    ny = ny - d
                elseif (bi < bor * 2 - 1) then
                    nx = nx - d
                elseif (bi < bor * 3 - 2) then
                    ny = ny + d
                else
                    nx = nx + d
                end
                bi = bi + 1
                if (bi >= (bor - 1) * 4) then
                    bi = 0
                end
                ik = nx .. '_' .. ny
            end
            pd[ik] = 1
        end
        return nx, ny
    end)

    .public("freePosition",
    function(this, x, y)
        if (x ~= nil and y ~= nil) then
            local pd = this.prop("findPosition")
            x = math.round(x)
            y = math.round(y)
            local ik = x .. '_' .. y
            pd[ik] = nil
        end
    end)

    .public("abilityHotkey",
    function(this, param)
        if (type(param) == "table") then
            local prev = this.prop("abilityHotkey")
            if (type(prev) == "table") then
                for _, k in ipairs(prev) do
                    keyboard.onRelease(KEYBOARD[k], "abilityHotkey", nil)
                end
            end
            for idx, key in ipairs(param) do
                keyboard.onRelease(KEYBOARD[key], "abilityHotkey", function(evtData)
                    local selection = evtData.triggerPlayer.selection()
                    if (isObject(selection, "Unit") == false) then
                        return
                    end
                    Cursor().abilityQuote(selection.abilitySlot().storage()[idx])
                end)
            end
            return this.prop("abilityHotkey", param)
        end
        if (type(param) == "number") then
            return this.prop("abilityHotkey")[param] or ''
        else
            return this.prop("abilityHotkey")
        end
    end)

    .public("abilityUpgrade",
    function(this, max, fixed, ratio, limit)
        local isModify = max or fixed or ratio or limit
        if (max) then
            this.prop("abilityLevelMax", max)
        end
        if (fixed) then
            this.prop("abilityExpFixed", fixed)
        end
        if (ratio) then
            this.prop("abilityExpRatio", ratio)
        end
        if (limit) then
            this.prop("abilityExpLimit", limit)
        end
        local _max = this.prop("abilityLevelMax") or 1
        local _fixed = this.prop("abilityExpFixed") or 100
        local _radio = this.prop("abilityExpRatio") or 1.00
        local _limit = this.prop("abilityExpLimit") or 10000
        if (isModify) then
            this.prop("abilityExpNeeds", math.expNeeds(_max, _fixed, _radio, _limit))
            return this
        end
        return _max, _fixed, _radio, _limit
    end)

    .public("abilityLevelMax",
    function(this)
        return this.prop("abilityLevelMax")
    end)

    .public("abilityExpNeeds",
    function(this, whichLevel)
        local ns = this.prop("abilityExpNeeds")
        must(type(ns) == "table")
        if (type(whichLevel) == "number") then
            return ns[whichLevel] or 0
        else
            return ns
        end
    end)

    .public("itemHotkey",
    function(this, param)
        if (type(param) == "table") then
            local prev = this.prop("abilityHotkey")
            if (type(prev) == "table") then
                for _, k in ipairs(prev) do
                    keyboard.onRelease(KEYBOARD[k], "itemHotkey", nil)
                end
            end
            for idx, key in ipairs(param) do
                keyboard.onRelease(KEYBOARD[key], "itemHotkey", function(evtData)
                    local selection = evtData.triggerPlayer.selection()
                    if (isObject(selection, "Unit") == false) then
                        return
                    end
                    Cursor().itemQuote(selection.itemSlot().storage()[idx])
                end)
            end
            return this.prop("itemHotkey", param)
        end
        if (type(param) == "number") then
            return this.prop("itemHotkey")[param] or ''
        else
            return this.prop("itemHotkey")
        end
    end)

    .public("itemUpgrade",
    function(this, max, fixed, ratio, limit)
        local isModify = max or fixed or ratio or limit
        if (max)
        then this.prop("itemLevelMax", max)
        end
        if (fixed)
        then this.prop("itemExpFixed", fixed)
        end
        if (ratio)
        then this.prop("itemExpRatio", ratio)
        end
        if (limit)
        then this.prop("itemExpLimit", limit)
        end
        local _max = this.prop("itemLevelMax") or 1
        local _fixed = this.prop("itemExpFixed") or 100
        local _radio = this.prop("itemExpRatio") or 1.00
        local _limit = this.prop("itemExpLimit") or 10000
        if (isModify) then
            this.prop("itemExpNeeds", math.expNeeds(_max, _fixed, _radio, _limit))
            return this
        end
        return _max, _fixed, _radio, _limit
    end)

    .public("itemLevelMax",
    function(this)
        return this.prop("itemLevelMax")
    end)

    .public("itemExpNeeds",
    function(this, whichLevel)
        local ns = this.prop("itemExpNeeds")
        must(type(ns) == "table")
        if (type(whichLevel) == "number") then
            return ns[whichLevel] or 0
        else
            return ns
        end
    end)

    .public("unitUpgrade",
    function(this, max, fixed, ratio, limit)
        local isModify = max or fixed or ratio or limit
        if (max) then
            this.prop("unitLevelMax", max)
        end
        if (fixed) then
            this.prop("unitExpFixed", fixed)
        end
        if (ratio) then
            this.prop("unitExpRatio", ratio)
        end
        if (limit) then
            this.prop("unitExpLimit", limit)
        end
        local _max = this.prop("unitLevelMax") or 1
        local _fixed = this.prop("unitExpFixed") or 100
        local _radio = this.prop("unitExpRatio") or 1.00
        local _limit = this.prop("unitExpLimit") or 10000
        if (isModify) then
            this.prop("unitExpNeeds", math.expNeeds(_max, _fixed, _radio, _limit))
            return this
        end
        return _max, _fixed, _radio, _limit
    end)

    .public("unitLevelMax",
    function(this)
        return this.prop("unitLevelMax")
    end)

    .public("unitExpNeeds",
    function(this, whichLevel)
        local ns = this.prop("unitExpNeeds")
        must(type(ns) == "table")
        if (type(whichLevel) == "number") then
            return ns[whichLevel] or 0
        else
            return ns
        end
    end)

    .public("warehouseSlot",
    function(this, max)
        local isModify = max
        if (max) then this.prop("warehouseSlotMax", max) end
        if (isModify) then
            return this
        end
        return this.prop("warehouseSlotMax")
    end)

    .public("unCommand",
    function(this, pattern)
        if (type(pattern) == "string") then
            for i = 1, BJ_MAX_PLAYERS, 1 do
                Player(i).onChat(pattern, nil)
            end
        end
        return this
    end)

    .public("command",
    function(this, pattern, callFunc)
        if (type(pattern) == "string") then
            for i = 1, BJ_MAX_PLAYERS, 1 do
                Player(i).onChat(pattern, callFunc)
            end
        end
        return this
    end)

    .public("worth",
    function(this, key, name, convert)
        ---@type Array
        local wor = this.prop("worth")
        if (key ~= nil and name ~= nil) then
            wor.set(key, { name = name, convert = convert })
            this.prop("worthConvert", NIL)
            return this
        end
        if (key == nil) then
            return wor
        end
        return wor.get(key)
    end)

    .public("worthConvert",
    function(this, key)
        local cov = this.prop("worthConvert")
        if (cov == nil) then
            local wor = this.prop("worth")
            cov = Array()
            this.prop("worthConvert", cov)
            wor.forEach(function(k, v)
                if (v.convert ~= nil) then
                    cov.set(v.convert[1], { k, v.convert[2] })
                end
            end)
        end
        if (key == nil) then
            return cov
        end
        return cov.get(key)
    end)

    .public("worthU2L",
    function(this, data)
        local turn = {}
        if (type(data) == "table") then
            ---@type Array
            local cvt = this.worthConvert()
            local rev = {}
            local keys = cvt.keys()
            this.worth().forEach(function(key, _)
                local value = cvt.get(key)
                if (value) then
                    rev[value[1]] = { key, value[2] }
                    turn[key] = data[key] or 0
                else
                    turn[key] = data[key]
                end
            end)
            local run = true
            while (run) do
                local count = 0
                for _, k in ipairs(keys) do
                    if (rev[k] ~= nil) then
                        if (turn[rev[k][1]] == nil) then
                            turn[rev[k][1]] = 0
                        end
                        if (turn[k] ~= 0) then
                            turn[rev[k][1]] = turn[rev[k][1]] + turn[k] * rev[k][2]
                            turn[k] = 0
                            count = count + 1
                        end
                    end
                end
                run = (count > 0)
            end
        end
        return turn
    end)

    .public("worthL2U",
    function(this, data)
        local turn = {}
        if (type(data) == "table") then
            ---@type Array
            local cvt = this.worthConvert()
            local rev = {}
            local keys = cvt.keys()
            this.worth().forEach(function(key, _)
                local value = cvt.get(key)
                if (value) then
                    rev[key] = { value[1], value[2] }
                    turn[key] = data[key] or 0
                else
                    turn[key] = data[key]
                end
            end)
            local run = true
            while (run) do
                local count = 0
                for _, k in ipairs(keys) do
                    if (rev[k] ~= nil) then
                        local exceed, remain = math.modf(turn[k] / rev[k][2])
                        if (exceed ~= 0) then
                            if (turn[rev[k][1]] == nil) then
                                turn[rev[k][1]] = 0
                            end
                            turn[rev[k][1]] = turn[rev[k][1]] + exceed
                            count = count + 1
                        end
                        turn[k] = remain * rev[k][2]
                    end
                end
                run = (count > 0)
            end
        end
        return turn
    end)

    .public("worthCale",
    function(this, data1, operator, data2)
        local keys = this.worth().keys()
        local res
        if (operator == "*" or operator == "/") then
            local ratio = 0
            if (type(data1) == "table" or type(data2) == "number") then
                res = this.worthU2L(data1)
                ratio = data2
            end
            if (type(data1) == "number" or type(data2) == "table") then
                res = this.worthU2L(data2)
                ratio = data1
            end
            for _, k in ipairs(keys) do
                if (type(res[k]) == "number") then
                    if (operator == "*") then
                        res[k] = res[k] * ratio
                    elseif (operator == "/") then
                        res[k] = res[k] / ratio
                    end
                end
            end
        elseif (operator == "+" or operator == "-") then
            if (type(data1) == "table" and type(data2) == "table") then
                res = this.worthU2L(data1)
                data2 = this.worthU2L(data2)
                for _, k in ipairs(keys) do
                    res[k] = res[k] or 0
                    if (type(data2[k]) == "number") then
                        if (operator == "+") then
                            res[k] = res[k] + data2[k]
                        elseif (operator == "-") then
                            res[k] = res[k] - data2[k]
                        end
                    end
                end
            end
        end
        if (res == nil) then
            stack("wrong cale")
            return data1
        end
        return this.worthL2U(res)
    end)

    .public("worthFloor",
    function(this, data)
        data = this.worthU2L(data)
        for _, k in ipairs(this.worth().keys()) do
            if (type(data[k]) == "number") then
                data[k] = math.floor(data[k])
            end
        end
        return this.worthL2U(data)
    end)

    .public("worthCeil",
    function(this, data)
        data = this.worthU2L(data)
        for _, k in ipairs(this.worth().keys()) do
            if (type(data[k]) == "number") then
                data[k] = math.ceil(data[k])
            end
        end
        return this.worthL2U(data)
    end)

    .public("worthRound",
    function(this, data)
        data = this.worthU2L(data)
        for _, k in ipairs(this.worth().keys()) do
            if (type(data[k]) == "number") then
                data[k] = math.round(data[k])
            end
        end
        return this.worthL2U(data)
    end)

    .public("worthCompare",
    function(this, data1, data2)
        if (data1 == nil or data2 == nil) then
            return nil
        end
        local lower1 = this.worthU2L(data1)
        local lower2 = this.worthU2L(data2)
        local keys = this.prop("worth").keys()
        local result = { g = 0, l = 0 }
        for _, k in ipairs(keys) do
            local d1 = lower1[k] or 0
            local d2 = lower2[k] or 0
            if (d1 > d2) then
                result.g = result.g + 1
            elseif (d1 < d2) then
                result.l = result.l + 1
            end
        end
        if (result.g == 0 and result.l == 0) then
            return 0
        end
        if (result.g > 0 and result.l > 0) then
            return nil
        end
        if (result.g > 0) then
            return true
        end
        if (result.l > 0) then
            return false
        end
    end)

    .public("worthEqual",
    function(this, data1, data2)
        return this.worthCompare(data1, data2) == 0
    end)

    .public("worthGreater",
    function(this, data1, data2)
        return this.worthCompare(data1, data2) == true
    end)

    .public("worthLess",
    function(this, data1, data2)
        return this.worthCompare(data1, data2) == false
    end)

    .public("worthEqualOrGreater",
    function(this, data1, data2)
        local res = this.worthCompare(data1, data2)
        return res == true or res == 0
    end)

    .public("worthEqualOrLess",
    function(this, data1, data2)
        local res = this.worthCompare(data1, data2)
        return res == false or res == 0
    end)           ---@type table<string,any>
SL_CACHE = SL_CACHE or {
    ["tips"] = {},
    ["Roulette"] = nil,
    ["IsWideScreen"] = false,
    ["FrameTagIndex"] = 0,
    ["DzLoadToc"] = {},
    ["Z"] = {},
    ["FrameBlackTop"] = 0.020,
    ["FrameBlackBottom"] = 0.130,
    ["FrameInnerHeight"] = 0.45,
    ["Refresh"] = nil,
}
SL_ENGINE = SL_ENGINE or {}

local function msg_(msg)
    if (SL_CACHE["tips"][msg] == nil) then
        SL_CACHE["tips"][msg] = 1
        if (DEBUGGING) then
            print("JAPI " .. msg)
        else
            echo("JAPI " .. msg)
        end
    end
end

--- 此方法自带延迟策略，以减少执行压力
--- 只适用于无返回执行
--- 轮盘队列
---@param action fun(action:fun():void
---@return void
local function roulette_(action)
    if (type(action) ~= "function") then
        return
    end
    if (type(SL_CACHE["Roulette"]) == "table") then
        table.insert(SL_CACHE["Roulette"], action)
        return
    end
    SL_CACHE["Roulette"] = {}
    table.insert(SL_CACHE["Roulette"], action)
    time.setInterval(1.5, function(curTimer)
        if (#SL_CACHE["Roulette"] <= 0) then
            curTimer.destroy()
            SL_CACHE["Roulette"] = nil
            return
        end
        SL_CACHE["Roulette"][1]()
        table.remove(SL_CACHE["Roulette"], 1)
    end)
end

---@param method string
---@vararg any
---@return any
J.ExecJAPI = function(method, ...)
    if (type(method) ~= "string") then
        return false
    end
    local m = string.sub(method, string.len(method))
    if ("_" == m) then
        return SL_ENGINE[method](...)
    else
        if (JassJapi == nil) then
            return false
        end
        if (type(JassJapi[method]) ~= "function") then
            msg_(method .. "_FUNCTION_NOT_EXIST")
            return false
        end
        return JassJapi[method](...)
    end
end

SL_ENGINE["DzFrameEditBlackBorders_"] = function(topHeight, bottomHeight)
    SL_CACHE["FrameBlackTop"] = topHeight
    SL_CACHE["FrameBlackBottom"] = bottomHeight
    SL_CACHE["FrameInnerHeight"] = 0.6 - topHeight - bottomHeight
    return J.ExecJAPI("DzFrameEditBlackBorders", topHeight, bottomHeight)
end

SL_ENGINE["DzEnableWideScreen_"] = function(enable)
    SL_CACHE["IsWideScreen"] = enable
    return J.ExecJAPI("DzEnableWideScreen", enable)
end

SL_ENGINE["DzLoadToc_"] = function(tocFilePath)
    if (SL_CACHE["DzLoadToc"][tocFilePath] == true) then
        return true
    end
    SL_CACHE["DzLoadToc"][tocFilePath] = true
    return J.ExecJAPI("DzLoadToc", tocFilePath)
end

SL_ENGINE["EXGetUnitAbility_"] = function(whichUnit, abilityID)
    if (type(abilityID) == "string") then
        abilityID = c2i(abilityID)
    end
    return J.ExecJAPI("EXGetUnitAbility", whichUnit, abilityID)
end

SL_ENGINE["SetUnitState_"] = function(whichUnit, state, value)
    J.ExecJAPI("SetUnitState", whichUnit, state, value)
    if (whichUnit ~= nil and state == UNIT_STATE_ATTACK_WHITE or state == UNIT_STATE_DEFEND_WHITE) then
        J.UnitAddAbility(whichUnit, SINGLUAR_ID["japi_delay"])
        J.UnitRemoveAbility(whichUnit, SINGLUAR_ID["japi_delay"])
    end
end

SL_ENGINE["ServerAlready_"] = function(whichPlayer)
    local res = japi.DzAPI_Map_GetServerValueErrorCode(whichPlayer)
    if (type(res) == "number") then
        return math.floor(res) == 0
    end
    return false
end

SL_ENGINE["ServerSaveValue_"] = function(whichPlayer, key, value)
    if (string.len(key) > 63) then
        japi._msg("63_KEY_TOO_LONG")
        return
    end
    roulette_(function()
        if (SL_ENGINE.ServerAlready_(whichPlayer)) then
            if (type(value) == "boolean") then
                if (value == true) then
                    value = "B:1"
                else
                    value = "B:0"
                end
            elseif (type(value) == "number") then
                value = "N:" .. tostring(value)
            elseif (type(value) ~= "string") then
                value = ""
            end
            if (string.len(value) > 63) then
                msg_("63_VALUE_TOO_LONG")
                return
            end
            japi.DzAPI_Map_SaveServerValue(whichPlayer, key, value)
        end
    end)
end

SL_ENGINE["ServerLoadValue_"] = function(whichPlayer, key)
    if (string.len(key) > 63) then
        japi._msg("63_KEY_TOO_LONG")
        return
    end
    if (SL_ENGINE.ServerAlready_(whichPlayer)) then
        local result = japi.DzAPI_Map_GetServerValue(whichPlayer, key)
        if (type(result) == "string") then
            local valType = string.sub(result, 1, 2)
            if (valType == "B:") then
                local v = string.sub(result, 3)
                return "1" == v
            elseif (valType == "N:") then
                local v = string.sub(result, 3)
                return tonumber(v or 0)
            end
            if (result == '') then
                return nil
            end
            return result
        end
    end
    return nil
end

SL_ENGINE["ServerSaveRoom_"] = function(whichPlayer, key, value)
    roulette_(function()
        if (SL_ENGINE.ServerAlready_(whichPlayer)) then
            key = string.upper(key)
            if (type(value) == "boolean") then
                if (value == true) then
                    value = "true"
                else
                    value = "false"
                end
            elseif (type(value) == "number") then
                value = math.numberFormat(value, 2)
            elseif (type(value) ~= "string") then
                value = ""
            end
            japi.DzAPI_Map_Stat_SetStat(whichPlayer, key, value)
        end
    end)
end

SL_ENGINE["GetFrameBorders_"] = function()
    return SL_CACHE["FrameBlackTop"], SL_CACHE["FrameBlackBottom"], SL_CACHE["FrameInnerHeight"]
end

SL_ENGINE["IsWideScreen_"] = function()
    return SL_CACHE["IsWideScreen"]
end

SL_ENGINE["IsEventPhysicalDamage_"] = function()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)
end

SL_ENGINE["IsEventAttackDamage_"] = function()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
end

SL_ENGINE["IsEventRangedDamage_"] = function()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)
end

SL_ENGINE["IsEventDamageType_"] = function(damageType)
    return damageType == J.ConvertDamageType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
end

SL_ENGINE["IsEventWeaponType_"] = function(weaponType)
    return weaponType == J.ConvertWeaponType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE))
end

SL_ENGINE["IsEventAttackType_"] = function(attackType)
    return attackType == J.ConvertAttackType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
end

SL_ENGINE["FrameTagIndex_"] = function()
    SL_CACHE["FrameTagIndex"] = SL_CACHE["FrameTagIndex"] + 1
    return "Frame#" .. SL_CACHE["FrameTagIndex"]
end

SL_ENGINE["persp"] = function(fov, aspect, near, far, isFOV_Y, minClipZ, projectionSignY)
    local f = 1.0 / math.tan(fov / 2)
    local nf = 1 / (near - far)
    local x = isFOV_Y and f / aspect or f
    local y = (isFOV_Y and f or f * aspect) * projectionSignY
    local ptf = { 1, 0, 0, 1 }
    return {
        { x * ptf[1], x * ptf[2], 0, 0 },
        { y * ptf[3], y * ptf[4], 0, 0 },
        { 0, 0, (far - minClipZ * near) * nf, -1 },
        { 0, 0, far * near * nf * (1 - minClipZ), 0 },
    }
end

SL_ENGINE["lkat"] = function(eye, center, up)
    local eyeX = eye[1]
    local eyeY = eye[2]
    local eyeZ = eye[3]
    local upX = up[1]
    local upY = up[2]
    local upZ = up[3]
    local centerX = center[1]
    local centerY = center[2]
    local centerZ = center[3]
    local z0 = eyeX - centerX
    local z1 = eyeY - centerY
    local z2 = eyeZ - centerZ
    local len = 1 / math.sqrt(z0 * z0 + z1 * z1 + z2 * z2)
    z0 = z0 * len
    z1 = z1 * len
    z2 = z2 * len
    local x0 = upY * z2 - upZ * z1
    local x1 = upZ * z0 - upX * z2
    local x2 = upX * z1 - upY * z0
    len = 1 / math.sqrt(x0 * x0 + x1 * x1 + x2 * x2)
    x0 = x0 * len
    x1 = x1 * len
    x2 = x2 * len
    local y0 = z1 * x2 - z2 * x1
    local y1 = z2 * x0 - z0 * x2
    local y2 = z0 * x1 - z1 * x0
    return {
        { x0, y0, z0, 0 },
        { x1, y1, z1, 0 },
        { x2, y2, z2, 0 },
        { -(x0 * eyeX + x1 * eyeY + x2 * eyeZ), -(y0 * eyeX + y1 * eyeY + y2 * eyeZ), -(z0 * eyeX + z1 * eyeY + z2 * eyeZ), 1 },
    }
end

SL_ENGINE["xymzi"] = function(y, ox, oy, bottom, inner)
    if (math.abs(J.GetCameraField(CAMERA_FIELD_ROTATION) - 1.57) < 0.2) then
        local d = J.GetCameraTargetPositionY() - y
        if (bottom - 0.13 <= 0) then
            oy = oy + d / 10000 * (-32.038 * bottom ^ 2 - 6.684 * bottom + 1.5034)
        elseif (bottom < 0.15) then
            oy = oy + math.abs(d / 10000) * 0.2
        end
    end
    return (1 - ox) * 0.8, oy * inner + bottom
end

SL_ENGINE["DzConvertWorldPosition_"] = function(x, y, z)
    if (japi.IsWideScreen() == false) then
        return -1, -1
    end
    if (type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number") then
        return -1, -1
    end
    if (math.isNaN(x) or math.isNaN(y) or math.isNaN(z)) then
        return -1, -1
    end
    if (RectPlayable == nil or x < RectPlayable.xMin() or x > RectPlayable.xMax() or y < RectPlayable.yMin() or y > RectPlayable.yMax()) then
        return -1, -1
    end
    if (J.IsVisibleToPlayer(x, y, JassCommon["GetLocalPlayer"]()) == false) then
        return -1, -1
    end
    local clipSpaceSignY = 1
    local top, bottom, inner = SL_ENGINE["GetFrameBorders_"]()
    local xof = 0.6893 * bottom ^ 2 - 0.5841 * bottom + 0.846 - top * 0.4
    local v3 = { x, z, y }
    local fov = J.GetCameraField(CAMERA_FIELD_FIELD_OF_VIEW) / 2
    local far = J.GetCameraField(CAMERA_FIELD_TARGET_DISTANCE)
    local per = SL_ENGINE["persp"](fov, japi.DzGetClientWidth() / (japi.DzGetClientHeight() * xof), 1, far, true, -1, clipSpaceSignY)
    local eye = { J.GetCameraEyePositionX(), J.GetCameraEyePositionZ(), J.GetCameraEyePositionY() }
    local center = { J.GetCameraTargetPositionX(), J.GetCameraTargetPositionZ(), J.GetCameraTargetPositionY() }
    local up = { 0, 1, 0 }
    local at = SL_ENGINE["lkat"](eye, center, up)
    local multiMat = SL_ENGINE["mtix"](per, at)
    local ptf = { 1, 0, 0, 1 }
    local out = SL_ENGINE["tfm4"](v3, multiMat)
    local ox, oy, oz = out[1], out[2], out[3]
    ox = ox * ptf[1] + oy * ptf[3] * clipSpaceSignY
    oy = ox * ptf[2] + oy * ptf[4] * clipSpaceSignY
    ox = (1 + ox) / 2
    oy = (1 + oy) / 2
    oz = oz / 2 + 0.5
    local rx, ry = SL_ENGINE["xymzi"](y, ox, oy, bottom, inner)
    if (math.isNaN(rx) or math.isNaN(ry) or rx < 0 or rx > 0.8 or ry < bottom or ry > (0.6 - top)) then
        return -1, -1
    end
    return rx, ry
end

SL_ENGINE["mtix"] = function(p1, p2)
    local new = {}
    local m = 4
    local n = 4
    for i = 1, m do
        new[i] = {}
        for j = 1, n do
            local val = 0
            for k = 1, n do
                val = val + p2[i][k] * p1[k][j]
            end
            new[i][j] = val
        end
    end
    return new
end

SL_ENGINE["tfm4"] = function(v3, m)
    local x = v3[1]
    local y = v3[2]
    local z = v3[3]
    local rhw = m[1][4] * x + m[2][4] * y + m[3][4] * z + m[4][4]
    rhw = rhw and math.abs(1 / rhw) or 1
    return {
        (m[1][1] * x + m[2][1] * y + m[3][1] * z + m[4][1]) * rhw,
        (m[1][2] * x + m[2][2] * y + m[3][2] * z + m[4][2]) * rhw,
        (m[1][3] * x + m[2][3] * y + m[3][3] * z + m[4][3]) * rhw
    }
end

SL_ENGINE["DzAPI_Map_IsPlatformVIP_"] = function(whichPlayer)
    local res = japi.DzAPI_Map_GetPlatformVIP(whichPlayer)
    if (type(res) == "number") then
        return math.round(res) > 0
    end
    return false
end

SL_ENGINE["DzAPI_Map_Ladder_SubmitPlayerRank_"] = function(whichPlayer, value)
    return japi.DzAPI_Map_Ladder_SetPlayerStat(whichPlayer, "RankIndex", math.floor(value))
end

SL_ENGINE["DzAPI_Map_Ladder_SubmitTitle_"] = function(whichPlayer, value)
    return japi.DzAPI_Map_Ladder_SetStat(whichPlayer, value, "1")
end

SL_ENGINE["DzAPI_Map_Ladder_SubmitPlayerExtraExp_"] = function(whichPlayer, value)
    return japi.DzAPI_Map_Ladder_SetStat(whichPlayer, "ExtraExp", math.floor(value))
end

SL_ENGINE["DzTriggerRegisterMallItemSyncData_"] = function(trig)
    japi.DzTriggerRegisterSyncData(trig, "DZMIA", true)
end

SL_ENGINE["DzAPI_Map_Global_ChangeMsg_"] = function(trig)
    japi.DzTriggerRegisterSyncData(trig, "DZGAU", true)
end

SL_ENGINE["DzAPI_Map_IsRPGQuickMatch_"] = function()
    return japi.RequestExtraBooleanData(40, nil, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_GetMallItemCount_"] = function(whichPlayer, key)
    return japi.RequestExtraIntegerData(41, whichPlayer, key, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_ConsumeMallItem_"] = function(whichPlayer, key, value)
    return japi.RequestExtraBooleanData(42, whichPlayer, key, nil, false, value, 0, 0)
end

SL_ENGINE["DzAPI_Map_EnablePlatformSettings_"] = function(whichPlayer, option, enable)
    return japi.RequestExtraBooleanData(43, whichPlayer, nil, nil, enable, option, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsBuyReforged_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(44, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_PlayedGames_"] = function(whichPlayer)
    return japi.RequestExtraIntegerData(45, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_CommentCount_"] = function(whichPlayer)
    return japi.RequestExtraIntegerData(46, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_FriendCount_"] = function(whichPlayer)
    return japi.RequestExtraIntegerData(47, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsConnoisseur_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(48, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsBattleNetAccount_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(49, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsAuthor_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(50, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_CommentTotalCount_"] = function()
    return japi.RequestExtraIntegerData(51, nil, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_CustomRanking_"] = function(whichPlayer, id)
    return japi.RequestExtraIntegerData(52, whichPlayer, nil, nil, false, id, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsPlatformReturn_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(53, whichPlayer, nil, nil, false, 2, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsMapReturn_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(53, whichPlayer, nil, nil, false, 8, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsPlatformReturnUsed_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(53, whichPlayer, nil, nil, false, 4, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsMapReturnUsed_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(53, whichPlayer, nil, nil, false, 1, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsCollected_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(53, whichPlayer, nil, nil, false, 16, 0, 0)
end

SL_ENGINE["DzAPI_Map_ContinuousCount_"] = function(whichPlayer, id)
    return japi.RequestExtraIntegerData(54, whichPlayer, nil, nil, false, id, 0, 0)
end

SL_ENGINE["DzAPI_Map_IsPlayer_"] = function(whichPlayer)
    return japi.RequestExtraBooleanData(55, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsTotalPlayed_"] = function(whichPlayer)
    return japi.RequestExtraIntegerData(56, whichPlayer, nil, nil, false, 0, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsLevel_"] = function(whichPlayer, mapId)
    return japi.RequestExtraIntegerData(57, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsumeGold_"] = function(whichPlayer, mapId)
    return japi.RequestExtraIntegerData(58, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsumeLumber_"] = function(whichPlayer, mapId)
    return japi.RequestExtraIntegerData(59, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsume_1_199_"] = function(whichPlayer, mapId)
    return japi.RequestExtraBooleanData(60, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsume_200_499_"] = function(whichPlayer, mapId)
    return japi.RequestExtraBooleanData(61, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsume_500_999_"] = function(whichPlayer, mapId)
    return japi.RequestExtraBooleanData(62, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_MapsConsume_1000_"] = function(whichPlayer, mapId)
    return japi.RequestExtraBooleanData(63, whichPlayer, nil, nil, false, mapId, 0, 0)
end

SL_ENGINE["DzAPI_Map_GetForumData_"] = function(whichPlayer, data)
    return japi.RequestExtraIntegerData(65, whichPlayer, nil, nil, false, data, 0, 0)
end

SL_ENGINE["DzAPI_Map_OpenMall_"] = function(whichPlayer, key)
    return japi.RequestExtraIntegerData(66, whichPlayer, key, nil, false, 0, 0, 0)
end

SL_ENGINE["Z_"] = function(x, y)
    if (type(x) == "number" and type(y) == "number") then
        x = math.floor(x)
        y = math.floor(y)
        local k = x .. '_' .. y
        if (SL_CACHE["Z"][k] == nil) then
            local loc = J.Location(x, y)
            J.handleRef(loc)
            local z = J.GetLocationZ(loc)
            J.RemoveLocation(loc)
            J.handleUnRef(loc)
            SL_CACHE["Z"][k] = z
        end
        return SL_CACHE["Z"][k]
    end
    return 0
end

SL_ENGINE["PX_"] = function(x)
    return japi.DzGetClientWidth() * x / 0.8
end

SL_ENGINE["PY_"] = function(y)
    return japi.DzGetClientHeight() * y / 0.6
end

SL_ENGINE["RX_"] = function(x)
    return x / japi.DzGetClientWidth() * 0.8
end

SL_ENGINE["RY_"] = function(y)
    return y / japi.DzGetClientHeight() * 0.6
end

SL_ENGINE["MousePX_"] = function()
    return japi.DzGetMouseXRelative()
end

SL_ENGINE["MousePY_"] = function()
    return japi.DzGetClientHeight() - japi.DzGetMouseYRelative()
end

SL_ENGINE["MouseRX_"] = function()
    return japi.RX(japi.MousePX())
end

SL_ENGINE["MouseRY_"] = function()
    return japi.RY(japi.MousePY())
end

SL_ENGINE["InWindow_"] = function(rx, ry)
    return rx > 0 and rx < 0.8 and ry > 0 and ry < 0.6
end

SL_ENGINE["InWindowMouse_"] = function()
    return japi.InWindow(japi.MouseRX(), japi.MouseRY())
end

SL_ENGINE["FrameAdaptive_"] = function(w)
    w = w or 0
    if (w == 0) then
        return 0
    end
    local sr = 4 / 3
    local pr = 16 / 9
    local tr = sr / pr
    local dr = japi.DzGetClientWidth() / japi.DzGetClientHeight() / pr
    w = w * tr / dr
    if (w > 0) then
        w = math.max(0.0002, w)
        w = math.min(0.8, w)
    elseif (w < 0) then
        w = math.max(-0.8, w)
        w = math.min(-0.0002, w)
    end
    return w
end

SL_ENGINE["FrameDisAdaptive_"] = function(w)
    w = w or 0
    if (w == 0) then
        return 0
    end
    local sr = 4 / 3
    local pr = 16 / 9
    local tr = sr / pr
    local dr = japi.DzGetClientWidth() / japi.DzGetClientHeight() / pr
    w = w * dr / tr
    if (w > 0) then
        w = math.max(0.0002, w)
        w = math.min(1.6, w)
    elseif (w < 0) then
        w = math.max(-1.6, w)
        w = math.min(-0.0002, w)
    end
    return w
end

SL_ENGINE["Refresh_"] = function(key, callFunc)
    if (type(callFunc) == "function") then
        SL_CACHE["Refresh"].set(key, callFunc)
    else
        SL_CACHE["Refresh"].set(key)
    end
end
---@param this Cursor
Class("Cursor")

    .public("uiKit",
    function(this, modify)
        return this.prop("uiKit", modify)
    end)

    .public("textureAim",
    function(this, modify)
        if (type(modify) == "table" and modify.normal and modify.ally and modify.enemy) then
            modify.normal = AUIKit(this.uiKit(), modify.normal, "tga")
            modify.ally = AUIKit(this.uiKit(), modify.ally, "tga")
            modify.enemy = AUIKit(this.uiKit(), modify.enemy, "tga")
        end
        return this.prop("textureAim", modify)
    end)

    .public("textureCircle",
    function(this, modify)
        if (modify and modify.allow) then
            modify.alpha = modify.alpha or 255
            modify.allow = AUIKit(this.uiKit(), modify.allow, "tga")
            modify.ban = AUIKit(this.uiKit(), modify.ban, "tga")
        end
        return this.prop("textureCircle", modify)
    end)

    .public("textureSquare",
    function(this, modify)
        if (modify and modify.allow) then
            modify.alpha = modify.alpha or 255
            modify.allow = AUIKit(this.uiKit(), modify.allow, "tga")
            modify.ban = AUIKit(this.uiKit(), modify.ban, "tga")
        end
        return this.prop("textureSquare", modify)
    end)

    .public("sizeRate",
    function(this, modify)
        return this.prop("sizeRate", modify)
    end)

    .public("banBorders",
    function(this, modify)
        return this.prop("banBorders", modify)
    end)

    .public("isSave",
    function(this, rx, ry)
        local isSave = true
        local banBorders = this.prop("banBorders")
        if (type(banBorders) ~= "table" or type(rx) ~= "number" or type(ry) ~= "number") then
            return isSave
        end
        if (rx < 0.02 or rx > 0.78 or ry < 0.02 or ry > 0.58) then
            return false
        end
        for _, b in ipairs(banBorders) do
            if (instanceof(b, "Frame")) then
                if (b.show() == true) then
                    local anchor = b.anchor()
                    if (anchor ~= nil) then
                        local x = anchor[1]
                        local y = anchor[2]
                        local w = anchor[3]
                        local h = anchor[4]
                        local xMin = x - w / 2
                        local xMax = x + w / 2
                        local yMin = y - h / 2
                        local yMax = y + h / 2
                        if (rx < xMax and rx > xMin and ry < yMax and ry > yMin) then
                            isSave = false
                            break
                        end
                    end
                end
            end
        end
        return isSave
    end)

    .public("tooltips",
    function(this, modify)
        if (type(modify) == "function") then
            this.prop("tooltips", modify)
            return this
        end
        return this.prop("tooltips")
    end)

    .public("selectionHook",
    function(this, whichUnit)
        if (isObject(whichUnit, "Unit")) then
            J.EnableSelect(false, false)
            time.setTimeout(0, function()
                J.SelectUnit(whichUnit.handle(), true)
            end)
            local s = 72 * whichUnit.prop("scale")
            this.prop("childSelection")
                .position(whichUnit.x(), whichUnit.y())
                .size(s, s)
                .show(true)
            this.prop("selectionHooker", whichUnit)
        end
    end)

    .public("selectionHooking",
    function(this)
        local u = this.prop("selectionHooker")
        if (isObject(u, "Unit")) then
            if (u.isDead()) then
                this.selectionUnHook()
                return
            end
            this.prop("childSelection").position(u.x(), u.y())
        end
    end)

    .public("selectionUnHook",
    function(this, callFunc)
        ---@type Unit
        local u = this.prop("selectionHooker")
        if (isObject(u, "Unit")) then
            this.prop("selectionHooker", NIL)
            local i = 0
            time.setInterval(0.03, function(curTimer)
                i = i + 1
                if (i >= 5 or u.isDead()) then
                    curTimer.destroy()
                    this.prop("childSelection").show(false)
                    J.EnableSelect(true, true)
                    if (type(callFunc) == "function") then
                        callFunc()
                    end
                    return
                end
                this.prop("childSelection").position(u.x(), u.y())
            end)
        end
    end)

    .public("ability",
    function(this, modify)
        if (modify ~= nil) then
            if (isObject(modify, "Ability")) then
                local selection = PlayerLocal().selection()
                if (selection == nil or selection.owner().id() ~= PlayerLocal().id()) then
                    return this
                end
                if (selection.isInterrupt() or selection.isPause() or selection.isAbilityChantCasting() or selection.isAbilityKeepCasting()) then
                    return this
                end
                local at = modify.targetType()
                if (at == nil or at == ABILITY_TARGET_TYPE.PAS or at == ABILITY_TARGET_TYPE.TAG_E) then
                    return
                else
                    this.selectionHook(modify.bindUnit())
                    this.prop("ability", modify)
                    japi.Refresh("SL_CursorAbility", function()
                        ---@type Ability
                        local ab = this.prop("ability")
                        if (isObject(ab, "Ability") == false) then
                            japi.Refresh("SL_CursorAbility", nil)
                            return
                        end

                        local tt = ab.targetType()
                        local bu = ab.bindUnit()
                        if (tt == ABILITY_TARGET_TYPE.TAG_U or tt == ABILITY_TARGET_TYPE.TAG_L or tt == ABILITY_TARGET_TYPE.TAG_C) then
                            this.selectionHooking()
                        end
                        local rx = japi.MouseRX()
                        local ry = japi.MouseRY()
                        if (true ~= this.isSave(rx, ry)) then
                            this.prop("childAim").show(false)
                            this.prop("childArea").show(false)
                            return
                        end

                        local p = PlayerLocal()
                        local isProhibiting = ab.isProhibiting()
                        local coolDownRemain = ab.coolDownRemain()
                        if (isProhibiting or coolDownRemain > 0 or isObject(bu, "Unit") == false) then
                            this.abilityStop()
                            return
                        end
                        local tx = japi.DzGetMouseTerrainX()
                        local ty = japi.DzGetMouseTerrainY()
                        if (tt == ABILITY_TARGET_TYPE.TAG_U or tt == ABILITY_TARGET_TYPE.TAG_L) then
                            this.prop("childArea").show(false)
                            local isBan = bu.isInterrupt() or bu.isPause() or bu.isAbilityChantCasting() or bu.isAbilityKeepCasting()
                            local asset = this.textureAim()
                            if (asset == nil) then
                                asset = {
                                    normal = "Singluar\\ui\\aimWhite.tga",
                                    ally = "Singluar\\ui\\aimGreen.tga",
                                    enemy = "Singluar\\ui\\aimRed.tga"
                                }
                            end
                            local alpha = 255
                            local texture = asset.normal
                            if (isBan) then
                                alpha = 100
                            end
                            local closest = group.closest({
                                key = "Unit",
                                x = tx,
                                y = ty,
                                radius = 120,
                                limit = 5,
                                ---@param enumUnit Unit
                                filter = function(enumUnit)
                                    return ab.isCastTarget(enumUnit)
                                end
                            })
                            local curAimClosest = this.prop("curAimClosest")
                            if (isObject(curAimClosest, "Unit") and curAimClosest ~= closest) then
                                J.SetUnitVertexColor(curAimClosest.handle(), table.unpack(curAimClosest.rgba()))
                            end
                            if (isObject(closest, "Unit")) then
                                if (closest.isEnemy(p)) then
                                    texture = asset.enemy
                                else
                                    texture = asset.ally
                                end
                                local red = 255
                                local green = 255
                                local blue = 255
                                if (closest.isEnemy(p)) then
                                    green = 0
                                    blue = 0
                                elseif (closest.isAlly(p)) then
                                    red = 127
                                    blue = 0
                                end
                                if ((red ~= 255 or green ~= 255 or blue ~= 255)) then
                                    J.SetUnitVertexColor(closest.handle(), red, green, blue, closest.rgba()[4] or 255)
                                end
                                this.prop("curAimClosest", closest)
                            end
                            this.prop("childAim")
                                .texture(texture)
                                .alpha(alpha)
                                .relation(FRAME_ALIGN_CENTER, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, rx, ry)
                                .show(true)
                        elseif (tt == ABILITY_TARGET_TYPE.TAG_C) then
                            this.prop("childAim").show(false)
                            local castRadius = ab.castRadius()
                            local asset = this.textureCircle()
                            if (asset == nil) then
                                local skin = p.race()
                                if (RACE_SELECTION_SPELL_AREA_OF_EFFECT[skin]) then
                                    asset = {
                                        alpha = 255,
                                        allow = RACE_SELECTION_SPELL_AREA_OF_EFFECT[skin],
                                        ban = nil,
                                    }
                                else
                                    asset = {
                                        alpha = 180,
                                        allow = TEAM_COLOR_BLP_YELLOW,
                                        ban = TEAM_COLOR_BLP_RED,
                                    }
                                end
                            end
                            local sizeRate = this.prop("sizeRate")
                            local curSize = this.prop("curSize")
                            if (sizeRate <= 0 or curSize == nil or curSize == castRadius) then
                                curSize = castRadius
                            elseif (curSize < castRadius) then
                                curSize = math.min(castRadius, curSize + sizeRate)
                            elseif (curSize > castRadius) then
                                curSize = math.max(castRadius, curSize - sizeRate)
                            end
                            this.prop("curSize", curSize)
                            local prevUnit = this.prop("curUnits")
                            local newUnits = group.catch({
                                key = "Unit",
                                x = tx,
                                y = ty,
                                radius = castRadius,
                                limit = 30,
                                ---@param enumUnit Unit
                                filter = function(enumUnit)
                                    return ab.isCastTarget(enumUnit)
                                end
                            })
                            local renderAllow = {}
                            for _, u in ipairs(newUnits) do
                                renderAllow[u.id()] = true
                            end
                            if (type(prevUnit) == "table") then
                                for _, u in ipairs(prevUnit) do
                                    if (renderAllow[u.id()] == nil) then
                                        J.SetUnitVertexColor(u.handle(), table.unpack(u.rgba()))
                                    end
                                end
                            end
                            local texture
                            if (ab.isBanCursor({ x = tx, y = ty, radius = curSize, units = newUnits })) then
                                texture = asset.ban or asset.allow
                            else
                                texture = asset.allow
                            end
                            this.prop("curUnits", newUnits)
                            if (#newUnits > 0) then
                                for _, ru in ipairs(newUnits) do
                                    local red = 255
                                    local green = 255
                                    local blue = 255
                                    local alpha = 255
                                    if (ru.owner().isNeutral()) then
                                        green = 230
                                        blue = 0
                                    elseif (ru.isEnemy(p)) then
                                        green = 0
                                        blue = 0
                                    elseif (ru.isAlly(p)) then
                                        red = 127
                                        blue = 0
                                    else
                                        alpha = 100
                                    end
                                    if ((red ~= 255 or green ~= 255 or blue ~= 255)) then
                                        J.SetUnitVertexColor(ru.handle(), red, green, blue, alpha)
                                    end
                                end
                                newUnits = nil
                            end
                            this.prop("childArea")
                                .rgba(255, 255, 255, asset.alpha)
                                .texture(texture)
                                .size(curSize * 2, curSize * 2)
                                .position(tx, ty)
                                .show(true)
                        elseif (tt == ABILITY_TARGET_TYPE.TAG_S) then
                            this.prop("childAim").show(false)
                            local castWidth = ab.castWidth()
                            local castHeight = ab.castHeight()
                            local asset = this.textureSquare()
                            if (asset == nil) then
                                asset = {
                                    alpha = 150,
                                    allow = TEAM_COLOR_BLP_LIGHT_BLUE,
                                    ban = TEAM_COLOR_BLP_RED,
                                }
                            end
                            local sizeRate = this.prop("sizeRate")
                            local w_h = castWidth / castHeight
                            local curWidth = 0
                            local curHeight = this.prop("curSize")
                            if (sizeRate <= 0 or curHeight == nil or curHeight == castHeight) then
                                curHeight = castHeight
                                curWidth = castWidth
                            elseif (curHeight < castHeight) then
                                curHeight = math.min(castHeight, curHeight + sizeRate)
                                curWidth = w_h * curHeight
                            elseif (curHeight > castHeight) then
                                curHeight = math.max(castHeight, curHeight - sizeRate)
                                curWidth = w_h * curHeight
                            end
                            this.prop("curSize", curHeight)
                            local prevUnit = this.prop("curUnits")
                            local newUnits = group.catch({
                                key = "Unit",
                                limit = 30,
                                x = tx,
                                y = ty,
                                width = curWidth,
                                height = curHeight,
                                ---@param enumUnit Unit
                                filter = function(enumUnit)
                                    return ab.isCastTarget(enumUnit)
                                end
                            })
                            local renderAllow = {}
                            for _, u in ipairs(newUnits) do
                                renderAllow[u.id()] = true
                            end
                            if (type(prevUnit) == "table") then
                                for _, u in ipairs(prevUnit) do
                                    if (renderAllow[u.id()] == nil) then
                                        J.SetUnitVertexColor(u.handle(), table.unpack(u.rgba()))
                                    end
                                end
                            end
                            local texture
                            if (ab.isBanCursor({ x = tx, y = ty, width = curWidth, height = curHeight, units = newUnits })) then
                                texture = asset.ban or asset.allow
                            else
                                texture = asset.allow
                            end
                            this.prop("curUnits", newUnits)
                            if (#newUnits > 0) then
                                for _, ru in ipairs(newUnits) do
                                    local red = 255
                                    local green = 255
                                    local blue = 255
                                    if (ru.isEnemy(p)) then
                                        green = 0
                                        blue = 0
                                    elseif (ru.isAlly(p)) then
                                        red = 127
                                        blue = 0
                                    end
                                    if ((red ~= 255 or green ~= 255 or blue ~= 255)) then
                                        J.SetUnitVertexColor(ru.handle(), red, green, blue, ru.alpha())
                                    end
                                end
                                newUnits = nil
                            end
                            this.prop("childArea")
                                .rgba(255, 255, 255, asset.alpha)
                                .texture(texture)
                                .size(curWidth, curHeight)
                                .position(tx, ty)
                                .show(true)
                        end
                    end)
                    mouse.onLeftRelease("SL_CursorAbilityLeftRelease", function(evtData)
                        local ab = this.prop("ability")
                        if (isObject(ab, "Ability") == false) then
                            mouse.onLeftRelease("SL_CursorAbilityLeftRelease", nil)
                            return
                        end
                        local ttc = ab.targetType()
                        if (ttc == ABILITY_TARGET_TYPE.TAG_U) then
                            ---@type Unit
                            local targetUnit = this.prop("curAimClosest")
                            if (isObject(targetUnit, "Unit")) then
                                if (ab.isCastTarget(targetUnit) == false) then
                                    evtData.triggerPlayer.alert(colour.gold('目标不允许'))
                                else
                                    sync.send("G_GAME_SYNC", { "ability_effective_u", ab.id(), targetUnit.id() })
                                end
                            end
                        elseif (ttc == ABILITY_TARGET_TYPE.TAG_L or
                            ttc == ABILITY_TARGET_TYPE.TAG_C or
                            ttc == ABILITY_TARGET_TYPE.TAG_S) then
                            if (true ~= this.isSave(japi.MouseRX(), japi.MouseRY())) then
                                return
                            end
                            local cond = {
                                x = japi.DzGetMouseTerrainX(),
                                y = japi.DzGetMouseTerrainY(),
                            }
                            if (ttc == ABILITY_TARGET_TYPE.TAG_C) then
                                cond.radius = this.prop("curSize") or ab.castRadius()
                                cond.units = this.prop("curUnits")
                            elseif (ttc == ABILITY_TARGET_TYPE.TAG_S) then
                                local cs = this.prop("curSize")
                                if (cs) then
                                    cond.height = this.prop("curSize") or ab.castHeight()
                                    cond.width = ab.castWidth() / ab.castHeight() * cond.height
                                else
                                    cond.height = ab.castHeight()
                                    cond.width = ab.castWidth()
                                end
                                cond.units = this.prop("curUnits")
                            end
                            if (ab.isBanCursor(cond)) then
                                PlayerLocal().alert(colour.red('无效目标'))
                                return
                            end
                            sync.send("G_GAME_SYNC", { "ability_effective_xyz", ab.id(), cond.x, cond.y, japi.DzGetMouseTerrainZ() })
                        end
                    end)
                end
            end
            return this
        end
        return this.prop("ability")
    end)

    .public("abilityStop",
    function(this)
        japi.Refresh("SL_CursorAbility", nil)
        mouse.onLeftRelease("SL_CursorAbilityLeftRelease", nil)
        this.prop("childAim").show(false)
        this.prop("childArea").show(false)
        local prevRadiusUnit = this.prop("curUnits")
        if (type(prevRadiusUnit) == "table") then
            for _, u in ipairs(prevRadiusUnit) do
                J.SetUnitVertexColor(u.handle(), table.unpack(u.rgba()))
            end
        end
        local curAimClosest = this.prop("curAimClosest")
        if (isObject(curAimClosest, "Unit")) then
            J.SetUnitVertexColor(curAimClosest.handle(), table.unpack(curAimClosest.rgba()))
            this.prop("curAimClosest", NIL)
        end
        this.prop("curSize", NIL)
        this.prop("curUnits", NIL)
        local ab = this.prop("ability")
        if (isObject(ab, "Ability")) then
            this.selectionUnHook(function()
                time.setTimeout(0, function()
                    this.prop("ability", NIL)
                end)
            end)
        end
    end)

    .public("abilityQuote",
    function(this, whichAbility)
        if (this.following()) then
            return
        end
        if (isObject(whichAbility, "Ability")) then
            local p = PlayerLocal()
            if (table.equal(whichAbility.bindUnit().owner(), p) == false) then
                return
            end
            local tt = whichAbility.targetType()
            if (tt == nil or tt == ABILITY_TARGET_TYPE.PAS) then
                return
            end
            if (whichAbility.isProhibiting() == true) then
                p.alert(colour.gold(whichAbility.prohibitReason()))
                return
            end
            if (whichAbility.bindUnit().isInterrupt() or whichAbility.bindUnit().isPause()) then
                p.alert(colour.red('无法行动'))
                return
            end
            if (whichAbility.bindUnit().isAbilityChantCasting() or whichAbility.bindUnit().isAbilityKeepCasting()) then
                p.alert(colour.gold('施法中'))
                return
            end
            local v = Vcm("war3_click1")
            if (isObject(v, "Vcm")) then
                v.play()
            end
            if (tt == ABILITY_TARGET_TYPE.TAG_E) then
                sync.send("G_GAME_SYNC", { "ability_effective", whichAbility.id() })
                return
            elseif (tt == ABILITY_TARGET_TYPE.TAG_U and whichAbility == Cursor().ability()) then
                local u = whichAbility.bindUnit()
                if (whichAbility.isCastTarget(u)) then
                    sync.send("G_GAME_SYNC", { "ability_effective_u", whichAbility.id(), whichAbility.bindUnit().id() })
                    return
                end
            end
            Cursor().ability(whichAbility)
        end
    end)

    .public("itemQuote",
    function(this, whichItem)
        if (this.following()) then
            return
        end
        if (isObject(whichItem, "Item")) then
            this.abilityQuote(whichItem.ability())
        end
    end)

    .public("followObj",
    function(this)
        return this.prop("followObj")
    end)

    .public("following",
    function(this)
        return nil ~= this.followObj()
    end)

    .public("followCall",
    function(this, obj, data, stopFunc)
        if (obj ~= nil) then
            this.abilityStop()
            data = data or {}
            local texture = data.texture
            local size = data.size
            if (data.frame) then
                if (texture == nil) then
                    if (data.frame.texture) then
                        texture = data.frame.texture()
                    end
                end
                if (size == nil) then
                    if (data.frame.size) then
                        size = data.frame.size()
                    end
                end
            end
            ---@type FrameBackdrop
            local childFollow = this.prop("childFollow")
            childFollow
                .texture(texture)
                .size(size[1], size[2])
                .relation(FRAME_ALIGN_CENTER, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, japi.MouseRX(), japi.MouseRY())
                .alpha(150)
                .show(true)
            this.selectionHook(PlayerLocal().selection())
            japi.Refresh("SL_CursorFollow", function()
                local prevObj = this.prop("followObj")
                if (false == table.equal(obj, prevObj)) then
                    japi.Refresh("SL_CursorFollow", nil)
                    this.followStop(stopFunc)
                    return
                end
                local siz = childFollow.size()
                local mx = japi.MouseRX()
                local my = japi.MouseRY()
                if (siz ~= nil) then
                    local hw = siz[1] / 2
                    local hh = siz[2] / 2
                    if (mx - hw < 0) then
                        mx = hw
                    end
                    if (mx + hw > 0.8) then
                        mx = 0.8 - hw
                    end
                    if (my - hh < 0) then
                        my = hh
                    end
                    if (my + hh > 0.6) then
                        my = 0.6 - hh
                    end
                end
                childFollow.relation(FRAME_ALIGN_CENTER, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, mx, my)
                this.selectionHooking()
            end)
            mouse.onLeftRelease("SL_CursorFollowDrop", function()
                local o = this.prop("followObj")
                if (isObject(o, "Item") and this.isSave(japi.MouseRX(), japi.MouseRY())) then
                    sync.send("G_GAME_SYNC", { "item_drop_cursor", o.id(), japi.DzGetMouseTerrainX(), japi.DzGetMouseTerrainY() })
                    this.followStop()
                end
            end)
            this.prop("followObj", obj)
            this.prop("followData", data)
        end
    end)

    .public("followStop",
    function(this, stopFunc)
        japi.Refresh("SL_CursorFollow", nil)
        mouse.onLeftRelease("SL_CursorFollowDrop", nil)
        this.selectionUnHook()
        ---@type FrameBackdrop
        local childFollow = this.prop("childFollow")
        childFollow.alpha(0).show(false)
        local followData = this.prop("followData") or {}
        followData.followObj = this.prop("followObj")
        if (type(stopFunc) == "function") then
            stopFunc(followData)
        end
        this.prop("followObj", NIL)
    end)
                _SLK_ORIGIN_DATA = {

    --【 英雄 】

    --圣骑士
    ["units\\human\\HeroPaladin\\HeroPaladin"] = { unitSound = "HeroPaladin", scale = 1.25, backSw1 = 0.567, dmgpt1 = 0.433 },
    --大魔法师
    ["units\\human\\HeroArchMage\\HeroArchMage"] = { unitSound = "HeroArchMage", scale = 1.50, backSw1 = 0.850, dmgpt1 = 0.550, movetp = "horse" },
    --大魔法师(魂)
    ["units\\ther\\HeroArchMageGhost\\HeroArchMageGhost"] = { unitSound = "HeroArchMage", scale = 1.50, backSw1 = 0.850, dmgpt1 = 0.550, },
    --山丘之王
    ["units\\ther\\HeroMountainKing\\HeroMountainKing"] = { unitSound = "HeroMountainKing", scale = 1.25, backSw1 = 0.650, dmgpt1 = 0.350, },
    --血魔法师
    ["units\\ther\\HeroBloodElf\\HeroBloodElf"] = { unitSound = "HeroBloodElf", scale = 1.50, backSw1 = 0.850, dmgpt1 = 0.550, },
    --阿尔塞斯
    ["units\\human\\Arthas\\Arthas"] = { unitSound = "Arthas", scale = 1.10, backSw1 = 0.567, dmgpt1 = 0.433, },
    --阿尔塞斯(剑)
    ["units\\human\\ArthaswithSword\\ArthaswithSword"] = { unitSound = "Arthas", scale = 1.10, backSw1 = 0.567, dmgpt1 = 0.433, },
    --海军上将普洛德摩尔
    ["units\\other\\Proudmoore\\Proudmoore"] = { unitSound = "Proudmoore", scale = 1.10, backSw1 = 0.567, dmgpt1 = 0.433, },
    --吉安娜
    ["units\\human\\Jaina\\Jaina"] = { unitSound = "Jaina", scale = 1.50, backSw1 = 0.400, dmgpt1 = 0.550, },
    --加理瑟斯
    ["units\\creeps\\LordGarithos\\LordGarithos"] = { unitSound = "Garithos", scale = 1.25, backSw1 = 0.567, dmgpt1 = 0.433, },
    --追风之西尔瓦娜斯
    ["units\\creeps\\SylvanusWindrunner\\SylvanusWindrunner"] = { unitSound = "Sylvanus", scale = 1.10, backSw1 = 0.580, dmgpt1 = 0.700, },
    --火凤凰
    ["units\\human\\phoenix\\phoenix"] = { unitSound = "Phoenix", scale = 1.50, backSw1 = 0.633, dmgpt1 = 0.430, movetp = "fly", moveHeight = 240 },
    --剑圣绿
    ["units\\orc\\HeroBladeMaster\\HeroBladeMaster"] = { unitSound = "HeroBladeMaster", scale = 1.25, backSw1 = 0.840, dmgpt1 = 0.330, },
    --剑圣红
    ["units\\demon\\HeroChaosBladeMaster\\HeroChaosBladeMaster"] = { unitSound = "HeroChaosBladeMaster", scale = 1.25, backSw1 = 0.840, dmgpt1 = 0.330, },
    --地狱咆哮
    ["units\\orc\\Hellscream\\Hellscream"] = { unitSound = "Grom", scale = 1.15, backSw1 = 0.500, dmgpt1 = 0.500, },
    --地狱咆哮红
    ["units\\demon\\ChaosHellscream\\ChaosHellscream"] = { unitSound = "Grom", scale = 1.15, backSw1 = 0.500, dmgpt1 = 0.500, },
    --先知
    ["units\\orc\\HeroFarSeer\\HeroFarSeer"] = { unitSound = "HeroFarSeer", scale = 2.00, backSw1 = 0.500, dmgpt1 = 0.300, movetp = "horse" },
    --萨尔
    ["units\\orc\\Thrall\\Thrall"] = { unitSound = "Thrall", scale = 2.00, backSw1 = 0.500, dmgpt1 = 0.300, },
    --牛头人酋长
    ["units\\orc\\HeroTaurenChieftain\\HeroTaurenChieftain"] = { unitSound = "HeroTaurenChieftain", scale = 2.00, backSw1 = 0.970, dmgpt1 = 0.360, },
    --暗影猎手
    ["units\\orc\\HeroShadowHunter\\HeroShadowHunter"] = { unitSound = "HeroShadowHunter", scale = 1.20, backSw1 = 0.500, dmgpt1 = 0.300, },
    --兽王
    ["Units\\Other\\Rexxar\\Rexxar"] = { unitSound = "Beastmaster", scale = 2.00, backSw1 = 0.700, dmgpt1 = 0.300, },
    --死骑
    ["units\\undead\\HeroDeathKnight\\HeroDeathKnight"] = { unitSound = "HeroDeathKnight", scale = 1.85, backSw1 = 0.410, dmgpt1 = 0.560, },
    --巫妖
    ["units\\undead\\HeroLich\\HeroLich"] = { unitSound = "HeroLich", scale = 1.25, backSw1 = 0.540, dmgpt1 = 0.460, movetp = "hover", moveHeight = 30 },
    --恐惧魔王
    ["units\\undead\\HeroDreadLord\\HeroDreadLord"] = { unitSound = "HeroDreadLord", scale = 1.50, backSw1 = 0.550, dmgpt1 = 0.550, },
    --地穴领主
    ["units\\undead\\HeroCryptLord\\HeroCryptLord"] = { unitSound = "HeroCryptLord", scale = 1.85, backSw1 = 0.540, dmgpt1 = 0.460, },
    --克尔苏加德
    ["units\\undead\\Kelthuzad\\Kelthuzad"] = { unitSound = "KelthuzadNecro", scale = 1.25, backSw1 = 0.470, dmgpt1 = 0.530, },
    --克尔苏加德 (幽灵)
    ["units\\undead\\KelThuzadGhost\\KelThuzadGhost"] = { unitSound = "KelThuzadLich", scale = 2.80, backSw1 = 0.700, dmgpt1 = 0.800, },
    --深渊魔王
    ["units\\undead\\HeroPitLord\\HeroPitLord"] = { unitSound = "PitLord", scale = 1.25, backSw1 = 0.470, dmgpt1 = 0.530, },
    --阿克蒙德
    ["units\\undead\\Warlock\\Warlock"] = { unitSound = "Warlock", scale = 1.40, backSw1 = 0.600, dmgpt1 = 0.500, },
    --基尔加丹
    ["units\\undead\\Kiljaeden\\Kiljaeden"] = { unitSound = "Tichondrius", scale = 1.40, backSw1 = 0.550, dmgpt1 = 0.550, },
    --丛林守护者
    ["units\\nightelf\\HeroKeeperoftheGrove\\HeroKeeperoftheGrove"] = { unitSound = "HeroKeeperoftheGrove", scale = 2.25, backSw1 = 0.770, dmgpt1 = 0.400, movetp = "horse" },
    --丛林守护者(幽灵)
    ["units\\nightelf\\HeroKeeperoftheGroveGhost\\HeroKeeperoftheGroveGhost"] = { unitSound = "HeroKeeperoftheGrove", scale = 2.25, backSw1 = 0.770, dmgpt1 = 0.400, movetp = "horse" },
    --月之女祭司
    ["units\\nightelf\\HeroMoonPriestess\\HeroMoonPriestess"] = { unitSound = "HeroMoonPriestess", scale = 2.25, backSw1 = 0.700, dmgpt1 = 0.300, movetp = "horse" },
    --守望者
    ["units\\nightelf\\herowarden\\herowarden"] = { unitSound = "herowarden", scale = 1.50, backSw1 = 0.700, dmgpt1 = 0.300, },
    --恶魔猎手
    ["units\\nightelf\\HeroDemonHunter\\HeroDemonHunter"] = { unitSound = "HeroDemonHunter", scale = 1.50, backSw1 = 0.600, dmgpt1 = 0.300, },
    --恶魔猎手(邪恶)
    ["units\\nightelf\\EvilIllidan\\IllidanEvil"] = { unitSound = "EvilIllidan", scale = 1.50, backSw1 = 0.600, dmgpt1 = 0.300, },
    --法里奥
    ["units\\nightelf\\Furion\\Furion"] = { unitSound = "Furion", scale = 1.25, backSw1 = 0.770, dmgpt1 = 0.400, },
    --玛尔法里奥
    ["units\\nightelf\\MalFurion\\MalFurion"] = { unitSound = "MalFurion", scale = 2.25, backSw1 = 0.770, dmgpt1 = 0.400, movetp = "horse" },
    --玛尔法里奥(无鹿角)
    ["units\\nightelf\\MalFurion\\MalFurionNoStag"] = { unitSound = "MalFurion", scale = 2.25, backSw1 = 0.770, dmgpt1 = 0.400, movetp = "horse" },
    --黑暗游侠
    ["Units\\Creeps\\BansheeRanger\\BansheeRanger"] = { unitSound = "DarkRanger", scale = 1.50, backSw1 = 0.300, dmgpt1 = 0.700, },
    --火焰巨魔
    ["Units\\Creeps\\HeroFlameLord\\HeroFlameLord"] = { unitSound = "HeroFireLord", scale = 1.80, backSw1 = 0.540, dmgpt1 = 0.500, },
    --炼金术士
    ["Units\\Creeps\\HeroGoblinAlchemist\\HeroGoblinAlchemist"] = { unitSound = "HEROGoblinALCHEMIST", scale = 2.00, backSw1 = 0.650, dmgpt1 = 0.350, },
    --美杜莎
    ["units\\naga\\HeroNagaSeawitch\\HeroNagaSeawitch"] = { unitSound = "SeaWitch", scale = 2.00, backSw1 = 0.540, dmgpt1 = 0.730, movetp = "amph" },
    --修补匠
    ["Units\\Creeps\\HeroTinker\\HeroTinker"] = { unitSound = "HeroTinker", scale = 2.00, backSw1 = 0.650, dmgpt1 = 0.350, },
    --阿卡玛
    ["units\\other\\DranaiAkama\\DranaiAkama"] = { unitSound = "Akama", scale = 1.15, backSw1 = 0.580, dmgpt1 = 0.590, },
    --熊猫酒仙
    ["Units\\Creeps\\PandarenBrewmaster\\PandarenBrewmaster"] = { unitSound = "PandarenBrewmaster", scale = 1.40, backSw1 = 0.650, dmgpt1 = 0.350, },
    --熊猫大地
    ["Units\\Creeps\\EarthPandarenBrewmaster\\EarthPandarenBrewmaster"] = { unitSound = "EarthPandarenBrewmaster", scale = 1.40, backSw1 = 0.300, dmgpt1 = 0.300, },
    --熊猫雷暴
    ["Units\\Creeps\\StormPandarenBrewmaster\\StormPandarenBrewmaster"] = { unitSound = "StormPandarenBrewmaster", scale = 1.40, backSw1 = 0.300, dmgpt1 = 0.300, },
    --熊猫烈焰
    ["Units\\Creeps\\FirePandarenBrewmaster\\FirePandarenBrewmaster"] = { unitSound = "FirePandarenBrewmaster", scale = 1.40, backSw1 = 0.300, dmgpt1 = 0.300, },

    --【 单位 】

    --农民
    ["units\\human\\Peasant\\Peasant"] = { unitSound = "Peasant", scale = 1.00, backSw1 = 0.567, dmgpt1 = 0.433, },
    --步兵
    ["units\\human\\Footman\\Footman"] = { unitSound = "Footman", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, },
    --骑士
    ["units\\human\\Knight\\Knight"] = { unitSound = "Knight", scale = 1.40, backSw1 = 0.440, dmgpt1 = 0.660, movetp = "horse" },
    --矮人火枪手
    ["units\\human\\Rifleman\\Rifleman"] = { unitSound = "Rifleman", scale = 1.00, backSw1 = 0.700, dmgpt1 = 0.170, },
    --迫击炮小队
    ["units\\human\\MortarTeam\\MortarTeam"] = { unitSound = "MortarTeam", scale = 1.30, backSw1 = 1.100, dmgpt1 = 1.000, },
    --飞行机器
    ["units\\human\\Gyrocopter\\Gyrocopter"] = { unitSound = "Gyrocopter", scale = 1.50, backSw1 = 0.970, dmgpt1 = 0.030, movetp = "fly", moveHeight = 280 },
    --狮鹫骑士
    ["units\\human\\GryphonRider\\GryphonRider"] = { unitSound = "GryphonRider", scale = 1.50, backSw1 = 0.870, dmgpt1 = 0.800, movetp = "fly", moveHeight = 240 },
    --牧师
    ["units\\human\\Priest\\Priest"] = { unitSound = "Priest", scale = 1.00, backSw1 = 0.580, dmgpt1 = 0.590, },
    --女巫
    ["units\\human\\Sorceress\\Sorceress"] = { unitSound = "Sorceress", scale = 1.00, backSw1 = 0.780, dmgpt1 = 0.750, movetp = "hover" },
    --蒸汽机车
    ["units\\human\\WarWagon\\WarWagon"] = { unitSound = "SteamTank", scale = 2.50, backSw1 = 0.500, dmgpt1 = 0.500, },
    --魔法破坏者
    ["units\\human\\BloodElfSpellThief\\BloodElfSpellThief"] = { unitSound = "SpellBreaker", scale = 1.20, backSw1 = 0.500, dmgpt1 = 0.500, },
    --龙鹰骑士
    ["units\\human\\BloodElfDragonHawk\\BloodElfDragonHawk"] = { unitSound = "BloodElfDragonHawk", scale = 1.50, backSw1 = 0.633, dmgpt1 = 0.430, movetp = "fly", moveHeight = 240 },
    --民兵
    ["units\\human\\Militia\\Militia"] = { unitSound = "Peasant", scale = 1.00, backSw1 = 0.440, dmgpt1 = 0.390, },
    --水元素
    ["units\\human\\WaterElemental\\WaterElemental"] = { unitSound = "WaterElemental", scale = 1.60, backSw1 = 0.770, dmgpt1 = 0.400 },
    --剑士
    ["units\\human\\TheCaptain\\TheCaptain"] = { unitSound = "HighElfSwordsman", scale = 1.20, backSw1 = 0.500, dmgpt1 = 0.500 },
    --牧师使者
    ["units\\creeps\\HumanMage\\HumanMage"] = { unitSound = "HumanMage", scale = 1.20, backSw1 = 0.500, dmgpt1 = 0.500 },
    --高级精灵男
    ["units\\critters\\HighElfPeasant\\HighElfPeasant"] = { unitSound = "BloodElfWorker", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500 },
    --高级精灵女
    ["units\\critters\\ElfVillagerWoman\\ElfVillagerWoman"] = { unitSound = "VillagerWoman", scale = 1.00 },
    --高级精灵弓箭手
    ["units\\creeps\\HighElfArcher\\HighElfArcher"] = { unitSound = "Archer", scale = 1.00, backSw1 = 0.280, dmgpt1 = 0.720 },
    --麦迪文
    ["units\\creeps\\Medivh\\Medivh"] = { unitSound = "Medivh", scale = 1.25, backSw1 = 0.490, dmgpt1 = 0.600 },

    --苦工
    ["units\\orc\\Peon\\Peon"] = { unitSound = "Peon", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, },
    --苦工(邪恶)
    ["units\\demon\\ChaosPeon\\ChaosPeon"] = { unitSound = "Peon", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, },
    --兽族步兵
    ["units\\orc\\Grunt\\Grunt"] = { unitSound = "Grunt", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330, },
    --兽族步兵(邪恶)
    ["units\\demon\\ChaosGrunt\\ChaosGrunt"] = { unitSound = "ChaosGrunt", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330, },
    --兽族步兵(骷髅)
    ["units\\creeps\\SkeletonOrc\\SkeletonOrc"] = { unitSound = "Skeleton", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330, },
    --掠夺者
    ["units\\orc\\WolfRider\\WolfRider"] = { unitSound = "WolfRider", scale = 1.60, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "horse" },
    --掠夺者(邪恶)
    ["units\\demon\\ChaosWolfRider\\ChaosWolfRider"] = { unitSound = "WolfRider", scale = 1.60, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "horse" },
    --牛头人
    ["units\\orc\\Tauren\\Tauren"] = { unitSound = "Tauren", scale = 1.60, backSw1 = 0.863, dmgpt1 = 0.467, },
    --巨魔猎头者
    ["units\\orc\\HeadHunter\\HeadHunter"] = { unitSound = "HeadHunter", scale = 1.10, backSw1 = 0.860, dmgpt1 = 0.310, },
    --粉碎者
    ["units\\orc\\catapult\\catapult"] = { unitSound = "Catapult", scale = 2.75, backSw1 = 0.100, dmgpt1 = 1.900, },
    --科多兽
    ["units\\orc\\KotoBeast\\KotoBeast"] = { unitSound = "KotoBeast", scale = 2.25, backSw1 = 0.320, dmgpt1 = 0.850, movetp = "horse" },
    --科多兽(邪恶)
    ["units\\demon\\ChaosKotoBeast\\ChaosKotoBeast"] = { unitSound = "KotoBeastNoRider", scale = 2.25, backSw1 = 0.320, dmgpt1 = 0.850, movetp = "horse" },
    --科多兽(无驾驶员)
    ["units\\orc\\KotoBeastNoRider\\KotoBeastNoRider"] = { unitSound = "KotoBeastNoRider", scale = 2.25, backSw1 = 0.320, dmgpt1 = 0.850, movetp = "horse" },
    --风骑士
    ["units\\orc\\WyvernRider\\WyvernRider"] = { unitSound = "WyvernRider", scale = 1.75, backSw1 = 0.540, dmgpt1 = 0.600, movetp = "fly", moveHeight = 240 },
    --风骑士(灵魂)
    ["units\\orc\\SpiritWyvern\\SpiritWyvern"] = { unitSound = "Hippogryph", scale = 1.75, backSw1 = 0.540, dmgpt1 = 0.600, movetp = "fly", moveHeight = 240 },
    --风骑士(无驾驶员)
    ["units\\orc\\RiderlessWyvern\\RiderlessWyvern"] = { unitSound = "Hippogryph", scale = 1.75, backSw1 = 0.540, dmgpt1 = 0.600, movetp = "fly", moveHeight = 240 },
    --巨魔蝙蝠骑士
    ["units\\orc\\BatTroll\\BatTroll"] = { unitSound = "TrollBatrider", scale = 1.75, backSw1 = 0.540, dmgpt1 = 0.600, movetp = "fly", moveHeight = 240 },
    --巨魔萨满
    ["units\\orc\\WitchDoctor\\WitchDoctor"] = { unitSound = "WitchDoctor", scale = 1.00, backSw1 = 0.600, dmgpt1 = 0.730, },
    --萨满祭司
    ["units\\orc\\Shaman\\Shaman"] = { unitSound = "Shaman", scale = 1.15, backSw1 = 0.740, dmgpt1 = 0.430, },
    --灵魂行者
    ["units\\orc\\spiritwalker\\spiritwalker"] = { unitSound = "SpiritWalker", scale = 1.15, backSw1 = 0.600, dmgpt1 = 0.500, },
    --幽魂之狼
    ["units\\orc\\Spiritwolf\\Spiritwolf"] = { unitSound = "SpiritWolf", scale = 1.25, backSw1 = 0.640, dmgpt1 = 0.330, },
    --毒蛇守卫
    ["units\\orc\\SerpentWard\\SerpentWard"] = { unitSound = "SerpentWard", scale = 0.75, backSw1 = 0.700, dmgpt1 = 0.300, },
    --岗哨守卫
    ["units\\orc\\SentryWard\\SentryWard"] = { unitSound = "SentryWard", scale = 0.75, },
    --静止陷阱
    ["units\\orc\\StasisTotem\\StasisTotem"] = { unitSound = "StasisTotem", scale = 0.75, },
    --治疗守卫
    ["units\\orc\\HealingWard\\HealingWard"] = { unitSound = "HealingWard", scale = 0.75, },
    --兽族战争首领
    ["units\\demon\\ChaosWarlord\\ChaosWarlord"] = { unitSound = "ChaosWarlord", scale = 1.00, backSw1 = 0.468, dmgpt1 = 0.500, },
    --德拉克苏尔
    ["units\\creeps\\OrcWarlockRed\\OrcWarlockRed"] = { unitSound = "ShamanX", scale = 1.25, backSw1 = 0.470, dmgpt1 = 0.530, },
    --巫师
    ["units\\creeps\\ChaosWarlockGreen\\ChaosWarlockGreen"] = { unitSound = "Shaman", scale = 1.15, backSw1 = 0.740, dmgpt1 = 0.430, },
    --巫师(邪恶)
    ["units\\demon\\ChaosWarlock\\ChaosWarlock"] = { unitSound = "Shaman", scale = 1.15, backSw1 = 0.740, dmgpt1 = 0.430, },

    --侍僧
    ["units\\undead\\Acolyte\\Acolyte"] = { unitSound = "Acolyte", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.400, },
    --阴影
    ["units\\undead\\Shade\\Shade"] = { unitSound = "Shade", scale = 1.00, movetp = "hover", moveHeight = 30 },
    --食尸鬼
    ["units\\undead\\Ghoul\\Ghoul"] = { unitSound = "Ghoul", scale = 1.10, backSw1 = 0.440, dmgpt1 = 0.390, },
    --憎恶
    ["units\\undead\\Abomination\\Abomination"] = { unitSound = "Abomination", scale = 2.10, backSw1 = 1.170, dmgpt1 = 0.500, },
    --绞肉车
    ["units\\undead\\MeatWagon\\MeatWagon"] = { unitSound = "MeatWagon", scale = 2.50, backSw1 = 1.300, dmgpt1 = 0.700, },
    --穴居恶魔
    ["units\\undead\\CryptFiend\\CryptFiend"] = { unitSound = "CryptFiend", scale = 1.85, backSw1 = 0.360, dmgpt1 = 0.640, },
    --石像鬼
    ["units\\undead\\Gargoyle\\Gargoyle"] = { unitSound = "Gargoyle", scale = 1.25, backSw1 = 1.000, dmgpt1 = 0.330, movetp = "fly", moveHeight = 240 },
    --女妖
    ["units\\undead\\Banshee\\Banshee"] = { unitSound = "Banshee", scale = 1.00, backSw1 = 0.510, dmgpt1 = 0.560, },
    --女妖(灵魂)
    ["units\\creeps\\BansheeGhost\\BansheeGhost"] = { unitSound = "BansheeGhost", scale = 1.00, backSw1 = 0.510, dmgpt1 = 0.560, },
    --不死族巫师
    ["units\\undead\\Necromancer\\Necromancer"] = { unitSound = "Necromancer", scale = 1.00, backSw1 = 0.470, dmgpt1 = 0.530, },
    --十胜石雕像
    ["units\\undead\\ObsidianStatue\\ObsidianStatue"] = { unitSound = "ObsidianStatue", scale = 1.00, backSw1 = 0.470, dmgpt1 = 0.530, movetp = "hover", moveHeight = 50 },
    --冰霜巨龙
    ["units\\undead\\FrostWyrm\\FrostWyrm"] = { unitSound = "FrostWyrm", scale = 1.00, backSw1 = 0.550, dmgpt1 = 0.500, movetp = "fly", moveHeight = 240 },
    --蝗虫
    ["units\\undead\\Locust\\Locust"] = { unitSound = "Locust", scale = 1.00, },
    --疾病云雾
    ["units\\undead\\PlagueCloud\\PlagueCloud"] = { unitSound = "PlagueCloud", scale = 1.00, },
    --骷髅战士
    ["units\\undead\\Skeleton\\Skeleton"] = { unitSound = "Skeleton", scale = 1.00, backSw1 = 0.440, dmgpt1 = 0.560, },
    --骷髅魔法师
    ["units\\undead\\SkeletonMage\\SkeletonMage"] = { unitSound = "Skeleton", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, },
    --骷髅弓箭手
    ["units\\creeps\\SkeletonArcher\\SkeletonArcher"] = { unitSound = "SkeletonArcher", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.700, },
    --腐尸甲虫
    ["units\\undead\\scarab\\scarab"] = { unitSound = "Scarab", scale = 1.25, backSw1 = 0.640, dmgpt1 = 0.330, },
    --僵尸
    ["units\\creeps\\Zombie\\Zombie"] = { unitSound = "Zombie", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },

    --小精灵
    ["units\\nightelf\\Wisp\\Wisp"] = { unitSound = "Wisp", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "hover" },
    --弓箭手
    ["units\\nightelf\\Archer\\Archer"] = { unitSound = "Archer", scale = 1.00, backSw1 = 0.280, dmgpt1 = 0.720, },
    --女猎手
    ["units\\nightelf\\Huntress\\Huntress"] = { unitSound = "Huntress", scale = 1.50, backSw1 = 0.540, dmgpt1 = 0.460, movetp = "horse" },
    --树妖
    ["units\\nightelf\\Dryad\\Dryad"] = { unitSound = "Dryad", scale = 1.25, backSw1 = 0.700, dmgpt1 = 0.300, },
    --投刃车
    ["units\\nightelf\\Ballista\\Ballista"] = { unitSound = "Ballista", scale = 3.00, backSw1 = 1.900, dmgpt1 = 0.100, },
    --角鹰兽
    ["units\\nightelf\\Hippogryph\\Hippogryph"] = { unitSound = "Hippogryph", scale = 1.50, backSw1 = 0.370, dmgpt1 = 0.600, movetp = "fly", moveHeight = 240 },
    --角鹰兽骑士
    ["units\\nightelf\\RiddenHippogryph\\RiddenHippogryph"] = { unitSound = "RiddenHippogryph", scale = 1.50, backSw1 = 0.337, dmgpt1 = 0.633, movetp = "fly", moveHeight = 240 },
    --奇美拉
    ["units\\nightelf\\Chimaera\\Chimaera"] = { unitSound = "Chimaera", scale = 2.00, backSw1 = 0.650, dmgpt1 = 0.700, movetp = "fly", moveHeight = 280 },
    --猛禽德鲁伊
    ["units\\nightelf\\DruidoftheTalon\\DruidoftheTalon"] = { unitSound = "DruidoftheTalon", scale = 1.25, backSw1 = 0.670, dmgpt1 = 0.500, },
    --利爪德鲁伊
    ["units\\nightelf\\DruidoftheClaw\\DruidoftheClaw"] = { unitSound = "DruidoftheClaw", scale = 2.00, backSw1 = 0.530, dmgpt1 = 0.330, },
    --山岭巨人
    ["units\\nightelf\\MountainGiant\\MountainGiant"] = { unitSound = "MountainGiant", scale = 3.00, backSw1 = 1.000, dmgpt1 = 0.490, },
    --精灵龙
    ["units\\nightelf\\FaerieDragon\\FaerieDragon"] = { unitSound = "FaerieDragon", scale = 1.50, backSw1 = 0.800, dmgpt1 = 0.500, movetp = "fly", moveHeight = 240 },
    --猫头鹰侦察者
    ["units\\nightelf\\OwlSCOUT\\OwlSCOUT"] = { unitSound = "owl", scale = 1.20, backSw1 = 1, dmgpt1 = 1, movetp = "fly", moveHeight = 240 },
    --树人
    ["units\\nightelf\\Ent\\Ent"] = { unitSound = "Ent", scale = 1.10, backSw1 = 0.533, dmgpt1 = 0.467 },
    --树人(堕落)
    ["units\\creeps\\CorruptedEnt\\CorruptedEnt"] = { unitSound = "Ent", scale = 1.10, backSw1 = 0.533, dmgpt1 = 0.467 },
    --复仇天神
    ["units\\nightelf\\SpiritOfVengeance\\SpiritOfVengeance"] = { unitSound = "SpiritOfVengeance", scale = 2.00, backSw1 = 0.640, dmgpt1 = 0.330 },
    --复仇之魂
    ["units\\nightelf\\Vengeance\\Vengeance"] = { unitSound = "Vengeance", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330 },
    --守望者(暗杀)
    ["units\\creeps\\assassin\\assassin"] = { unitSound = "Assassin", scale = 1.15, backSw1 = 0.280, dmgpt1 = 0.720 },

    --飞蛇
    ["units\\naga\\WindSerpent\\WindSerpent"] = { unitSound = "WindSerpent", scale = 1.75, backSw1 = 1.000, dmgpt1 = 0.330, movetp = "fly", moveHeight = 240 },
    --娜迦海妖
    ["Units\\Naga\\NagaSiren\\NagaSiren"] = { unitSound = "NagaSiren", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --飞龙
    ["Units\\Naga\\SnapDragon\\SnapDragon"] = { unitSound = "SnapDragon", scale = 2.00, backSw1 = 0.700, dmgpt1 = 0.300, movetp = "amph" },
    --娜迦暴徒
    ["Units\\Naga\\NagaMyrmidon\\NagaMyrmidon"] = { unitSound = "NagaMyrmidon", scale = 1.75, backSw1 = 0.640, dmgpt1 = 0.360, movetp = "amph" },
    --娜迦皇家卫兵
    ["Units\\Naga\\NagaRoyalGuard\\NagaRoyalGuard"] = { unitSound = "NagaRoyalGuard", scale = 2.25, backSw1 = 0.640, dmgpt1 = 0.360, movetp = "amph" },
    --娜迦召唤者
    ["Units\\Naga\\NagaSummoner\\NagaSummoner"] = { unitSound = "NagaSiren", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },

    --口袋工厂
    ["Units\\Creeps\\HeroTinkerFactory\\HeroTinkerFactory"] = { unitSound = "PocketFactory", scale = 3.30, },
    --口袋工厂(人工地精)
    ["Units\\Creeps\\HeroTinkerRobot\\HeroTinkerRobot"] = { unitSound = "ClockwerkGoblin", scale = 1.10, backSw1 = 0.640, dmgpt1 = 0.330, },
    --炎魔
    ["Units\\Creeps\\LavaSpawn\\LavaSpawn"] = { unitSound = "LavaSpawn", scale = 1.60, backSw1 = 0.770, dmgpt1 = 0.400 },
    --米纱熊
    ["units\\creeps\\GrizzlyBear\\GrizzlyBear"] = { unitSound = "GrizzlyBear", scale = 1.75, backSw1 = 0.670, dmgpt1 = 0.630 },
    --战鹰
    ["units\\creeps\\WarEagle\\WarEagle"] = { unitSound = "WarEagle", scale = 1.25, backSw1 = 0.670, dmgpt1 = 0.500 },
    --狂暴豪猪
    ["Units\\Creeps\\QuillBeast\\QuillBeast"] = { unitSound = "QuillBeast", scale = 1.30, backSw1 = 0.670, dmgpt1 = 0.500 },

    --钢灰海龟
    ["Units\\Creeps\\SeaTurtle\\SeaTurtle"] = { unitSound = "GiantSeaTurtle", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.600, movetp = "amph" },
    --黄绿海龟
    ["Units\\Creeps\\GiantSeaTurtle\\GiantSeaTurtle"] = { unitSound = "GiantSeaTurtle", scale = 3.00, backSw1 = 0.300, dmgpt1 = 0.600, movetp = "amph" },
    --龙龟
    ["Units\\Creeps\\DragonSeaTurtleRange\\DragonSeaTurtleRange"] = { unitSound = "GiantSeaTurtle", scale = 2.50, backSw1 = 0.300, dmgpt1 = 0.600, movetp = "amph" },

    --小鱼人(黄)
    ["units\\creeps\\Murloc\\Murloc"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(橙)
    ["units\\creeps\\MurlocWarrior\\MurlocWarrior"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(绿)
    ["units\\creeps\\MurlocMutant\\MurlocMutant"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(青)
    ["Units\\Creeps\\MurgulTideWarrior\\MurgulTideWarrior"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(天蓝)
    ["units\\creeps\\MurgulSlave\\MurgulSlave"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(海蓝)
    ["units\\creeps\\MurlocFlesheater\\MurlocFlesheater"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(浅紫)
    ["Units\\Creeps\\MurgulReaver\\MurgulReaver"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(夜紫)
    ["units\\creeps\\MurlocNightcrawler\\MurlocNightcrawler"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },
    --小鱼人(蓝紫)
    ["Units\\Creeps\\MurgulShadowCaster\\MurgulShadowCaster"] = { unitSound = "Murloc", scale = 1.00, backSw1 = 0.500, dmgpt1 = 0.500, movetp = "amph" },

    --蓝幼龙
    ["units\\creeps\\AzureDragonWelp\\AzureDragonWelp"] = { unitSound = "AzureDragon", scale = 1.75, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 240 },
    --蓝龙
    ["units\\creeps\\AzureDragon\\AzureDragon"] = { unitSound = "AzureDragon", scale = 2.25, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 325 },
    --红幼龙
    ["units\\creeps\\RedDragonWelp\\RedDragonWelp"] = { unitSound = "AzureDragon", scale = 1.75, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 240 },
    --红龙
    ["units\\creeps\\RedDragon\\RedDragon"] = { unitSound = "AzureDragon", scale = 2.25, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 325 },
    --黑幼龙
    ["units\\creeps\\BlackDragonWelp\\BlackDragonWelp"] = { unitSound = "AzureDragon", scale = 1.75, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 240 },
    --黑龙
    ["units\\creeps\\BlackDragon\\BlackDragon"] = { unitSound = "AzureDragon", scale = 2.25, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 325 },
    --褐幼龙
    ["units\\creeps\\BronzeDragonWelp\\BronzeDragonWelp"] = { unitSound = "AzureDragon", scale = 1.75, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 240 },
    --褐龙
    ["units\\creeps\\BronzeDragon\\BronzeDragon"] = { unitSound = "AzureDragon", scale = 2.25, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 325 },
    --绿幼龙
    ["units\\creeps\\GreenDragonWelp\\GreenDragonWelp"] = { unitSound = "AzureDragon", scale = 1.75, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 240 },
    --绿龙
    ["units\\creeps\\GreenDragon\\GreenDragon"] = { unitSound = "AzureDragon", scale = 2.25, backSw1 = 0.560, dmgpt1 = 0.940, movetp = "fly", moveHeight = 325 },
    --耐瑟龙
    ["units\\creeps\\NetherDragon\\NetherDragon"] = { unitSound = "NetherDragon", scale = 2.00, backSw1 = 0.500, dmgpt1 = 0.400, movetp = "fly", moveHeight = 325 },
    --九头蛇怪
    ["Units\\Creeps\\Hydra\\Hydra"] = { unitSound = "AzureDragon", scale = 2.50, backSw1 = 0.500, dmgpt1 = 0.400, movetp = "fly", moveHeight = 325 },

    --小蜘蛛(紫)
    ["units\\creeps\\Spider\\Spider"] = { unitSound = "Spider", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.500 },
    --小蜘蛛(黑)
    ["units\\creeps\\SpiderBlack\\SpiderBlack"] = { unitSound = "Spider", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.500 },
    --小蜘蛛(绿)
    ["units\\creeps\\SpiderGreen\\SpiderGreen"] = { unitSound = "Spider", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.500 },
    --小蜘蛛(蓝)
    ["units\\creeps\\SpiderBlue\\SpiderBlue"] = { unitSound = "Spider", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.500 },
    --蛛网怪
    ["units\\creeps\\Nerubian\\Nerubian"] = { unitSound = "Nerubian", scale = 2.00, backSw1 = 0.360, dmgpt1 = 0.640 },
    --蛛网怪(首领)
    ["units\\creeps\\NerubianSpiderLord\\NerubianSpiderLord"] = { unitSound = "Nerubian", scale = 2.00, backSw1 = 0.360, dmgpt1 = 0.640 },
    --蛛网怪(女皇)
    ["units\\creeps\\NerubianQueen\\NerubianQueen"] = { unitSound = "Nerubian", scale = 2.00, backSw1 = 0.360, dmgpt1 = 0.640 },

    --鹰女妖
    ["units\\creeps\\Harpy\\Harpy"] = { unitSound = "Harpy", scale = 1.20, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "fly", moveHeight = 240 },
    --鹰女妖女皇
    ["units\\creeps\\HarpyQueen\\HarpyQueen"] = { unitSound = "Harpy", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "fly", moveHeight = 240 },

    --海元素
    ["Units\\Creeps\\SeaElemental\\SeaElemental"] = { unitSound = "WaterElemental", scale = 1.60, backSw1 = 0.770, dmgpt1 = 0.400, movetp = "amph" },
    --虚空假面(红)
    ["Units\\Creeps\\Unbroken\\Unbroken"] = { unitSound = "Unbroken", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --虚空假面(紫)
    ["units\\creeps\\VoidWalker\\VoidWalker"] = { unitSound = "ObsidianDestroyer", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --地狱火
    ["units\\demon\\Infernal\\Infernal"] = { unitSound = "Infernal", scale = 2.50, backSw1 = 0.740, dmgpt1 = 0.260 },
    --毁灭守卫
    ["units\\demon\\DoomGuard\\DoomGuard"] = { unitSound = "DoomGuard", scale = 2.00, backSw1 = 0.700, dmgpt1 = 0.500 },
    --刺蛇
    ["Units\\Critters\\Hydralisk\\Hydralisk"] = { unitSound = "Hydralisk", scale = 1.20, backSw1 = 0.700, dmgpt1 = 0.300 },
    --灵兽
    ["units\\creeps\\FelstalkerPurple\\FelstalkerPurple"] = { unitSound = "Felhound", scale = 1.60, backSw1 = 0.640, dmgpt1 = 0.330 },
    --淤泥怪(绿)
    ["units\\other\\DalaranReject\\DalaranReject"] = { unitSound = "SludgeMonster", scale = 1.50, backSw1 = 0.300, dmgpt1 = 0.300 },
    --淤泥怪(黑)
    ["units\\creeps\\SludgeMonster\\SludgeMonster"] = { unitSound = "SludgeMonster", scale = 1.50, backSw1 = 0.300, dmgpt1 = 0.300 },
    --岩石傀儡
    ["units\\creeps\\RockGolem\\RockGolem"] = { unitSound = "RockGolem", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --灵肉傀儡
    ["units\\other\\FleshGolem\\FleshGolem"] = { unitSound = "abomination", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --战争傀儡
    ["units\\creeps\\GolemStatue\\GolemStatue"] = { unitSound = "abomination", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --阿卡那瑟德
    ["Units\\Creeps\\Archnathid\\Archnathid"] = { unitSound = "Archnathid", scale = 1.30, backSw1 = 0.470, dmgpt1 = 0.530 },
    --阿卡那瑟德(绿)
    ["Units\\Creeps\\ArchnathidGreen\\ArchnathidGreen"] = { unitSound = "Archnathid", scale = 1.30, backSw1 = 0.470, dmgpt1 = 0.530 },
    --阿卡那瑟德(紫)
    ["Units\\Creeps\\Archnathidpurple\\Archnathidpurple"] = { unitSound = "Archnathid", scale = 2.00, backSw1 = 0.470, dmgpt1 = 0.530 },
    --强盗
    ["units\\creeps\\Bandit\\Bandit"] = { unitSound = "Bandit", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --土匪
    ["units\\creeps\\BanditSpearThrower\\BanditSpearThrower"] = { unitSound = "Bandit", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300 },
    --龙卵战士(紫)
    ["Units\\Creeps\\DragonSpawnPurple\\DragonSpawnPurple"] = { unitSound = "DragonSpawn", scale = 2.20, backSw1 = 0.300, dmgpt1 = 0.300 },
    --龙卵战士(绿)
    ["Units\\Creeps\\DragonSpawnGreen\\DragonSpawnGreen"] = { unitSound = "DragonSpawn", scale = 2.20, backSw1 = 0.300, dmgpt1 = 0.300 },
    --龙卵战士(蓝)
    ["Units\\Creeps\\DragonSpawnBlue\\DragonSpawnBlue"] = { unitSound = "DragonSpawn", scale = 2.20, backSw1 = 0.300, dmgpt1 = 0.300 },
    --半人马战士
    ["units\\creeps\\Centaur\\Centaur"] = { unitSound = "Centaur", scale = 1.85, backSw1 = 0.300, dmgpt1 = 0.300 },
    --半人马弓箭手
    ["units\\creeps\\CentaurArcher\\CentaurArcher"] = { unitSound = "CentaurArcher", scale = 1.85, backSw1 = 0.300, dmgpt1 = 0.300 },
    --半人马可汗
    ["units\\creeps\\CentaurKhan\\CentaurKhan"] = { unitSound = "Centaur", scale = 1.85, backSw1 = 0.300, dmgpt1 = 0.300 },
    --狂暴守卫(红)
    ["units\\demon\\Felgaurd\\Felgaurd"] = { unitSound = "DoomGuard", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --狂暴守卫(蓝)
    ["units\\demon\\FelgaurdBlue\\FelgaurdBlue"] = { unitSound = "DoomGuard", scale = 2.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --森林巨魔战士
    ["units\\creeps\\ForestTroll\\ForestTroll"] = { unitSound = "ForestTroll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --森林巨魔猎手
    ["units\\creeps\\ForestTrollTrapper\\ForestTrollTrapper"] = { unitSound = "ForestTroll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --森林巨魔牧师
    ["units\\creeps\\ForestTrollShadowPriest\\ForestTrollShadowPriest"] = { unitSound = "ForestTrollShadowPriest", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --暗黑巨魔战士
    ["units\\creeps\\DarkTroll\\DarkTroll"] = { unitSound = "ForestTroll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --暗黑巨魔猎手
    ["units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper"] = { unitSound = "ForestTroll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --暗黑巨魔牧师
    ["units\\creeps\\DarkTrollShadowPriest\\DarkTrollShadowPriest"] = { unitSound = "ForestTrollShadowPriest", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --冰原巨魔战士
    ["units\\creeps\\IceTroll\\IceTroll"] = { unitSound = "IceTroll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --冰原巨魔牧师
    ["units\\creeps\\IceTrollShadowPriest\\IceTrollShadowPriest"] = { unitSound = "IceTrollShadowPriest", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.400 },
    --熊怪
    ["units\\creeps\\Furbolg\\Furbolg"] = { unitSound = "Furbolg", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.400 },
    --熊猫
    ["units\\creeps\\FurbolgPanda\\FurbolgPanda"] = { unitSound = "Furbolg", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.400 },
    --熊战
    ["units\\creeps\\FurbolgElder\\FurbolgElder"] = { unitSound = "Furbolg", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.400 },
    --深海巨猎人
    ["Units\\Creeps\\SeaGiantGreen\\SeaGiantGreen"] = { unitSound = "SeaGiant", scale = 2.40, backSw1 = 0.560, dmgpt1 = 0.600 },
    --豺狼
    ["units\\creeps\\Gnoll\\Gnoll"] = { unitSound = "Gnoll", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --豺狼猎手
    ["units\\creeps\\GnollArcher\\GnollArcher"] = { unitSound = "GnollArcher", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --狗头人
    ["units\\creeps\\Kobold\\Kobold"] = { unitSound = "Kobold", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --狗头人占卜师
    ["units\\creeps\\KoboldGeomancer\\KoboldGeomancer"] = { unitSound = "Kobold", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --闪电蜥蜴(绿)
    ["units\\creeps\\ThunderLizard\\ThunderLizard"] = { unitSound = "KotoBeastNoRider", scale = 2.50, backSw1 = 0.560, dmgpt1 = 0.500, },
    --闪电蜥蜴(红)
    ["units\\creeps\\ThunderLizardSalamander\\ThunderLizardSalamander"] = { unitSound = "KotoBeastNoRider", scale = 2.50, backSw1 = 0.560, dmgpt1 = 0.500, },
    --闪电蜥蜴(紫)
    ["units\\creeps\\ThunderLizardVizier\\ThunderLizardVizier"] = { unitSound = "KotoBeastNoRider", scale = 2.50, backSw1 = 0.560, dmgpt1 = 0.500, },
    --巨虾(红)
    ["units\\creeps\\Lobstrokkred\\Lobstrokkred"] = { unitSound = "Lobstrokk", scale = 2.50, backSw1 = 0.600, dmgpt1 = 0.380, },
    --巨虾(绿)
    ["units\\creeps\\Lobstrokkgreen\\Lobstrokkgreen"] = { unitSound = "Lobstrokk", scale = 2.50, backSw1 = 0.600, dmgpt1 = 0.380, },
    --巨虾(蓝)
    ["units\\creeps\\Lobstrokkblue\\Lobstrokkblue"] = { unitSound = "Lobstrokk", scale = 2.50, backSw1 = 0.600, dmgpt1 = 0.380, },
    --猛犸
    ["Units\\Creeps\\Mammoth\\Mammoth"] = { unitSound = "Mammoth", scale = 2.25, backSw1 = 0.700, dmgpt1 = 0.500, },
    --玛格战士
    ["Units\\Creeps\\Magnataur\\Magnataur"] = { unitSound = "Magnataur", scale = 2.25, backSw1 = 0.840, dmgpt1 = 0.660, },
    --玛格娜托破坏者
    ["Units\\Creeps\\MagnataurBlue\\MagnataurBlue"] = { unitSound = "Magnataur", scale = 3.00, backSw1 = 0.840, dmgpt1 = 0.660, },
    --食人鬼战士
    ["units\\creeps\\Ogre\\Ogre"] = { unitSound = "Ogre", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --食人鬼魔法师
    ["units\\creeps\\OgreMagi\\OgreMagi"] = { unitSound = "Ogre", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --食人鬼首领
    ["units\\creeps\\OgreLord\\OgreLord"] = { unitSound = "Ogre", scale = 2.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --鹰嘴野兽
    ["units\\creeps\\Owlbear\\Owlbear"] = { unitSound = "Owlbear", scale = 1.60, backSw1 = 0.300, dmgpt1 = 0.300, },
    --北极熊
    ["units\\creeps\\PolarBear\\PolarBear"] = { unitSound = "GrizzlyBear", scale = 1.80, backSw1 = 0.670, dmgpt1 = 0.630, },
    --豪猪战士
    ["units\\creeps\\Bristleback\\Bristleback"] = { unitSound = "Bristleback", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.600, },
    --豪猪医生
    ["units\\creeps\\RazorManeChief\\RazorManeChief"] = { unitSound = "Bristleback", scale = 1.10, backSw1 = 0.300, dmgpt1 = 0.600, },
    --死亡幽魂
    ["units\\creeps\\Revenant\\Revenant"] = { unitSound = "Revenant", scale = 1.20, backSw1 = 0.300, dmgpt1 = 0.600, },
    --赛特斯刺客
    ["units\\creeps\\Satyr\\Satyr"] = { unitSound = "Satyr", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --赛特斯影法师
    ["units\\creeps\\SatyrTrickster\\SatyrTrickster"] = { unitSound = "Satyr", scale = 1.00, backSw1 = 0.300, dmgpt1 = 0.300, },
    --赛特斯地狱使者
    ["units\\creeps\\satyrhellcaller\\satyrhellcaller"] = { unitSound = "Satyr", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --女妖精(红)
    ["units\\demon\\Demoness\\Demoness"] = { unitSound = "Demoness", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330, },
    --女妖精(蓝)
    ["units\\demon\\DemonessBlue\\DemonessBlue"] = { unitSound = "Demoness", scale = 1.00, backSw1 = 0.640, dmgpt1 = 0.330, },
    --图斯卡
    ["units\\creeps\\tuskar\\tuskar"] = { unitSound = "Tuskarr", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --图斯卡枪兵
    ["units\\creeps\\tuskarRanged\\tuskarRanged"] = { unitSound = "Tuskarr", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --图斯卡法师
    ["units\\creeps\\tuskarLord\\tuskarLord"] = { unitSound = "Tuskarr", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --野人
    ["units\\creeps\\Sasquatch\\Sasquatch"] = { unitSound = "Wendigo", scale = 1.20, backSw1 = 0.300, dmgpt1 = 0.300 },
    --丛林漫步者
    ["units\\creeps\\JungleBeast\\JungleBeast"] = { unitSound = "Wendigo", scale = 1.20, backSw1 = 0.300, dmgpt1 = 0.300 },
    --雪怪
    ["units\\creeps\\Wendigo\\Wendigo"] = { unitSound = "Wendigo", scale = 1.25, backSw1 = 0.300, dmgpt1 = 0.300, },
    --灰狼
    ["units\\creeps\\TimberWolf\\TimberWolf"] = { unitSound = "SpiritWolf", scale = 1.10, backSw1 = 0.640, dmgpt1 = 0.330, },
    --白狼
    ["units\\creeps\\WhiteWolf\\WhiteWolf"] = { unitSound = "SpiritWolf", scale = 1.10, backSw1 = 0.640, dmgpt1 = 0.330, },
    --夜狼
    ["units\\creeps\\DireWolf\\DireWolf"] = { unitSound = "SpiritWolf", scale = 1.10, backSw1 = 0.640, dmgpt1 = 0.330, },

    --海豹
    ["units\\critters\\Seal\\Seal"] = { unitSound = "Seal", scale = 1.00, },
    --浣熊
    ["units\\critters\\Raccoon\\Raccoon"] = { unitSound = "Raccoon", scale = 1.00, },
    --老鼠
    ["units\\critters\\Rat\\Rat"] = { unitSound = "Rat", scale = 1.00, },
    --绵羊
    ["units\\critters\\Sheep\\Sheep"] = { unitSound = "Sheep", scale = 1.00, },
    --螃蟹
    ["units\\critters\\SpiderCrab\\SpiderCrab"] = { unitSound = "", scale = 1.00, },
    --螃蟹隐士
    ["units\\critters\\HermitCrab\\HermitCrab"] = { unitSound = "", scale = 1.00, },
    --企鹅
    ["units\\critters\\Penguin\\Penguin"] = { unitSound = "Penguin", scale = 1.00, },
    --青蛙
    ["units\\critters\\Frog\\Frog"] = { unitSound = "Frog", scale = 1.00, },
    --沙丘之虫
    ["units\\critters\\DuneWorm\\DuneWorm"] = { unitSound = "", scale = 1.00, },
    --秃鹰
    ["units\\critters\\Vulture\\Vulture"] = { unitSound = "Vulture", scale = 1.00, },
    --兔子
    ["units\\critters\\EasterRabbit\\EasterRabbit"] = { unitSound = "Rabbit", scale = 1.00, },
    --小鸡
    ["units\\critters\\EasterChicken\\EasterChicken"] = { unitSound = "Chicken", scale = 1.00, },
    --小蜥蜴
    ["units\\critters\\Skink\\Skink"] = { unitSound = "Skink", scale = 1.00, },
    --信天翁
    ["units\\critters\\Albatross\\Albatross"] = { unitSound = "Albatross", scale = 1.00, },
    --雄鹿
    ["units\\critters\\BlackStagMale\\BlackStagMale"] = { unitSound = "", scale = 1.00, },
    --雪鹰
    ["units\\critters\\SnowOwl\\SnowOwl"] = { unitSound = "SnowOwl", scale = 1.00, },
    --鬃狼
    ["units\\critters\\BrownWolf\\BrownWolf"] = { unitSound = "Wolf", scale = 1.00, },
    --豪猪
    ["units\\critters\\Felboar\\Felboar"] = { unitSound = "QuillBeast", scale = 1.00, },
    --野猪
    ["units\\critters\\Pig\\Pig"] = { unitSound = "Pig", scale = 1.00, },
    --虫族小狗
    ["Units\\Critters\\zergling\\zergling"] = { unitSound = "Zergling", scale = 1.00, },

    --人族运输船
    ["units\\creeps\\HumanTransportShip\\HumanTransportShip"] = { unitSound = "Boat", scale = 2.75, movetp = "float" },
    --人族护卫舰
    ["units\\creeps\\HumanDestroyerShip\\HumanDestroyerShip"] = { unitSound = "Boat", scale = 3.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --人族战舰
    ["units\\creeps\\HumanBattleship\\HumanBattleship"] = { unitSound = "Boat", scale = 4.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --兽族运输船
    ["units\\creeps\\OrcishTransportShip\\OrcishTransportShip"] = { unitSound = "Boat", scale = 2.75, movetp = "float" },
    --兽族护卫舰
    ["units\\creeps\\OrcishDestroyerShip\\OrcishDestroyerShip"] = { unitSound = "Boat", scale = 3.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --兽族魔力战舰
    ["Units\\Critters\\OrcJuggernaught\\OrcJuggernaught"] = { unitSound = "Boat", scale = 4.00, backSw1 = 0.700, dmgpt1 = 0.170, movetp = "float" },
    --不死族运输船
    ["units\\creeps\\UndeadTransportShip\\UndeadTransportShip"] = { unitSound = "Boat", scale = 2.75, movetp = "float" },
    --不死族护卫舰
    ["units\\creeps\\UndeadDestroyerShip\\UndeadDestroyerShip"] = { unitSound = "Boat", scale = 3.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --不死族战舰
    ["units\\creeps\\UndeadShipBattleShip\\UndeadShipBattleShip"] = { unitSound = "Boat", scale = 4.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --暗夜运输船
    ["units\\nightelf\\NightElfTransportShip\\NightElfTransportShip"] = { unitSound = "Boat", scale = 2.75, movetp = "float" },
    --暗夜护卫舰
    ["units\\nightelf\\NightElfDestroyerShip\\NightElfDestroyerShip"] = { unitSound = "Boat", scale = 3.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --暗夜战舰
    ["units\\creeps\\NightElfBattleship\\NightElfBattleship"] = { unitSound = "Boat", scale = 4.00, backSw1 = 0.300, dmgpt1 = 0.300, movetp = "float" },
    --战船
    ["doodads\\northrend\\water\\Battleship\\Battleship"] = { unitSound = "Boat", scale = 2.75, backSw1 = 0.700, dmgpt1 = 0.170, },
    --不死族飞艇
    ["units\\undead\\UndeadAirBarge\\UndeadAirBarge"] = { unitSound = "", scale = 2.00, },
    --精灵车
    ["units\\other\\BloodElfWagon\\BloodElfWagon"] = { unitSound = "", scale = 2.50 },
    --囚车
    ["units\\other\\IllidanEvilCaged\\IllidanEvilCaged"] = { unitSound = "PrisonWagon", scale = 2.50 },
    --达拉内尔粉碎者
    ["units\\orc\\catapult\\catapult"] = { unitSound = "Catapult", scale = 2.75, backSw1 = 1.900, dmgpt1 = 0.100, },
    --地狱机关人
    ["units\\creeps\\InfernalCannonCannon\\InfernalCannonCannon"] = { unitSound = "InfernalMachine", scale = 2.50, backSw1 = 0.800, dmgpt1 = 0.500, },
    --地狱战舰
    ["units\\creeps\\InfernalCannonFlame\\InfernalCannonFlame"] = { unitSound = "InfernalMachine", scale = 3.00, backSw1 = 0.800, dmgpt1 = 0.500, },
    --地精地雷
    ["units\\creeps\\GoblinLandMine\\GoblinLandMine"] = { unitSound = "GoblinLandMine", scale = 0.75, },
    --地精飞艇
    ["units\\creeps\\GoblinZeppelin\\GoblinZeppelin"] = { unitSound = "GoblinZeppelin", scale = 1.50, movetp = "fly", moveHeight = 280 },
    --地精工兵
    ["units\\creeps\\GoblinSapper\\GoblinSapper"] = { unitSound = "GoblinSapper", scale = 1.00, },
    --地精撕裂者
    ["units\\creeps\\IronGolem\\IronGolem"] = { unitSound = "IronGolem", scale = 1.75, backSw1 = 0.600, dmgpt1 = 0.300, },

    --马里恩(冲锋枪小哥)
    ["Units\\Critters\\Marine\\Marine"] = { unitSound = "TerranMarine", scale = 1.00, backSw1 = 0.700, dmgpt1 = 0.170 },
    --邪恶空间兽人(冲锋枪兽人)
    ["Units\\Critters\\ChaosSpaceOrc\\ChaosSpaceOrc"] = { unitSound = "ChaosSpaceOrc", scale = 1.00, backSw1 = 0.700, dmgpt1 = 0.170 },
    --村民男1
    ["units\\critters\\VillagerMan\\VillagerMan"] = { unitSound = "VillagerMan", scale = 1.00, },
    --村民男2
    ["units\\critters\\VillagerMan1\\VillagerMan1"] = { unitSound = "VillagerMan2", scale = 1.00, },
    --村民女1
    ["units\\critters\\VillagerWoman\\VillagerWoman"] = { unitSound = "VillagerWoman", scale = 1.00, },
    --村民小孩1
    ["units\\critters\\VillagerKid\\VillagerKid"] = { unitSound = "VillagerKid", scale = 0.75, },
    --村民小孩2
    ["units\\critters\\VillagerKid1\\VillagerKid1"] = { unitSound = "VillagerKid", scale = 0.75, },
}             --原生资源
--根据需要自行注释或补充

--【 音效 】

_assets_sound('voice/war3/MouseClick1', 'war3_click1', 'vcm')
_assets_sound('voice/war3/Error', 'war3_error', 'vcm')
_assets_sound('voice/war3/HeroDropItem1', 'war3_dropItem', 'vcm')
_assets_sound('voice/war3/PickUpItem', 'war3_pickItem', 'vcm')
_assets_sound('voice/war3/ReceiveGold', 'war3_receiveGold', 'vcm')
_assets_sound('voice/war3/BundleOfLumber', 'war3_BundleOfLumber', 'vcm')

--【 箭矢模型 】

--毒球
_assets_model(":Abilities\\Spells\\Items\\OrbVenom\\OrbVenomMissile.mdl", "OrbVenomMissile")
--腐球
_assets_model(":Abilities\\Spells\\Items\\OrbCorruption\\OrbCorruptionMissile.mdl", "OrbCorruptionMissile")
--冰球 巫妖
_assets_model(":Abilities\\Weapons\\LichMissile\\LichMissile.mdl", "LichMissile")
--减速之球
_assets_model(":Abilities\\Weapons\\ProcMissile\\ProcMissile.mdl", "ProcMissile")
--火球 大法
_assets_model(":Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", "FireBallMissile")
--电球 先知
_assets_model(":Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", "FarseerMissile")
--血法火球
_assets_model(":Abilities\\Weapons\\BloodElfMissile\\BloodElfMissile.mdl", "BloodElfMissile")
--迫击炮小队
_assets_model(":Abilities\\Weapons\\Mortar\\MortarMissile.mdl", "MortarMissile")
--狮鹫
_assets_model(":Abilities\\Weapons\\GryphonRiderMissile\\GryphonRiderMissile.mdl", "GryphonRiderMissile")
--蒸汽机车
_assets_model(":Abilities\\Weapons\\SteamTank\\SteamTankImpact.mdl", "SteamTankImpact")
--魔法破坏者
_assets_model(":Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", "BloodElfSpellThiefMissile")
--牧师
_assets_model(":Abilities\\Weapons\\PriestMissile\\PriestMissile.mdl", "PriestMissile")
--女巫
_assets_model(":Abilities\\Weapons\\SorceressMissile\\SorceressMissile.mdl", "SorceressMissile")
--龙鹰
_assets_model(":Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl", "DragonHawkMissile")
--凤凰火焰
_assets_model(":Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl", "PhoenixMissile")
--凤凰火焰(小)
_assets_model(":Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", "PhoenixMissileMini")
--箭塔
_assets_model(":Abilities\\Weapons\\GuardTowerMissile\\GuardTowerMissile.mdl", "GuardTowerMissile")
--炮塔
_assets_model(":Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl", "CannonTowerMissile")
--神秘之塔
_assets_model(":Abilities\\Spells\\Undead\\OrbOfDeath\\OrbOfDeathMissile.mdl", "OrbOfDeathMissile")
--暗影猎手
_assets_model(":Abilities\\Weapons\\ShadowHunterMissile\\ShadowHunterMissile.mdl", "ShadowHunterMissile")
--巨魔猎头
_assets_model(":abilities\\weapons\\huntermissile\\huntermissile.mdl", "hunterMissile")
--粉碎者
_assets_model(":abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", "DemolisherMissile")
--风骑士
_assets_model(":abilities\\weapons\\WyvernSpear\\WyvernSpearMissile.mdl", "WyvernSpearMissile")
--蝙蝠骑士
_assets_model(":Abilities\\Weapons\\BatTrollMissile\\BatTrollMissile.mdl", "BatTrollMissile")
--巨魔巫医
_assets_model(":Abilities\\Weapons\\WitchDoctorMissile\\WitchDoctorMissile.mdl", "WitchDoctorMissile")
--老鹿
_assets_model(":Abilities\\Weapons\\KeeperGroveMissile\\KeeperGroveMissile.mdl", "KeeperGroveMissile")
--白虎箭
_assets_model(":Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl", "MoonPriestessMissile")
--恶魔猎手混沌
_assets_model(":Abilities\\Weapons\\DemonHunterMissile\\DemonHunterMissile.mdl", "DemonHunterMissile")
--箭
_assets_model(":Abilities\\Weapons\\Arrow\\ArrowMissile.mdl", "ArrowMissile")
--猎手刀
_assets_model(":Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl", "SentinelMissile")
--树妖
_assets_model(":Abilities\\Weapons\\Dryadmissile\\Dryadmissile.mdl", "DryadMissile")
--投刃车
_assets_model(":Abilities\\Weapons\\GlaiveMissile\\GlaiveMissile.mdl", "GlaiveMissile")
--奇美拉
_assets_model(":Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl", "ChimaeraAcidMissile")
--德鲁伊
_assets_model(":Abilities\\Weapons\\DruidoftheTalonMissile\\DruidoftheTalonMissile.mdl", "DruidoftheTalonMissile")
--精灵龙
_assets_model(":Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl", "FaerieDragonMissile")
--远古守卫树
_assets_model(":Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", "AncientProtectorMissile")
--复仇天神
_assets_model(":Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl", "SpiritOfVengeanceMissile")
--复仇之魂
_assets_model(":Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl", "VengeanceMissile")
--幽魂之塔
_assets_model(":Abilities\\Weapons\\ZigguratMissile\\ZigguratMissile.mdl", "ZigguratMissile")
--蛛网之塔
_assets_model(":Abilities\\Weapons\\ZigguratFrostMissile\\ZigguratFrostMissile.mdl", "ZigguratFrostMissile")
--绞肉车
_assets_model(":Abilities\\Weapons\\MeatwagonMissile\\MeatwagonMissile.mdl", "MeatWagonMissile")
--不死蜘蛛
_assets_model(":Abilities\\Weapons\\CryptFiendMissile\\CryptFiendMissile.mdl", "CryptFiendMissile")
--石像鬼
_assets_model(":Abilities\\Weapons\\GargoyleMissile\\GargoyleMissile.mdl", "GargoyleMissile")
--女妖
_assets_model(":Abilities\\Weapons\\BansheeMissile\\BansheeMissile.mdl", "BansheeMissile")
--不死族巫师
_assets_model(":Abilities\\Weapons\\NecromancerMissile\\NecromancerMissile.mdl", "NecromancerMissile")
--冰霜巨龙
_assets_model(":Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", "FrostWyrmMissile")
--骷髅魔法师
_assets_model(":Abilities\\Weapons\\SkeletalMageMissile\\SkeletalMageMissile.mdl", "SkeletalMageMissile")
--美杜莎
_assets_model(":Abilities\\Weapons\\NagaArrowMissile\\NagaArrowMissile.mdl", "NagaArrowMissile")
--娜迦飞蛇
_assets_model(":Abilities\\Weapons\\WingedSerpentMissile\\WingedSerpentMissile.mdl", "WingedSerpentMissile")
--飞龙
_assets_model(":Abilities\\Weapons\\snapMissile\\snapMissile.mdl", "SnapMissile")
--水元素
_assets_model(":Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl", "WaterElementalMissile")
--海元素
_assets_model(":Abilities\\Weapons\\SeaElementalMissile\\SeaElementalMissile.mdl", "SeaElementalMissile")
--红龙
_assets_model(":Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl", "RedDragonMissile")
--绿龙
_assets_model(":Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl", "GreenDragonMissile")
--耐瑟龙
_assets_model(":Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", "AvengerMissile")
--火焰巨魔
_assets_model(":Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl", "LordofFlameMissile")
--酒仙炼金酒瓶
_assets_model(":Abilities\\Weapons\\BrewmasterMissile\\BrewmasterMissile.mdl", "BrewmasterMissile")
--魔法盗取
_assets_model(":Abilities\\Spells\\Human\\SpellSteal\\SpellStealMissile.mdl", "SpellStealMissile")
--风暴之锤
_assets_model(":Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl", "StormBoltMissile")
--燃烧之油
_assets_model(":Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", "DemolisherFireMissile")
--诱捕网
_assets_model(":Abilities\\Spells\\Orc\\Ensnare\\EnsnareMissile.mdl", "EnsnareMissile")
--镜像
_assets_model(":Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageMissile.mdl", "MirrorImageMissile")
--震荡波
_assets_model(":Abilities\\Spells\\Orc\\Shockwave\\ShockwaveMissile.mdl", "ShockwaveMissile")
--冰冻喷吐
_assets_model(":Abilities\\Spells\\Undead\\FreezingBreath\\FreezingBreathMissile.mdl", "FreezingBreathMissile")
--毁灭之球
_assets_model(":Abilities\\Spells\\Undead\\OrbOfDeath\\AnnihilationMissile.mdl", "AnnihilationMissile")
--吸收魔法
_assets_model(":Abilities\\Spells\\Undead\\AbsorbMana\\AbsorbManaBirthMissile.mdl", "AbsorbManaBirthMissile")
--占据
_assets_model(":Abilities\\Spells\\Undead\\Possession\\PossessionMissile.mdl", "PossessionMissile")
--蛛网
_assets_model(":Abilities\\Spells\\Undead\\Web\\Webmissile.mdl", "WebMissile")
--穴居恶魔蜘蛛
_assets_model(":Abilities\\Weapons\\CryptFiendMissile\\CryptFiendMissileTarget.mdl", "CryptFiendMissileTarget")
--穿刺
_assets_model(":Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl", "ImpaleMissTarget")
--腐臭蜂群
_assets_model(":Abilities\\Spells\\Undead\\CarrionSwarm\\CarrionSwarmMissile.mdl", "CarrionSwarmMissile")
--死亡缠绕
_assets_model(":Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilMissile.mdl", "DeathCoilMissile")
--暗影突袭
_assets_model(":Abilities\\Spells\\NightElf\\shadowstrike\\ShadowStrikeMissile.mdl", "ShadowStrikeMissile")
--刀阵旋风
_assets_model(":Abilities\\Spells\\NightElf\\FanOfKnives\\FanOfKnivesMissile.mdl", "FanOfKnivesMissile")
--复仇之魂白球
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceBirthMissile.mdl", "SpiritOfVengeanceBirthMissile")
--灼热之箭
_assets_model(":Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl", "SearingArrowMissile")
--冰冻冷箭
_assets_model(":Abilities\\Weapons\\ColdArrow\\ColdArrowMissile.mdl", "ColdArrowMissile")
--黑暗之箭
_assets_model(":Abilities\\Spells\\Other\\BlackArrow\\BlackArrowMissile.mdl", "BlackArrowMissile")
--冲击波 水浪
_assets_model(":Abilities\\Spells\\Other\\CrushingWave\\CrushingWaveMissile.mdl", "CrushingWaveMissile")
--刚毛飞射
_assets_model(":Abilities\\Weapons\\QuillSprayMissile\\QuillSprayMissile.mdl", "QuillSprayMissile")
--火焰呼吸
_assets_model(":Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireMissile.mdl", "BreathOfFireMissile")
--霜冻呼吸
_assets_model(":Abilities\\Spells\\Other\\BreathOfFrost\\BreathOfFrostMissile.mdl", "BreathOfFrostMissile")
--窃取生命 类似石像鬼但带白光
_assets_model(":Abilities\\Spells\\Items\\WandOfNeutralization\\NeutralizationMissile.mdl", "NeutralizationMissile")
--霜冻闪电 冰块
_assets_model(":Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", "FrostBoltMissile")
--投石 石块
_assets_model(":Abilities\\Weapons\\RockBoltMissile\\RockBoltMissile.mdl", "RockBoltMissile")
--点金术 金瓶子
_assets_model(":Abilities\\Spells\\Other\\Transmute\\GoldBottleMissile.mdl", "GoldBottleMissile")
--酸性炸弹 玻璃瓶子
_assets_model(":Abilities\\Spells\\Other\\AcidBomb\\BottleMissile.mdl", "BottleMissile")
--火焰瓶
_assets_model(":Abilities\\Spells\\Orc\\LiquidFire\\BatRiderMissile.mdl", "BatRiderMissile")
--医疗气雾 金色液体
_assets_model(":Abilities\\Spells\\Other\\HealingSpray\\HealBottleMissile.mdl", "HealBottleMissile")
--火箭群
_assets_model(":Abilities\\Spells\\Other\\TinkerRocket\\TinkerRocketMissile.mdl", "TinkerRocketMissile")
--惊吓 犀牛
_assets_model(":Abilities\\Spells\\Other\\Stampede\\StampedeMissile.mdl", "StampedeMissile")
--口袋工厂 神奇箱子
_assets_model(":Units\\Creeps\\HeroTinkerFactory\\HeroTinkerFactoryMissle.mdl", "HeroTinkerFactoryMissle")
--炎魔 炎魔滚滚
_assets_model(":Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnBirthMissile.mdl", "LavaSpawnBirthMissile")
--火山爆发 岩石块
_assets_model(":Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl", "VolcanoMissile")
--巨箭
_assets_model(":Abilities\\Weapons\\BallistaMissile\\BallistaMissile.mdl", "BallistaMissile")
--燃烧之箭
_assets_model(":Abilities\\Weapons\\flamingArrow\\flamingArrowMissile.mdl", "FlamingArrowMissile")
--沙尘
_assets_model(":Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl", "TreantMissile")
--圣光弹
_assets_model(":Abilities\\Spells\\Human\\HolyBolt\\HolyBoltMissile.mdl", "HolyBoltMissile")
--蒸汽弹
_assets_model(":Abilities\\Weapons\\SteamMissile\\SteamMissile.mdl", "SteamMissile")
--毒箭
_assets_model(":Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", "PoisonArrowMissile")
--长枪
_assets_model(":Abilities\\Weapons\\Banditmissile\\Banditmissile.mdl", "BanditMissile")
--毒蛇守卫
_assets_model(":Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl", "SerpentWardMissile")

--【 技能特效 】

--眩晕 蓝
_assets_model(":Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl", "ThunderclapTarget")
--眩晕 红
_assets_model(":Abilities\\Spells\\Orc\\StasisTrap\\StasisTotemTarget.mdl", "StasisTotemTarget")
--黄色大叹号
_assets_model(":Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl", "TalkToMe")
--白色问号
_assets_model(":Objects\\RandomObject\\RandomObject.mdl", "RandomObject")
--沉默 叹号
_assets_model(":Abilities\\Spells\\Other\\Silence\\SilenceTarget.mdl", "SilenceTarget")
--建筑小火 0
_assets_model(":Environment\\SmallBuildingFire\\SmallBuildingFire0.mdl", "SmallBuildingFire0")
--建筑小火 1
_assets_model(":Environment\\SmallBuildingFire\\SmallBuildingFire1.mdl", "SmallBuildingFire1")
--建筑小火 2
_assets_model(":Environment\\SmallBuildingFire\\SmallBuildingFire2.mdl", "SmallBuildingFire2")
--建筑大火 0
_assets_model(":Environment\\LargeBuildingFire\\LargeBuildingFire0.mdl", "LargeBuildingFire0")
--建筑大火 1
_assets_model(":Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", "LargeBuildingFire1")
--建筑大火 2
_assets_model(":Environment\\LargeBuildingFire\\LargeBuildingFire2.mdl", "LargeBuildingFire2")
--生命恢复 环环 黄
_assets_model(":Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", "RejuvenationTarget")
--生命恢复 环环 绿紫
_assets_model(":Abilities\\Spells\\Items\\ScrollOfRejuvenation\\ScrollManaHealth.mdl", "ScrollManaHealth")
--生命恢复 环环 青蓝
_assets_model(":Abilities\\Spells\\Items\\ClarityPotion\\ClarityTarget.mdl", "ClarityTarget")
--回复魔法 金条金光
_assets_model(":Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", "AIheTarget")
--回复魔法 蓝条蓝光
_assets_model(":Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl", "AImaTarget")
--回复状态 紫条紫光
_assets_model(":Abilities\\Spells\\Items\\AIre\\AIreTarget.mdl", "AIreTarget")
--回复生命 黄裂缝扩散
_assets_model(":Abilities\\Spells\\Undead\\ReplenishHealth\\ReplenishHealthCaster.mdl", "ReplenishHealthCaster")
--回复魔法 蓝圈扩散
_assets_model(":Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCaster.mdl", "ReplenishManaCaster")
--状态提升 黄色
_assets_model(":Abilities\\Spells\\Items\\AIem\\AIemTarget.mdl", "AIemTarget")
--状态提升 金色
_assets_model(":Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", "AIlmTarget")
--状态提升 黄橙色
_assets_model(":Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", "AIsmTarget")
--状态提升 红色
_assets_model(":Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", "AIamTarget")
--状态提升 黄紫色
_assets_model(":Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", "AIimTarget")
--神圣护甲 无敌 金色球盾
_assets_model(":Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl", "DivineShieldTarget")

--变羊 羊坠落
_assets_model(":Abilities\\Spells\\Human\\Polymorph\\PolyMorphFallingSheepArt.mdl", "PolyMorphFallingSheepArt")
--变羊 云雾
_assets_model(":Abilities\\Spells\\Human\\Polymorph\\PolyMorphDoneGround.mdl", "PolyMorphDoneGround")
--防御 开盾
_assets_model(":Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", "DefendCaster")
--魔法护盾 开盾 青
_assets_model(":Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl", "SpellShieldCaster")
--减速 黄下降
_assets_model(":Abilities\\Spells\\Human\\Slow\\SlowCaster", "SlowCaster")
--减速 黄内聚
_assets_model(":Abilities\\Spells\\Human\\slow\\slowtarget.mdl", "SlowTarget")
--空中枷锁 网
_assets_model(":Abilities\\Spells\\Human\\AerialShackles\\AerialShacklesTarget.mdl", "AerialShacklesTarget")
--控制魔法 蓝眼
_assets_model(":Abilities\\Spells\\Human\\ControlMagic\\ControlMagicTarget.mdl", "ControlMagicTarget")
--控制魔法 红烟
_assets_model(":Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", "FeralSpiritDone")
--魔法盗取 幻色
_assets_model(":Abilities\\Spells\\Human\\SpellSteal\\SpellStealTarget.mdl", "SpellStealTarget")
--魔法岗哨 蓝眼
_assets_model(":Abilities\\Spells\\Human\\MagicSentry\\MagicSentryCaster.mdl", "MagicSentryCaster")
--魔法回应 红
_assets_model(":Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl", "SpellBreakerAttack")
--魔法回应 紫
_assets_model(":Abilities\\Spells\\Human\\Feedback\\ArcaneTowerAttack.mdl", "ArcaneTowerAttack")
--血法球体
_assets_model(":Units\\Human\\HeroBloodElf\\BloodElfBall.mdl", "BloodElfBall")
--驱逐魔法 白
_assets_model(":Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl", "DispelMagicTarget")
--驱逐魔法 绿火
_assets_model(":Abilities\\Spells\\Human\\Banish\\BanishTarget.mdl", "BanishTarget")
--碎片攻击 爆破
_assets_model(":Abilities\\Weapons\\FlyingMachine\\FlyingMachineImpact.mdl", "FlyingMachineImpact")
--显示 光球
_assets_model(":Abilities\\Spells\\Items\\AIta\\CrystalBallCaster.mdl", "CrystalBallCaster")
--医疗 闪光
_assets_model(":Abilities\\Spells\\Human\\Heal\\HealTarget.mdl", "HealTarget")
--心灵之火 王冠
_assets_model(":Abilities\\Spells\\Human\\InnerFire\\InnerFireTarget.mdl", "InnerFireTarget")
--隐身 白
_assets_model(":Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", "InvisibilityTarget")
--乌云 蓝色
_assets_model(":Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl", "CloudOfFog")
--照明弹 上天
_assets_model(":Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl", "FlareCaster")
--照明弹 烟花
_assets_model(":Abilities\\Spells\\Human\\Flare\\FlareTarget.mdl", "FlareTarget")
--暴风雪 霜冻
_assets_model(":Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl", "FrostDamage")
--暴风雪 天降冰块
_assets_model(":Abilities\\Spells\\Human\\Blizzard\\BlizzardTarget.mdl", "BlizzardTarget")
--复活 光柱
_assets_model(":Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", "ResurrectTarget")
--复活 天使
_assets_model(":Abilities\\Spells\\Human\\Resurrect\\ResurrectCaster.mdl", "ResurrectCaster")
--火凤凰 天降火焰冲击
_assets_model(":Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", "MarkOfChaosTarget")
--火凤凰 灼烧
_assets_model(":Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl", "BreathOfFireDamage")
--雷霆一击 震地
_assets_model(":Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", "ThunderClapCaster")
--烈焰风暴 地面
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeTarget.mdl", "FlameStrikeTarget")
--烈焰风暴 灼烧
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeDamageTarget.mdl", "FlameStrikeDamageTarget")
--烈焰风暴 灼烧红
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl", "FlameStrikeEmbers")
--烈焰风暴 火柱0|1|2
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrike.mdl", "FlameStrike")
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrike1.mdl", "FlameStrike1")
_assets_model(":Abilities\\Spells\\Human\\FlameStrike\\FlameStrike2.mdl", "FlameStrike2")
--魔法汲取 收敛
_assets_model(":Abilities\\Spells\\Other\\Drain\\ManaDrainTarget.mdl", "ManaDrainTarget")
--魔法汲取 发散
_assets_model(":Abilities\\Spells\\Other\\Drain\\ManaDrainCaster.mdl", "ManaDrainCaster")
--生命汲取 收敛
_assets_model(":Abilities\\Spells\\Other\\Drain\\DrainTarget.mdl", "DrainTarget")
--生命汲取 发散
_assets_model(":Abilities\\Spells\\Other\\Drain\\DrainCaster.mdl", "DrainCaster")
--群体传送 上天
_assets_model(":Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", "MassTeleportTarget")
--群体传送 下来
_assets_model(":Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", "MassTeleportCaster")
--群体传送 目标传送阵
_assets_model(":Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTo.mdl", "MassTeleportTo")
--神圣之光
_assets_model(":Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", "HolyBoltSpecialArt")
--净化 紫色脉冲
_assets_model(":Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", "PurgeBuffTarget")
--灵魂锁链 橙色光斑
_assets_model(":Abilities\\Spells\\Orc\\SpiritLink\\SpiritLinkZapTarget.mdl", "SpiritLinkZapTarget")
--灵肉形态 黄色鬼魂
_assets_model(":Abilities\\Spells\\Orc\\EtherealForm\\SpiritWalkerChange.mdl", "SpiritWalkerChange")
--吞噬 黑墨溅射
_assets_model(":Abilities\\Spells\\Orc\\Devour\\DevourEffectArt.mdl", "DevourEffectArt")
--先祖灵魂 复活光柱带墓碑
_assets_model(":Abilities\\Spells\\Orc\\Reincarnation\\ReincarnationTarget.mdl", "ReincarnationTarget")
--消魔 黄色光刺散射
_assets_model(":Abilities\\Spells\\Orc\\Disenchant\\DisenchantSpecialArt.mdl", "DisenchantSpecialArt")
--镜像 剑圣抖动
_assets_model(":Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl", "MirrorImageCaster")
--升级 金色光芒
_assets_model(":Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl", "LevelupCaster")
--闪电链 淡蓝紫电击
_assets_model(":Abilities\\Weapons\\Bolt\\BoltImpact.mdl", "BoltImpact")
--治疗波 金光
_assets_model(":Abilities\\Spells\\Orc\\HealingWave\\HealingWaveTarget.mdl", "HealingWaveTarget")
--战争践踏 震动
_assets_model(":Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", "WarStompCaster")
--地震 地裂
_assets_model(":Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", "EarthQuakeTarget")
--巫毒 红圈球
_assets_model(":Abilities\\Spells\\Orc\\Voodoo\\VoodooAuraTarget.mdl", "VoodooAuraTarget")
--巫毒 十字阵法
_assets_model(":Abilities\\Spells\\Orc\\Voodoo\\VoodooAura.mdl", "VoodooAura")
--狂战士 狂热左手
_assets_model(":Abilities\\Spells\\Orc\\TrollBerserk\\HeadhunterWEAPONSLeft.mdl", "HeadhunterWeaponsLeft")
--狂战士 狂热右手
_assets_model(":Abilities\\Spells\\Orc\\TrollBerserk\\HeadhunterWEAPONSRight.mdl", "HeadhunterWeaponsRight")
--灵魂锁链 双旋橙圈
_assets_model(":Abilities\\Spells\\Orc\\SpiritLink\\SpiritLinkTarget.mdl", "SpiritLinkTarget")
--闪电护盾 三蓝色电球
_assets_model(":Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl", "LightningShieldTarget")
--嗜血术 血球
_assets_model(":Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl", "BloodLustTarget")
--嗜血术 血球2
_assets_model(":Abilities\\Spells\\Orc\\Bloodlust\\BloodLustSpecial.mdl", "BloodLustSpecial")
--液体炸弹 中空火圈
_assets_model(":Abilities\\Spells\\Orc\\LiquidFire\\Liquidfire.mdl", "LiquidFire")
--诱捕 地面网
_assets_model(":Abilities\\Spells\\Orc\\Ensnare\\ensnareTarget.mdl", "ensnareTarget")
--诱捕 空中网
_assets_model(":Abilities\\Spells\\Orc\\Ensnare\\ensnare_AirTarget.mdl", "ensnareTargetAir")
--创建尸体 墓碑出土
_assets_model(":Abilities\\Spells\\Undead\\Graveyard\\GraveMarker.mdl", "GraveMarker")
--复活死尸 骸骨出土
_assets_model(":Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", "RaiseSkeleton")
--吞噬魔法 小小紫光
_assets_model(":Abilities\\Spells\\Undead\\DevourMagic\\DevourMagicBirthMissile.mdl", "DevourMagicBirthMissile")
--穿刺 插上天
_assets_model(":Abilities\\Spells\\Undead\\Impale\\ImpaleHitTarget.mdl", "ImpaleHitTarget")
--霜冻护甲 冰雾球甲
_assets_model(":Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorTarget.mdl", "FrostArmorTarget")
--睡眠 zzZ
_assets_model(":Abilities\\Spells\\Undead\\Sleep\\SleepTarget.mdl", "SleepTarget")
--死亡凋零 紫鬼火
_assets_model(":Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayDamage.mdl", "DeathandDecayDamage")
--死亡凋零 黑紫侵蚀
_assets_model(":Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl", "DeathandDecayTarget")
--冰冻喷吐 结冰
_assets_model(":Abilities\\Spells\\Undead\\FreezingBreath\\FreezingBreathTargetArt.mdl", "FreezingBreathTargetArt")
--残废 虹色幻光
_assets_model(":Abilities\\Spells\\Undead\\Cripple\\CrippleTarget.mdl", "CrippleTarget")
--反魔法护盾 绿
_assets_model(":Abilities\\Spells\\Undead\\AntiMagicShell\\AntiMagicShell.mdl", "AntiMagicShell")
--魔法护盾 蓝绿
_assets_model(":Abilities\\Spells\\Human\\ManaShield\\ManaShieldCaster.mdl", "ManaShieldCaster")
--反召唤
_assets_model(":Abilities\\Spells\\Undead\\Unsummon\\UnsummonTarget.mdl", "UnSummonTarget")
--疾病云雾 黄绿烟
_assets_model(":Units\\Undead\\PlagueCloud\\PlagueCloudtarget.mdl", "PlagueCloudTarget")
--邪恶狂热 发光白云
_assets_model(":Abilities\\Spells\\Undead\\UnholyFrenzy\\UnholyFrenzyTarget.mdl", "UnholyFrenzyTarget")
--占据 虚空紫小型漩涡
_assets_model(":Abilities\\Spells\\Undead\\Possession\\PossessionTarget.mdl", "PossessionTarget")
--占据 虚空紫擎天漩涡
_assets_model(":Abilities\\Spells\\Undead\\Possession\\PossessionCaster.mdl", "PossessionCaster")
--蛛网 网地面
_assets_model(":Abilities\\Spells\\Undead\\Web\\WebTarget.mdl", "WebTarget")
--蛛网 网空中
_assets_model(":Abilities\\Spells\\Undead\\Web\\Web_AirTarget.mdl", "WebTargetAir")
--诅咒 紫色X骷髅头
_assets_model(":Abilities\\Spells\\Undead\\Curse\\CurseTarget.mdl", "CurseTarget")
--操纵死尸 绿色柱体上升
_assets_model(":Abilities\\Spells\\Undead\\AnimateDead\\AnimateDeadTarget.mdl", "AnimateDeadTarget")
--地狱火 砸
_assets_model(":Units\\Demon\\Infernal\\InfernalBirth.mdl", "InfernalBirth")
--腐臭蜂群 黑色
_assets_model(":Abilities\\Spells\\Undead\\CarrionSwarm\\CarrionSwarmDamage.mdl", "CarrionSwarmDamage")
--黑暗仪式 绿紫光
_assets_model(":Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl", "DarkRitualTarget")
--霜冻新星 爆
_assets_model(":Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", "FrostNovaTarget")
--死亡契约 紫色上升螺旋
_assets_model(":Abilities\\Spells\\Undead\\DeathPact\\DeathPactTarget.mdl", "DeathPactTarget")
--小精灵自爆 扩散
_assets_model(":Units\\NightElf\\Wisp\\WispExplode.mdl", "WispExplode")
--变相移动 迷雾
_assets_model(":Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl", "FaerieDragonInvis")
--小精灵采集 绿条绕圈
_assets_model(":Abilities\\Spells\\NightElf\\TargetArtLumber\\TargetArtLumber.mdl", "TargetArtLumber")
--嘲讽 浅蓝吼
_assets_model(":Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl", "TauntCaster")
--咆哮 赤红吼
_assets_model(":Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl", "RoarCaster")
--咆哮 熊掌
_assets_model(":Abilities\\Spells\\NightElf\\BattleRoar\\RoarTarget.mdl", "RoarTarget")
--恐怖吼叫 紫色吼
_assets_model(":Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl", "HowlCaster")
--球体 白色条形紫色踪迹1-6
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs1.mdl", "SpiritOfVengeanceOrbs1")
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs2.mdl", "SpiritOfVengeanceOrbs2")
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs3.mdl", "SpiritOfVengeanceOrbs3")
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs4.mdl", "SpiritOfVengeanceOrbs4")
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs5.mdl", "SpiritOfVengeanceOrbs5")
_assets_model(":Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceOrbs6.mdl", "SpiritOfVengeanceOrbs6")
--暗影突袭 黑小鬼
_assets_model(":Abilities\\Spells\\NightElf\\shadowstrike\\shadowstrike.mdl", "ShadowStrike")
--刀阵旋风 三方刀阵
_assets_model(":Abilities\\Spells\\NightElf\\FanOfKnives\\FanOfKnivesCaster.mdl", "FanOfKnivesCaster")
--法力燃烧 绿团
_assets_model(":Abilities\\Spells\\NightElf\\ManaBurn\\ManaBurnTarget.mdl", "ManaBurnTarget")
--闪烁 起
_assets_model(":Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl", "BlinkCaster")
--闪烁 达
_assets_model(":Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", "BlinkTarget")
--纠缠根须
_assets_model(":Abilities\\Spells\\NightElf\\EntanglingRoots\\EntanglingRootsTarget.mdl", "EntanglingRootsTarget")
--宁静 绿气场
_assets_model(":Abilities\\Spells\\NightElf\\Tranquility\\TranquilityTarget.mdl", "TranquilityTarget")
--宁静 绿雨
_assets_model(":Abilities\\Spells\\NightElf\\Tranquility\\Tranquility.mdl", "Tranquility")
--群星坠落 砸
_assets_model(":Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl", "StarFallTarget")
--群星坠落 月星法阵
_assets_model(":Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl", "StarFallCaster")
--献祭 绿火
_assets_model(":Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl", "ImmolationDamage")
--献祭 绿火圈
_assets_model(":Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl", "ImmolationTarget")
--献祭永久的 红火圈
_assets_model(":Abilities\\Spells\\Other\\ImmolationRed\\ImmolationRedTarget.mdl", "ImmolationRedTarget")
--腐蚀喷吐 弧形溅射
_assets_model(":Abilities\\Spells\\NightElf\\CorrosiveBreath\\ChimaeraAcidTargetArt.mdl", "ChimaeraAcidTargetArt")
--精灵之火 几只金色精灵
_assets_model(":Abilities\\Spells\\NightElf\\FaerieFire\\FaerieFireTarget.mdl", "FaerieFireTarget")
--飓风 黑色龙卷
_assets_model(":Abilities\\Spells\\NightElf\\Cyclone\\CycloneTarget.mdl", "CycloneTarget")
--龙卷风 灰白色龙卷
_assets_model(":Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl", "TornadoElementalSmall")
--龙卷风 小小风圈
_assets_model(":Abilities\\Spells\\Other\\Tornado\\Tornado_Target.mdl", "TornadoTarget")
--慢性毒药 绿色小圈扩散
_assets_model(":Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", "PoisonStingTarget")
--魔力之焰 草绿小球
_assets_model(":Abilities\\Spells\\Human\\ManaFlare\\ManaFlareBase.mdl", "ManaFlareBase")
--魔力之焰 草绿闪电
_assets_model(":Abilities\\Spells\\Human\\ManaFlare\\ManaFlareBoltImpact.mdl", "ManaFlareBoltImpact")
--符咒 蓝色光条飞舞聚集
_assets_model(":Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", "CharmTarget")
--死亡之指 红电
_assets_model(":Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl", "DemonBoltImpact")
--分裂 绿扩散
_assets_model(":Abilities\\Spells\\Other\\Cleave\\CleaveDamageTarget.mdl", "CleaveDamageTarget")
--点金术 金币散散散
_assets_model(":Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", "PileOfGold")
--季风 自上而下单条闪电
_assets_model(":Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", "MonsoonBoltTarget")
--季风 雨
_assets_model(":Abilities\\Spells\\Other\\Monsoon\\MonsoonRain.mdl", "MonsoonRain")
--灵魂燃烧 火焰小鬼
_assets_model(":Abilities\\Spells\\Other\\SoulBurn\\SoulBurnbuff.mdl", "SoulBurnBuff")
--燃灰 火焰爆破
_assets_model(":Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", "FireLordDeathExplode")
--燃灰 针刺火焰
_assets_model(":Abilities\\Spells\\Other\\Incinerate\\IncinerateBuff.mdl", "IncinerateBuff")
--燃灰 雾状绿毒
_assets_model(":Abilities\\Spells\\Other\\AcidBomb\\BottleImpact.mdl", "BottleImpact")
--盗取灵魂 菱形水晶环绕
_assets_model(":Abilities\\Spells\\Items\\AIso\\BIsvTarget.mdl", "BIsvTarget")
--幻象物品 褐色迷烟
_assets_model(":Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl", "MirrorImageDeathCaster")
--守护卷轴 白色盾牌
_assets_model(":Abilities\\Spells\\Items\\AIda\\AIdaTarget.mdl", "AIdaTarget")
--金箱子 黄色上升
_assets_model(":Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", "ResourceEffectTarget")
--隐身药水 白光
_assets_model(":Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", "AIviTarget")
--火山爆发 沙尘
_assets_model(":Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", "VolcanoDeath")
--火焰雨 砸
_assets_model(":Abilities\\Spells\\Demon\\RainOfFire\\RainOfFireTarget.mdl", "RainOfFireTarget")
--显示 环环金光上升
_assets_model(":Abilities\\Spells\\Other\\Andt\\Andt.mdl", "Andt")
--魔鬼缠身 红火爆破
_assets_model(":Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", "DoomDeath")
--魔鬼缠身 红波纹聚集
_assets_model(":Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", "DoomTarget")
--水爆破
_assets_model(":Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", "NagaDeath")
--鬼阵爆破
_assets_model(":Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl", "UCancelDeath")
--大爆炸
_assets_model(":Objects\\Spawnmodels\\Human\\HCancelDeath\\HCancelDeath.mdl", "HCancelDeath")
--白色混沌爆炸
_assets_model(":Abilities\\Weapons\\GryphonRiderMissile\\GryphonRiderMissileTarget.mdl", "GryphonRiderMissileTarget")
--鬼哭上天
_assets_model(":Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl", "UndeadDissipate")
--金币翻腾
_assets_model(":UI\\Feedback\\GoldCredit\\GoldCredit.mdl", "GoldCredit")
--沙尘爆破
_assets_model(":Objects\\Spawnmodels\\Undead\\ImpaleTargetDust\\ImpaleTargetDust.mdl", "ImpaleTargetDust")
--诡异爆破
_assets_model(":Objects\\Spawnmodels\\Other\\ToonBoom\\ToonBoom.mdl", "ToonBoom")
--砍血
_assets_model(":Objects\\Spawnmodels\\Critters\\Albatross\\CritterBloodAlbatross.mdl", "CritterBloodAlbatross")
--浮生之焰 金光火焰
_assets_model(":Abilities\\Spells\\Demon\\ReviveDemon\\ReviveDemon.mdl", "ReviveDemon")
--金色闪光
_assets_model(":Abilities\\Spells\\Items\\StaffOfPurification\\PurificationTarget.mdl", "PurificationTarget")
--金色闪光 爆破
_assets_model(":Abilities\\Spells\\Items\\StaffOfPurification\\PurificationCaster.mdl", "PurificationCaster")
--炮弹 爆破
_assets_model(":Abilities\\Weapons\\Mortar\\ScatterShotTarget.mdl", "ScatterShotTarget")

--【 光环特效 】

--通用目标淡蓝光圈
_assets_model(":Abilities\\Spells\\Other\\GeneralAuraTarget\\GeneralAuraTarget.mdl", "GeneralAuraTarget")
--辉煌光环 两个蓝圈
_assets_model(":Abilities\\Spells\\Human\\Brilliance\\Brilliance.mdl", "Brilliance")
--专注光环 十字守护
_assets_model(":Abilities\\Spells\\Human\\DevotionAura\\DevotionAura.mdl", "DevotionAura")
--耐久光环 兽齿图腾
_assets_model(":Abilities\\Spells\\Orc\\CommandAura\\CommandAura.mdl", "OmMandAura")
--荒芜光环 紫六芒星
_assets_model(":Abilities\\Spells\\Undead\\RegenerationAura\\ObsidianRegenAura.mdl", "ObsidianRegenAura")
--吸血光环 不死阵
_assets_model(":Abilities\\Spells\\Undead\\VampiricAura\\VampiricAura.mdl", "VampiricAura")
--邪恶光环 黄绿符文
_assets_model(":Abilities\\Spells\\Undead\\UnholyAura\\UnholyAura.mdl", "UnholyAura")
--荆棘光环 刺
_assets_model(":Abilities\\Spells\\NightElf\\ThornsAura\\ThornsAura.mdl", "ThornsAura")
--强击光环 四绿箭
_assets_model(":Abilities\\Spells\\NightElf\\TrueshotAura\\TrueshotAura.mdl", "TrueShotAura")
--战鼓光环 红色鼓音波
_assets_model(":Abilities\\Spells\\Orc\\WarDrums\\DrumsCasterHeal.mdl", "DrumsCasterHeal")
--命令光环 红色准星纹
_assets_model(":Abilities\\Spells\\Orc\\CommandAura\\CommandAuraTarget.mdl", "CommandAuraTarget")

--【 英雄模型 】

--圣骑士
_assets_model(":units\\human\\HeroPaladin\\HeroPaladin", "HeroPaladin", "unit", { Art = "unit\\hero\\HeroPaladin" })
--大魔法师
_assets_model(":units\\human\\HeroArchMage\\HeroArchMage", "HeroArchMage", "unit", { Art = "unit\\hero\\HeroArchMage" })
--大魔法师(魂)
_assets_model(":units\\other\\HeroArchMageGhost\\HeroArchMageGhost", "HeroArchMageGhost", "unit", { Art = "unit\\hero\\GhostMage" })
--山丘之王
_assets_model(":units\\human\\HeroMountainKing\\HeroMountainKing", "HeroMountainKing", "unit", { Art = "unit\\hero\\HeroMountainKing" })
--血魔法师
_assets_model(":units\\human\\HeroBloodElf\\HeroBloodElf", "HeroBloodElf", "unit", { Art = "unit\\hero\\HeroBloodElfPrince" })
--阿尔塞斯
_assets_model(":units\\human\\Arthas\\Arthas", "Arthas", "unit", { Art = "unit\\hero\\Arthas" })
--阿尔塞斯(剑)
_assets_model(":units\\human\\ArthaswithSword\\ArthaswithSword", "ArthaswithSword", "unit", { Art = "unit\\hero\\Arthas" })
--海军上将普洛德摩尔
_assets_model(":units\\other\\Proudmoore\\Proudmoore", "Proudmoore", "unit", { Art = "unit\\hero\\Captain" })
--吉安娜
_assets_model(":units\\human\\Jaina\\Jaina", "Jaina", "unit", { Art = "unit\\hero\\Jaina" })
--加理瑟斯
_assets_model(":units\\creeps\\LordGarithos\\LordGarithos", "LordGarithos", "unit", { Art = "unit\\hero\\Garithos" })
--追风之西尔瓦娜斯
_assets_model(":units\\creeps\\SylvanusWindrunner\\SylvanusWindrunner", "SylvanusWindrunner", "unit", { Art = "unit\\hero\\SylvanusWindrunner" })
--火凤凰
_assets_model(":units\\human\\phoenix\\phoenix", "Phoenix", "unit", { Art = "unit\\hero\\Phoenix" })
--剑圣绿
_assets_model(":units\\orc\\HeroBladeMaster\\HeroBladeMaster", "HeroBladeMaster", "unit", { Art = "unit\\hero\\HeroBladeMaster" })
--剑圣红
_assets_model(":units\\demon\\HeroChaosBladeMaster\\HeroChaosBladeMaster", "HeroChaosBladeMaster", "unit", { Art = "unit\\hero\\ChaosBlademaster" })
--地狱咆哮
_assets_model(":units\\orc\\Hellscream\\Hellscream", "Hellscream", "unit", { Art = "unit\\hero\\HellScream" })
--地狱咆哮红
_assets_model(":units\\demon\\ChaosHellscream\\ChaosHellscream", "ChaosHellscream", "unit", { Art = "unit\\hero\\ChaosGrom" })
--先知
_assets_model(":units\\orc\\HeroFarSeer\\HeroFarSeer", "HeroFarSeer", "unit", { Art = "unit\\hero\\HeroFarSeer" })
--萨尔
_assets_model(":units\\orc\\Thrall\\Thrall", "Thrall", "unit", { Art = "unit\\hero\\Thrall" })
--牛头人酋长
_assets_model(":units\\orc\\HeroTaurenChieftain\\HeroTaurenChieftain", "HeroTaurenChieftain", "unit", { Art = "unit\\hero\\HeroTaurenChieftain" })
--暗影猎手
_assets_model(":units\\orc\\HeroShadowHunter\\HeroShadowHunter", "HeroShadowHunter", "unit", { Art = "unit\\hero\\ShadowHunter" })
--兽王
_assets_model(":Units\\Other\\Rexxar\\Rexxar", "Rexxar", "unit", { Art = "unit\\hero\\BeastMaster" })
--死骑
_assets_model(":units\\undead\\HeroDeathKnight\\HeroDeathKnight", "HeroDeathKnight", "unit", { Art = "unit\\hero\\HeroDeathKnight" })
--巫妖
_assets_model(":units\\undead\\HeroLich\\HeroLich", "HeroLich", "unit", { Art = "unit\\hero\\HeroLich" })
--恐惧魔王
_assets_model(":units\\undead\\HeroDreadLord\\HeroDreadLord", "HeroDreadLord", "unit", { Art = "unit\\hero\\HeroDreadLord" })
--地穴领主
_assets_model(":units\\undead\\HeroCryptLord\\HeroCryptLord", "HeroCryptLord", "unit", { Art = "unit\\hero\\HeroCryptLord" })
--克尔苏加德
_assets_model(":units\\undead\\Kelthuzad\\Kelthuzad", "Kelthuzad", "unit", { Art = "unit\\hero\\Kelthuzad" })
--克尔苏加德 (幽灵)
_assets_model(":units\\undead\\KelThuzadGhost\\KelThuzadGhost", "KelThuzadGhost", "unit", { Art = "unit\\hero\\GhostOfKelThuzad" })
--深渊魔王
_assets_model(":units\\demon\\HeroPitLord\\HeroPitLord", "HeroPitLord", "unit", { Art = "unit\\hero\\PitLord" })
--阿克蒙德
_assets_model(":units\\demon\\Warlock\\Warlock", "Warlock", "unit", { Art = "unit\\hero\\Archimonde" })
--基尔加丹
_assets_model(":units\\demon\\Kiljaeden\\Kiljaeden", "Kiljaeden", "unit", { Art = "unit\\hero\\Kiljaedin" })
--丛林守护者
_assets_model(":units\\nightelf\\HeroKeeperoftheGrove\\HeroKeeperoftheGrove", "HeroKeeperoftheGrove", "unit", { Art = "unit\\hero\\KeeperOfTheGrove" })
--丛林守护者(幽灵)
_assets_model(":units\\nightelf\\HeroKeeperoftheGroveGhost\\HeroKeeperoftheGroveGhost", "HeroKeeperoftheGroveGhost", "unit", { Art = "unit\\hero\\KeeperGhostBlue" })
--月之女祭司
_assets_model(":units\\nightelf\\HeroMoonPriestess\\HeroMoonPriestess", "HeroMoonPriestess", "unit", { Art = "unit\\hero\\PriestessOfTheMoon" })
--守望者
_assets_model(":units\\nightelf\\herowarden\\herowarden", "HeroWarden", "unit", { Art = "unit\\hero\\HeroWarden" })
--恶魔猎手
_assets_model(":units\\nightelf\\HeroDemonHunter\\HeroDemonHunter", "HeroDemonHunter", "unit", { Art = "unit\\hero\\HeroDemonHunter" })
--恶魔猎手(邪恶)
_assets_model(":units\\nightelf\\EvilIllidan\\IllidanEvil", "EvilIllidan", "unit", { Art = "unit\\hero\\EvilIllidan" })
--法里奥
_assets_model(":units\\nightelf\\Furion\\Furion", "Furion", "unit", { Art = "unit\\hero\\Furion" })
--玛尔法里奥
_assets_model(":units\\nightelf\\MalFurion\\MalFurion", "MalFurion", "unit", { Art = "unit\\hero\\Furion" })
--玛尔法里奥(无鹿角)
_assets_model(":units\\nightelf\\MalFurion\\MalFurionNoStag", "MalFurion", "unit", { Art = "unit\\hero\\Furion" })
--黑暗游侠
_assets_model(":Units\\Creeps\\BansheeRanger\\BansheeRanger", "BansheeRanger", "unit", { Art = "unit\\hero\\BansheeRanger" })
--火焰巨魔
_assets_model(":Units\\Creeps\\HeroFlameLord\\HeroFlameLord", "HeroFlameLord", "unit", { Art = "unit\\hero\\HeroAvatarOfFlame" })
--炼金术士
_assets_model(":Units\\Creeps\\HeroGoblinAlchemist\\HeroGoblinAlchemist", "HeroGoblinAlchemist", "unit", { Art = "unit\\hero\\HeroAlchemist" })
--修补匠
_assets_model(":Units\\Creeps\\HeroTinker\\HeroTinker", "HeroTinker", "unit", { Art = "unit\\hero\\HeroTinker" })
--美杜莎
_assets_model(":units\\naga\\HeroNagaSeawitch\\HeroNagaSeawitch", "HeroNagaSeawitch", "unit", { Art = "unit\\hero\\NagaSeaWitch" })
--阿卡玛
_assets_model(":units\\other\\DranaiAkama\\DranaiAkama", "DranaiAkama", "unit", { Art = "unit\\hero\\DranaiAkama" })
--熊猫酒仙
_assets_model(":Units\\Creeps\\PandarenBrewmaster\\PandarenBrewmaster", "PandarenBrewmaster", "unit", { Art = "unit\\hero\\PandaBrewmaster" })
--熊猫大地
_assets_model(":Units\\Creeps\\EarthPandarenBrewmaster\\EarthPandarenBrewmaster", "EarthPandarenBrewmaster", "unit", { Art = "unit\\hero\\PandaEarthBrewMaster" })
--熊猫雷暴
_assets_model(":Units\\Creeps\\StormPandarenBrewmaster\\StormPandarenBrewmaster", "StormPandarenBrewmaster", "unit", { Art = "unit\\hero\\PandaStorm" })
--熊猫烈焰
_assets_model(":Units\\Creeps\\FirePandarenBrewmaster\\FirePandarenBrewmaster", "FirePandarenBrewmaster", "unit", { Art = "unit\\hero\\PandaFireBrewMaster" })


--【 单位模型 】

--农民
_assets_model(":units\\human\\Peasant\\Peasant", "Peasant", "unit", { Art = "unit\\human\\Peasant" })
--步兵
_assets_model(":units\\human\\Footman\\Footman", "Footman", "unit", { Art = "unit\\human\\Footman" })
--骑士
_assets_model(":units\\human\\Knight\\Knight", "Knight", "unit", { Art = "unit\\human\\Knight" })
--矮人火枪手
_assets_model(":units\\human\\Rifleman\\Rifleman", "Rifleman", "unit", { Art = "unit\\human\\Rifleman" })
--迫击炮小队
_assets_model(":units\\human\\MortarTeam\\MortarTeam", "MortarTeam", "unit", { Art = "unit\\human\\MortarTeam" })
--飞行机器
_assets_model(":units\\human\\Gyrocopter\\Gyrocopter", "Gyrocopter", "unit", { Art = "unit\\human\\Gyrocopter" })
--狮鹫骑士
_assets_model(":units\\human\\GryphonRider\\GryphonRider", "GryphonRider", "unit", { Art = "unit\\animal\\GryphonRider" })
--牧师
_assets_model(":units\\human\\Priest\\Priest", "Priest", "unit", { Art = "unit\\elf\\priest2" })
--女巫
_assets_model(":units\\human\\Sorceress\\Sorceress", "Sorceress", "unit", { Art = "unit\\human\\Sorceress" })
--蒸汽机车
_assets_model(":units\\human\\WarWagon\\WarWagon", "WarWagon", "unit", { Art = "unit\\machine\\SeigeEngine" })
--魔法破坏者
_assets_model(":units\\human\\BloodElfSpellThief\\BloodElfSpellThief", "BloodElfSpellThief", "unit", { Art = "unit\\human\\SpellBreaker" })
--龙鹰骑士
_assets_model(":units\\human\\BloodElfDragonHawk\\BloodElfDragonHawk", "BloodElfDragonHawk", "unit", { Art = "unit\\elf\\DragonHawk" })
--民兵
_assets_model(":units\\human\\Militia\\Militia", "Militia", "unit", { Art = "unit\\human\\Militia" })
--水元素
_assets_model(":units\\human\\WaterElemental\\WaterElemental", "WaterElemental", "unit", { Art = "unit\\water\\WaterElemental" })
--剑士
_assets_model(":units\\human\\TheCaptain\\TheCaptain", "TheCaptain", "unit", { Art = "unit\\human\\TheCaptain" })
--牧师使者
_assets_model(":units\\creeps\\HumanMage\\HumanMage", "HumanMage", "unit", { Art = "unit\\human\\BanditMage" })
--高级精灵男
_assets_model(":units\\critters\\HighElfPeasant\\HighElfPeasant", "HighElfPeasant", "unit", { Art = "unit\\elf\\ElfVillager" })
--高级精灵女
_assets_model(":units\\critters\\ElfVillagerWoman\\ElfVillagerWoman", "HighElfVillagerWoman", "unit", { Art = "unit\\elf\\FemaleElfVillager" })
--高级精灵弓箭手
_assets_model(":units\\creeps\\HighElfArcher\\HighElfArcher", "HighElfArcher", "unit", { Art = "unit\\elf\\HighElvenArcher" })
--麦迪文
_assets_model(":units\\creeps\\Medivh\\Medivh", "Medivh", "unit", { Art = "unit\\human\\Medivh" })

--苦工
_assets_model(":units\\orc\\Peon\\Peon", "Peon", "unit", { Art = "unit\\beast\\Peon" })
--苦工(邪恶)
_assets_model(":units\\demon\\ChaosPeon\\ChaosPeon", "PeonChaos", "unit", { Art = "unit\\beast\\ChaosPeon" })
--兽族步兵
_assets_model(":units\\orc\\Grunt\\Grunt", "Grunt", "unit", { Art = "unit\\beast\\Grunt" })
--兽族步兵(邪恶)
_assets_model(":units\\demon\\ChaosGrunt\\ChaosGrunt", "GruntChaos", "unit", { Art = "unit\\beast\\ChaosGrunt" })
--兽族步兵(骷髅)
_assets_model(":units\\creeps\\SkeletonOrc\\SkeletonOrc", "GruntSkeleton", "unit", { Art = "unit\\demon\\SkeletalOrc" })
--掠夺者
_assets_model(":units\\orc\\WolfRider\\WolfRider", "WolfRider", "unit", { Art = "unit\\beast\\Raider" })
--掠夺者(邪恶)
_assets_model(":units\\demon\\ChaosWolfRider\\ChaosWolfRider", "WolfRiderChaos", "unit", { Art = "unit\\beast\\ChaosWolfRider" })
--牛头人
_assets_model(":units\\orc\\Tauren\\Tauren", "Tauren", "unit", { Art = "unit\\beast\\Tauren" })
--巨魔猎头者
_assets_model(":units\\orc\\HeadHunter\\HeadHunter", "HeadHunter", "unit", { Art = "unit\\beast\\Headhunter" })
--粉碎者
_assets_model(":units\\orc\\catapult\\catapult", "Catapult", "unit", { Art = "unit\\machine\\Demolisher" })
--科多兽
_assets_model(":units\\orc\\KotoBeast\\KotoBeast", "KotoBeast", "unit", { Art = "unit\\beast\\KotoBeast" })
--科多兽(邪恶)
_assets_model(":units\\demon\\ChaosKotoBeast\\ChaosKotoBeast", "KotoBeastChaos", "unit", { Art = "unit\\beast\\ChaosKotoBeast" })
--科多兽(无驾驶员)
_assets_model(":units\\orc\\KotoBeastNoRider\\KotoBeastNoRider", "KotoBeastNoRider", "unit", { Art = "unit\\beast\\KotoBeast" })
--风骑士
_assets_model(":units\\orc\\WyvernRider\\WyvernRider", "WyvernRider", "unit", { Art = "unit\\beast\\WyvernRider" })
--风骑士(灵魂)
_assets_model(":units\\orc\\SpiritWyvern\\SpiritWyvern", "WyvernSpirit", "unit", { Art = "unit\\ancient\\SpiritWyvern" })
--风骑士(无驾驶员)
_assets_model(":units\\orc\\RiderlessWyvern\\RiderlessWyvern", "WyvernNoRider", "unit", { Art = "unit\\beast\\WyvernRider" })
--巨魔蝙蝠骑士
_assets_model(":units\\orc\\BatTroll\\BatTroll", "BatTroll", "unit", { Art = "unit\\beast\\TrollBatRider" })
--巨魔萨满
_assets_model(":units\\orc\\WitchDoctor\\WitchDoctor", "WitchDoctor", "unit", { Art = "unit\\beast\\WitchDoctor" })
--萨满祭司
_assets_model(":units\\orc\\Shaman\\Shaman", "Shaman", "unit", { Art = "unit\\beast\\Shaman" })
--灵魂行者
_assets_model(":units\\orc\\spiritwalker\\spiritwalker", "SpiritWalker", "unit", { Art = "unit\\beast\\SpiritWalker" })
--幽魂之狼
_assets_model(":units\\orc\\Spiritwolf\\Spiritwolf", "SpiritWolf", "unit", { Art = "unit\\beast\\SpiritWolf" })
--毒蛇守卫
_assets_model(":units\\orc\\SerpentWard\\SerpentWard", "SerpentWard", "unit", { Art = "unit\\beast\\SerpentWard" })
--岗哨守卫
_assets_model(":units\\orc\\SentryWard\\SentryWard", "SentryWard", "unit", { Art = "item\\misc\\SentryWard" })
--静止陷阱
_assets_model(":units\\orc\\StasisTotem\\StasisTotem", "StasisTotem", "unit", { Art = "ability\\red\\StasisTrap" })
--治疗守卫
_assets_model(":units\\orc\\HealingWard\\HealingWard", "HealingWard", "unit", { Art = "ability\\yellow\\HealingWard" })
--兽族战争首领
_assets_model(":units\\demon\\ChaosWarlord\\ChaosWarlord", "ChaosWarlord", "unit", { Art = "unit\\demon\\ChaosWarlord" })
--德拉克苏尔
_assets_model(":units\\creeps\\OrcWarlockRed\\OrcWarlockRed", "OrcWarlockRed", "unit", { Art = "unit\\beast\\OrcWarlock" })
--巫师
_assets_model(":units\\creeps\\ChaosWarlockGreen\\ChaosWarlockGreen", "ChaosWarlockGreen", "unit", { Art = "unit\\beast\\ChaosWarlockGreen" })
--巫师(邪恶)
_assets_model(":units\\demon\\ChaosWarlock\\ChaosWarlock", "ChaosWarlock", "unit", { Art = "unit\\beast\\ChaosWarlock" })

--侍僧
_assets_model(":units\\undead\\Acolyte\\Acolyte", "Acolyte", "unit", { Art = "unit\\demon\\Acolyte" })
--阴影
_assets_model(":units\\undead\\Shade\\Shade", "Shade", "unit", { Art = "unit\\demon\\Shade" })
--食尸鬼
_assets_model(":units\\undead\\Ghoul\\Ghoul", "Ghoul", "unit", { Art = "unit\\demon\\Ghoul" })
--憎恶
_assets_model(":units\\undead\\Abomination\\Abomination", "Abomination", "unit", { Art = "unit\\demon\\Abomination" })
--绞肉车
_assets_model(":units\\undead\\MeatWagon\\MeatWagon", "MeatWagon", "unit", { Art = "unit\\machine\\MeatWagon" })
--穴居恶魔
_assets_model(":units\\undead\\CryptFiend\\CryptFiend", "CryptFiend", "unit", { Art = "unit\\demon\\CryptFiend" })
--石像鬼
_assets_model(":units\\undead\\Gargoyle\\Gargoyle", "Gargoyle", "unit", { Art = "unit\\demon\\Gargoyle" })
--女妖
_assets_model(":units\\undead\\Banshee\\Banshee", "Banshee", "unit", { Art = "unit\\demon\\Banshee" })
--女妖(灵魂)
_assets_model(":units\\creeps\\BansheeGhost\\BansheeGhost", "BansheeGhost", "unit", { Art = "unit\\demon\\Ghost" })
--不死族巫师
_assets_model(":units\\undead\\Necromancer\\Necromancer", "Necromancer", "unit", { Art = "unit\\demon\\Necromancer" })
--十胜石雕像
_assets_model(":units\\undead\\ObsidianStatue\\ObsidianStatue", "ObsidianStatue", "unit", { Art = "unit\\demon\\ObsidianStatue" })
--冰霜巨龙
_assets_model(":units\\undead\\FrostWyrm\\FrostWyrm", "FrostWyrm", "unit", { Art = "unit\\ancient\\FrostWyrm" })
--蝗虫
_assets_model(":units\\undead\\Locust\\Locust", "Locust", "unit", { Art = "unit\\insect\\Spiderling" })
--疾病云雾
_assets_model(":units\\undead\\PlagueCloud\\PlagueCloud", "PlagueCloud", "unit", { Art = "ability\\green\\PlagueCloud" })
--骷髅战士
_assets_model(":units\\undead\\Skeleton\\Skeleton", "Skeleton", "unit", { Art = "unit\\demon\\SkeletonWarrior" })
--骷髅魔法师
_assets_model(":units\\undead\\SkeletonMage\\SkeletonMage", "SkeletonMage", "unit", { Art = "unit\\demon\\SkeletonMage" })
--骷髅弓箭手
_assets_model(":units\\creeps\\SkeletonArcher\\SkeletonArcher", "SkeletonArcher", "unit", { Art = "unit\\demon\\SkeletonArcher" })
--腐尸甲虫
_assets_model(":units\\undead\\scarab\\scarab", "Scarab", "unit", { Art = "ability\\purple\\CarrionScarabs" })
--僵尸
_assets_model(":units\\creeps\\Zombie\\Zombie", "Zombie", "unit", { Art = "unit\\demon\\Zombie" })

--小精灵
_assets_model(":units\\nightelf\\Wisp\\Wisp", "Wisp", "unit", { Art = "unit\\elf\\Wisp" })
--小精灵(缠绕形态)
_assets_model(":SharedModels\\EntangleWisp.mdl", "EntangleWisp", "unit", { Art = "unit\\elf\\Wisp" })
--弓箭手
_assets_model(":units\\nightelf\\Archer\\Archer", "Archer", "unit", { Art = "unit\\elf\\Archer" })
--女猎手
_assets_model(":units\\nightelf\\Huntress\\Huntress", "Huntress", "unit", { Art = "unit\\elf\\Huntress" })
--树妖
_assets_model(":units\\nightelf\\Dryad\\Dryad", "Dryad", "unit", { Art = "unit\\elf\\Dryad" })
--投刃车
_assets_model(":units\\nightelf\\Ballista\\Ballista", "Ballista", "unit", { Art = "unit\\machine\\GlaiveThrower" })
--角鹰兽
_assets_model(":units\\nightelf\\Hippogryph\\Hippogryph", "Hippogryph", "unit", { Art = "unit\\elf\\Hippogriff" })
--角鹰兽骑士
_assets_model(":units\\nightelf\\RiddenHippogryph\\RiddenHippogryph", "RiddenHippogryph", "unit", { Art = "unit\\elf\\HippogriffRider" })
--奇美拉
_assets_model(":units\\nightelf\\Chimaera\\Chimaera", "Chimaera", "unit", { Art = "unit\\ancient\\Chimaera" })
--猛禽德鲁伊
_assets_model(":units\\nightelf\\DruidoftheTalon\\DruidoftheTalon", "DruidOfTheTalon", "unit", { Art = "unit\\elf\\DruidOfTheTalon" })
--利爪德鲁伊
_assets_model(":units\\nightelf\\DruidoftheClaw\\DruidoftheClaw", "DruidOfTheClaw", "unit", { Art = "unit\\elf\\DruidOfTheClaw" })
--山岭巨人
_assets_model(":units\\nightelf\\MountainGiant\\MountainGiant", "MountainGiant", "unit", { Art = "unit\\elf\\MountainGiant" })
--精灵龙
_assets_model(":units\\nightelf\\FaerieDragon\\FaerieDragon", "FaerieDragon", "unit", { Art = "unit\\elf\\FaerieDragon" })
--猫头鹰侦察者
_assets_model(":units\\nightelf\\OwlSCOUT\\OwlSCOUT", "OwlScout", "unit", { Art = "unit\\animal\\Scout" })
--树人
_assets_model(":units\\nightelf\\Ent\\Ent", "Ent", "unit", { Art = "unit\\elf\\Ent" })
--树人(堕落)
_assets_model(":units\\creeps\\CorruptedEnt\\CorruptedEnt", "CorruptedEnt", "unit", { Art = "unit\\elf\\EntCorrupted" })
--复仇天神
_assets_model(":units\\nightelf\\SpiritOfVengeance\\SpiritOfVengeance", "AvengingAssassin", "unit", { Art = "unit\\elf\\AvengingAssassin" })
--复仇之魂
_assets_model(":units\\nightelf\\Vengeance\\Vengeance", "AvengingWatcher", "unit", { Art = "unit\\elf\\AvengingWatcher" })
--守望者(暗杀)
_assets_model(":units\\creeps\\assassin\\assassin", "Assassin", "unit", { Art = "unit\\elf\\Assassin" })

--飞蛇
_assets_model(":units\\naga\\WindSerpent\\WindSerpent", "WindSerpent", "unit", { Art = "unit\\water\\WindSerpent" })
--娜迦海妖
_assets_model(":Units\\Naga\\NagaSiren\\NagaSiren", "NagaSiren", "unit", { Art = "unit\\water\\SeaWitch" })
--飞龙
_assets_model(":Units\\Naga\\SnapDragon\\SnapDragon", "SnapDragon", "unit", { Art = "unit\\water\\SnapDragon" })
--娜迦暴徒
_assets_model(":Units\\Naga\\NagaMyrmidon\\NagaMyrmidon", "NagaMyrmidon", "unit", { Art = "unit\\water\\NagaMyrmidon" })
--娜迦皇家卫兵
_assets_model(":Units\\Naga\\NagaRoyalGuard\\NagaRoyalGuard", "NagaRoyalGuard", "unit", { Art = "unit\\water\\NagaMyrmidonRoyalGuard" })
--娜迦召唤者
_assets_model(":Units\\Naga\\NagaSummoner\\NagaSummoner", "NagaSummoner", "unit", { Art = "unit\\water\\NagaSummoner" })

--口袋工厂
_assets_model(":Units\\Creeps\\HeroTinkerFactory\\HeroTinkerFactory", "TinkerFactory", "unit", { Art = "unit\\machine\\PocketFactory" })
--口袋工厂(人工地精)
_assets_model(":Units\\Creeps\\HeroTinkerRobot\\HeroTinkerRobot", "TinkerRobot", "unit", { Art = "unit\\machine\\ClockWerkGoblin" })
--炎魔
_assets_model(":Units\\Creeps\\LavaSpawn\\LavaSpawn", "LavaSpawn", "unit", { Art = "unit\\elf\\LavaSpawn" })
--米纱熊
_assets_model(":units\\creeps\\GrizzlyBear\\GrizzlyBear", "GrizzlyBear", "unit", { Art = "unit\\animal\\GrizzlyBear" })
--战鹰
_assets_model(":units\\creeps\\WarEagle\\WarEagle", "WarEagle", "unit", { Art = "unit\\animal\\WarEagle" })
--狂暴豪猪
_assets_model(":Units\\Creeps\\QuillBeast\\QuillBeast", "QuillBeast", "unit", { Art = "unit\\animal\\QuillBeastGod" })

--钢灰海龟
_assets_model(":Units\\Creeps\\SeaTurtle\\SeaTurtle", "SeaTurtle", "unit", { Art = "unit\\water\\SeaTurtleGreen" })
--黄绿海龟
_assets_model(":Units\\Creeps\\GiantSeaTurtle\\GiantSeaTurtle", "SeaTurtleYG", "unit", { Art = "unit\\water\\SeaTurtleGreen" })
--龙龟
_assets_model(":Units\\Creeps\\DragonSeaTurtleRange\\DragonSeaTurtleRange", "SeaTurtleRed", "unit", { Art = "unit\\water\\SeaTurtleRed" })

--小鱼人(黄)
_assets_model(":units\\creeps\\Murloc\\Murloc", "MurlocYellow", "unit", { Art = "unit\\water\\Murloc" })
--小鱼人(橙)
_assets_model(":units\\creeps\\MurlocWarrior\\MurlocWarrior", "MurlocOrange", "unit", { Art = "unit\\water\\MurgulBloodGill" })
--小鱼人(绿)
_assets_model(":units\\creeps\\MurlocMutant\\MurlocMutant", "MurlocGreen", "unit", { Art = "unit\\water\\MurlocMutant" })
--小鱼人(青)
_assets_model(":Units\\Creeps\\MurgulTideWarrior\\MurgulTideWarrior", "MurlocCyan", "unit", { Art = "unit\\water\\MurgulTideWarrior" })
--小鱼人(天蓝)
_assets_model(":units\\creeps\\MurgulSlave\\MurgulSlave", "MurlocBlue", "unit", { Art = "unit\\water\\MurgalSlave" })
--小鱼人(海蓝)
_assets_model(":units\\creeps\\MurlocFlesheater\\MurlocFlesheater", "MurlocDeepBlue", "unit", { Art = "unit\\water\\MurlocFleshEater" })
--小鱼人(浅紫)
_assets_model(":Units\\Creeps\\MurgulReaver\\MurgulReaver", "MurlocPurple", "unit", { Art = "unit\\water\\MurgulShadowCaster" })
--小鱼人(夜紫)
_assets_model(":units\\creeps\\MurlocNightcrawler\\MurlocNightcrawler", "MurlocNight", "unit", { Art = "unit\\water\\MurlocNightCrawler" })
--小鱼人(蓝紫)
_assets_model(":Units\\Creeps\\MurgulShadowCaster\\MurgulShadowCaster", "MurlocShadow", "unit", { Art = "unit\\water\\MurgulShadowCaster" })

--蓝幼龙
_assets_model(":units\\creeps\\AzureDragonWelp\\AzureDragonWelp", "AzureDragonWelp", "unit", { Art = "unit\\ancient\\AzureDragon" })
--蓝龙
_assets_model(":units\\creeps\\AzureDragon\\AzureDragon", "AzureDragon", "unit", { Art = "unit\\ancient\\AzureDragon" })
--红幼龙
_assets_model(":units\\creeps\\RedDragonWelp\\RedDragonWelp", "RedDragonWelp", "unit", { Art = "unit\\ancient\\RedDragon" })
--红龙
_assets_model(":units\\creeps\\RedDragon\\RedDragon", "RedDragon", "unit", { Art = "unit\\ancient\\RedDragon" })
--黑幼龙
_assets_model(":units\\creeps\\BlackDragonWelp\\BlackDragonWelp", "BlackDragonWelp", "unit", { Art = "unit\\ancient\\BlackDragon" })
--黑龙
_assets_model(":units\\creeps\\BlackDragon\\BlackDragon", "BlackDragon", "unit", { Art = "unit\\ancient\\BlackDragon" })
--褐幼龙
_assets_model(":units\\creeps\\BronzeDragonWelp\\BronzeDragonWelp", "BronzeDragonWelp", "unit", { Art = "unit\\ancient\\BronzeDragon" })
--褐龙
_assets_model(":units\\creeps\\BronzeDragon\\BronzeDragon", "BronzeDragon", "unit", { Art = "unit\\ancient\\BronzeDragon" })
--绿幼龙
_assets_model(":units\\creeps\\GreenDragonWelp\\GreenDragonWelp", "GreenDragonWelp", "unit", { Art = "unit\\ancient\\GreenDragon" })
--绿龙
_assets_model(":units\\creeps\\GreenDragon\\GreenDragon", "GreenDragon", "unit", { Art = "unit\\ancient\\GreenDragon" })
--耐瑟龙
_assets_model(":units\\creeps\\NetherDragon\\NetherDragon", "NetherDragon", "unit", { Art = "unit\\ancient\\NetherDragon" })
--九头蛇怪
_assets_model(":Units\\Creeps\\Hydra\\Hydra", "Hydra", "unit", { Art = "unit\\ancient\\GreenHydra" })

--小蜘蛛(紫)
_assets_model(":units\\creeps\\Spider\\Spider", "Spider", "unit", { Art = "unit\\insect\\Spider" })
--小蜘蛛(黑)
_assets_model(":units\\creeps\\SpiderBlack\\SpiderBlack", "SpiderBlack", "unit", { Art = "unit\\insect\\SpiderBlack" })
--小蜘蛛(绿)
_assets_model(":units\\creeps\\SpiderGreen\\SpiderGreen", "SpiderGreen", "unit", { Art = "unit\\insect\\SpiderGreen" })
--小蜘蛛(蓝)
_assets_model(":units\\creeps\\SpiderBlue\\SpiderBlue", "SpiderBlue", "unit", { Art = "unit\\insect\\SpiderBlue" })
--蛛网怪
_assets_model(":units\\creeps\\Nerubian\\Nerubian", "Nerubian", "unit", { Art = "unit\\insect\\Nerubian" })
--蛛网怪(首领)
_assets_model(":units\\creeps\\NerubianSpiderLord\\NerubianSpiderLord", "NerubianLord", "unit", { Art = "unit\\insect\\nerubianSpiderLord" })
--蛛网怪(女皇)
_assets_model(":units\\creeps\\NerubianQueen\\NerubianQueen", "NerubianQueen", "unit", { Art = "unit\\insect\\NerubianQueen" })

--鹰女妖
_assets_model(":units\\creeps\\Harpy\\Harpy", "Harpy", "unit", { Art = "unit\\elf\\Harpy" })
--鹰女妖女皇
_assets_model(":units\\creeps\\HarpyQueen\\HarpyQueen", "HarpyQueen", "unit", { Art = "unit\\elf\\HarpyQueen" })

--海元素
_assets_model(":Units\\Creeps\\SeaElemental\\SeaElemental", "SeaElemental", "unit", { Art = "unit\\water\\SeaElemental" })
--虚空假面(红)
_assets_model(":Units\\Creeps\\Unbroken\\Unbroken", "UnbrokenRed", "unit", { Art = "unit\\demon\\Unbroken" })
--虚空假面(紫)
_assets_model(":units\\creeps\\VoidWalker\\VoidWalker", "UnbrokenPurple", "unit", { Art = "unit\\demon\\Unbroken2" })
--地狱火
_assets_model(":units\\demon\\Infernal\\Infernal", "Infernal", "unit", { Art = "ability\\green\\Infernal" })
--毁灭守卫
_assets_model(":units\\demon\\DoomGuard\\DoomGuard", "DoomGuard", "unit", { Art = "unit\\demon\\DoomGuard" })
--刺蛇
_assets_model(":Units\\Critters\\Hydralisk\\Hydralisk", "Hydralisk", "unit", { Art = "unit\\demon\\Hydralisk" })
--灵兽
_assets_model(":units\\creeps\\FelstalkerPurple\\FelstalkerPurple", "Felstalker", "unit", { Art = "unit\\demon\\FelHound" })
--淤泥怪(绿)
_assets_model(":units\\other\\DalaranReject\\DalaranReject", "DalaranReject", "unit", { Art = "unit\\demon\\DalaranReject" })
--淤泥怪(黑)
_assets_model(":units\\creeps\\SludgeMonster\\SludgeMonster", "SludgeMonster", "unit", { Art = "unit\\demon\\SludgeCreature" })
--岩石傀儡
_assets_model(":units\\creeps\\RockGolem\\RockGolem", "RockGolem", "unit", { Art = "unit\\ancient\\RockGolem" })
--灵肉傀儡
_assets_model(":units\\other\\FleshGolem\\FleshGolem", "FleshGolem", "unit", { Art = "unit\\ancient\\FleshGolem" })
--战争傀儡
_assets_model(":units\\creeps\\GolemStatue\\GolemStatue", "ArmorGolem", "unit", { Art = "unit\\ancient\\ArmorGolem" })
--阿卡那瑟德
_assets_model(":Units\\Creeps\\Archnathid\\Archnathid", "Arachnathid", "unit", { Art = "unit\\insect\\Arachnathid" })
--阿卡那瑟德(绿)
_assets_model(":Units\\Creeps\\ArchnathidGreen\\ArchnathidGreen", "ArachnathidGreen", "unit", { Art = "unit\\insect\\ArachnathidGreen" })
--阿卡那瑟德(紫)
_assets_model(":Units\\Creeps\\Archnathidpurple\\Archnathidpurple", "ArachnathidPurple", "unit", { Art = "unit\\insect\\Arachnathidpurple" })
--强盗
_assets_model(":units\\creeps\\Bandit\\Bandit", "Bandit", "unit", { Art = "unit\\human\\Bandit" })
--土匪
_assets_model(":units\\creeps\\BanditSpearThrower\\BanditSpearThrower", "BanditSpearThrower", "unit", { Art = "unit\\human\\BanditSpearThrower" })
--龙卵战士(紫)
_assets_model(":Units\\Creeps\\DragonSpawnPurple\\DragonSpawnPurple", "DragonSpawnPurple", "unit", { Art = "unit\\ancient\\purpleDragonSpawn" })
--龙卵战士(绿)
_assets_model(":Units\\Creeps\\DragonSpawnGreen\\DragonSpawnGreen", "DragonSpawnGreen", "unit", { Art = "unit\\ancient\\GreenDragonSpawn" })
--龙卵战士(蓝)
_assets_model(":Units\\Creeps\\DragonSpawnBlue\\DragonSpawnBlue", "DragonSpawnBlue", "unit", { Art = "unit\\ancient\\BlueDragonSpawn" })
--半人马战士
_assets_model(":units\\creeps\\Centaur\\Centaur", "Centaur", "unit", { Art = "unit\\beast\\Centaur" })
--半人马弓箭手
_assets_model(":units\\creeps\\CentaurArcher\\CentaurArcher", "CentaurArcher", "unit", { Art = "unit\\beast\\CentaurArcher" })
--半人马可汗
_assets_model(":units\\creeps\\CentaurKhan\\CentaurKhan", "CentaurKhan", "unit", { Art = "unit\\beast\\CentaurKhan" })
--狂暴守卫(红)
_assets_model(":units\\demon\\Felgaurd\\Felgaurd", "FelGuard", "unit", { Art = "unit\\demon\\FelGuard" })
--狂暴守卫(蓝)
_assets_model(":units\\demon\\FelgaurdBlue\\FelgaurdBlue", "FelGuardBlue", "unit", { Art = "unit\\demon\\FelGuardBlue" })
--森林巨魔战士
_assets_model(":units\\creeps\\ForestTroll\\ForestTroll", "ForestTroll", "unit", { Art = "unit\\beast\\ForestTroll" })
--森林巨魔猎手
_assets_model(":units\\creeps\\ForestTrollTrapper\\ForestTrollTrapper", "ForestTrollTrapper", "unit", { Art = "unit\\beast\\ForestTrollTrapper" })
--森林巨魔牧师
_assets_model(":units\\creeps\\ForestTrollShadowPriest\\ForestTrollShadowPriest", "ForestTrollShadowPriest", "unit", { Art = "unit\\beast\\ForestTrollShadowPriest" })
--暗黑巨魔战士
_assets_model(":units\\creeps\\DarkTroll\\DarkTroll", "DarkTroll", "unit", { Art = "unit\\beast\\DarkTroll" })
--暗黑巨魔猎手
_assets_model(":units\\creeps\\DarkTrollTrapper\\DarkTrollTrapper", "DarkTrollTrapper", "unit", { Art = "unit\\beast\\DarkTrollTrapper" })
--暗黑巨魔牧师
_assets_model(":units\\creeps\\DarkTrollShadowPriest\\DarkTrollShadowPriest", "DarkTrollShadowPriest", "unit", { Art = "unit\\beast\\DarkTrollShadowPriest" })
--冰原巨魔战士
_assets_model(":units\\creeps\\IceTroll\\IceTroll", "IceTroll", "unit", { Art = "unit\\beast\\IceTroll" })
--冰原巨魔牧师
_assets_model(":units\\creeps\\IceTrollShadowPriest\\IceTrollShadowPriest", "IceTrollShadowPriest", "unit", { Art = "unit\\beast\\IceTrollShadowPriest" })
--熊怪
_assets_model(":units\\creeps\\Furbolg\\Furbolg", "Furbolg", "unit", { Art = "unit\\beast\\Furbolg" })
--熊猫
_assets_model(":units\\creeps\\FurbolgPanda\\FurbolgPanda", "FurbolgPanda", "unit", { Art = "unit\\beast\\FurbolgPanda" })
--熊战
_assets_model(":units\\creeps\\FurbolgElder\\FurbolgElder", "FurbolgElder", "unit", { Art = "unit\\beast\\FurbolgElder" })
--深海巨猎人
_assets_model(":Units\\Creeps\\SeaGiantGreen\\SeaGiantGreen", "SeaGiant", "unit", { Art = "unit\\water\\SeaGiant" })
--豺狼
_assets_model(":units\\creeps\\Gnoll\\Gnoll", "Gnoll", "unit", { Art = "unit\\beast\\Gnoll" })
--豺狼猎手
_assets_model(":units\\creeps\\GnollArcher\\GnollArcher", "GnollArcher", "unit", { Art = "unit\\beast\\GnollArcher" })
--狗头人
_assets_model(":units\\creeps\\Kobold\\Kobold", "Kobold", "unit", { Art = "unit\\beast\\Kobold" })
--狗头人占卜师
_assets_model(":units\\creeps\\KoboldGeomancer\\KoboldGeomancer", "KoboldGeomancer", "unit", { Art = "unit\\beast\\KoboldGeomancer" })
--闪电蜥蜴(绿)
_assets_model(":units\\creeps\\ThunderLizard\\ThunderLizard", "ThunderLizard", "unit", { Art = "unit\\beast\\ThunderLizard" })
--闪电蜥蜴(红)
_assets_model(":units\\creeps\\ThunderLizardSalamander\\ThunderLizardSalamander", "ThunderLizardSalamander", "unit", { Art = "unit\\beast\\ThunderLizardSalamander" })
--闪电蜥蜴(紫)
_assets_model(":units\\creeps\\ThunderLizardVizier\\ThunderLizardVizier", "ThunderLizardVizier", "unit", { Art = "unit\\beast\\ThunderLizardVizier" })
--巨虾(红)
_assets_model(":units\\creeps\\Lobstrokkred\\Lobstrokkred", "LobstrokkRed", "unit", { Art = "unit\\water\\LobstrokkRed" })
--巨虾(绿)
_assets_model(":units\\creeps\\Lobstrokkgreen\\Lobstrokkgreen", "LobstrokkGreen", "unit", { Art = "unit\\water\\LobstrokkGreen" })
--巨虾(蓝)
_assets_model(":units\\creeps\\Lobstrokkblue\\Lobstrokkblue", "LobstrokkBlue", "unit", { Art = "unit\\water\\LobstrokkBlue" })
--猛犸
_assets_model(":Units\\Creeps\\Mammoth\\Mammoth", "Mammoth", "unit", { Art = "unit\\ancient\\Mammoth" })
--玛格战士
_assets_model(":Units\\Creeps\\Magnataur\\Magnataur", "Magnataur", "unit", { Art = "unit\\ancient\\Magnataur" })
--玛格娜托破坏者
_assets_model(":Units\\Creeps\\MagnataurBlue\\MagnataurBlue", "MagnataurBlue", "unit", { Art = "unit\\ancient\\BlueMagnataur" })
--食人鬼战士
_assets_model(":units\\creeps\\Ogre\\Ogre", "Ogre", "unit", { Art = "unit\\beast\\Ogre" })
--食人鬼魔法师
_assets_model(":units\\creeps\\OgreMagi\\OgreMagi", "OgreMagi", "unit", { Art = "unit\\beast\\OgreMagi" })
--食人鬼首领
_assets_model(":units\\creeps\\OgreLord\\OgreLord", "OgreLord", "unit", { Art = "unit\\beast\\OgreLord" })
--鹰嘴野兽
_assets_model(":units\\creeps\\Owlbear\\Owlbear", "OwlBear", "unit", { Art = "unit\\beast\\OwlBear" })
--北极熊
_assets_model(":units\\creeps\\PolarBear\\PolarBear", "PolarBear", "unit", { Art = "unit\\beast\\FrostBear" })
--豪猪战士
_assets_model(":units\\creeps\\Bristleback\\Bristleback", "Bristleback", "unit", { Art = "unit\\animal\\Razorback" })
--豪猪医生
_assets_model(":units\\creeps\\RazorManeChief\\RazorManeChief", "RazorManeChief", "unit", { Art = "unit\\beast\\RazormaneChief" })
--死亡幽魂
_assets_model(":units\\creeps\\Revenant\\Revenant", "Revenant", "unit", { Art = "unit\\demon\\Revenant" })
--赛特斯刺客
_assets_model(":units\\creeps\\Satyr\\Satyr", "Satyr", "unit", { Art = "unit\\beast\\Satyr" })
--赛特斯影法师
_assets_model(":units\\creeps\\SatyrTrickster\\SatyrTrickster", "SatyrTrickster", "unit", { Art = "unit\\beast\\SatyrTrickster" })
--赛特斯地狱使者
_assets_model(":units\\creeps\\satyrhellcaller\\satyrhellcaller", "SatyrHellCaller", "unit", { Art = "unit\\beast\\Satyr" })
--女妖精(红)
_assets_model(":units\\demon\\Demoness\\Demoness", "Demoness", "unit", { Art = "unit\\demon\\Demoness" })
--女妖精(蓝)
_assets_model(":units\\demon\\DemonessBlue\\DemonessBlue", "DemonessBlue", "unit", { Art = "unit\\demon\\BlueDemoness" })
--图斯卡
_assets_model(":units\\creeps\\tuskar\\tuskar", "Tuskaar", "unit", { Art = "unit\\beast\\TuskaarNomad" })
--图斯卡枪兵
_assets_model(":units\\creeps\\tuskarRanged\\tuskarRanged", "TuskaarRanged", "unit", { Art = "unit\\beast\\TuskaarGold" })
--图斯卡法师
_assets_model(":units\\creeps\\tuskarLord\\tuskarLord", "TuskaarLord", "unit", { Art = "unit\\beast\\TuskaarBlack" })
--野人
_assets_model(":units\\creeps\\Sasquatch\\Sasquatch", "Sasquatch", "unit", { Art = "unit\\ancient\\Sasquatch" })
--丛林漫步者
_assets_model(":units\\creeps\\JungleBeast\\JungleBeast", "JungleBeast", "unit", { Art = "unit\\ancient\\JungleBeast" })
--雪怪
_assets_model(":units\\creeps\\Wendigo\\Wendigo", "Wendigo", "unit", { Art = "unit\\ancient\\Wendigo" })
--灰狼
_assets_model(":units\\creeps\\TimberWolf\\TimberWolf", "TimberWolf", "unit", { Art = "unit\\beast\\TimberWolf" })
--白狼
_assets_model(":units\\creeps\\WhiteWolf\\WhiteWolf", "WhiteWolf", "unit", { Art = "unit\\beast\\TimberWolf" })
--夜狼
_assets_model(":units\\creeps\\DireWolf\\DireWolf", "DireWolf", "unit", { Art = "unit\\beast\\TimberWolf" })

--海豹
_assets_model(":units\\critters\\Seal\\Seal", "Seal", "unit", { Art = "unit\\animal\\Seal" })
--浣熊
_assets_model(":units\\critters\\Raccoon\\Raccoon", "Racoon", "unit", { Art = "unit\\animal\\Racoon" })
--老鼠
_assets_model(":units\\critters\\Rat\\Rat", "Rat", "unit", { Art = "unit\\animal\\YouDirtyRat" })
--绵羊
_assets_model(":units\\critters\\Sheep\\Sheep", "Sheep", "unit", { Art = "unit\\animal\\Sheep" })
--螃蟹
_assets_model(":units\\critters\\SpiderCrab\\SpiderCrab", "SpiderCrab", "unit", { Art = "unit\\animal\\SpiderCrab" })
--螃蟹隐士
_assets_model(":units\\critters\\HermitCrab\\HermitCrab", "HermitCrab", "unit", { Art = "unit\\animal\\HermitCrab" })
--企鹅
_assets_model(":units\\critters\\Penguin\\Penguin", "Penguin", "unit", { Art = "unit\\animal\\Penguin" })
--青蛙
_assets_model(":units\\critters\\Frog\\Frog", "Forg", "unit", { Art = "unit\\animal\\Forg" })
--沙丘之虫
_assets_model(":units\\critters\\DuneWorm\\DuneWorm", "DuneWorm", "unit", { Art = "unit\\animal\\DuneWorm" })
--秃鹰
_assets_model(":units\\critters\\Vulture\\Vulture", "Vulture", "unit", { Art = "unit\\animal\\Vulture" })
--兔子
_assets_model(":units\\critters\\EasterRabbit\\EasterRabbit", "EasterRabbit", "unit", { Art = "unit\\animal\\CritterRabbit" })
--小鸡
_assets_model(":units\\critters\\EasterChicken\\EasterChicken", "EasterChicken", "unit", { Art = "unit\\animal\\CritterChicken" })
--小蜥蜴
_assets_model(":units\\critters\\Skink\\Skink", "Skink", "unit", { Art = "unit\\animal\\Skink" })
--信天翁
_assets_model(":units\\critters\\Albatross\\Albatross", "Albatross", "unit", { Art = "unit\\animal\\Albatross" })
--雄鹿
_assets_model(":units\\critters\\BlackStagMale\\BlackStagMale", "BlackStagMale", "unit", { Art = "unit\\animal\\Stag" })
--雪鹰
_assets_model(":units\\critters\\SnowOwl\\SnowOwl", "SnowOwl", "unit", { Art = "unit\\animal\\SnowOwl" })
--鬃狼
_assets_model(":units\\critters\\BrownWolf\\BrownWolf", "BrownWolf", "unit", { Art = "unit\\animal\\Wolf" })
--豪猪
_assets_model(":units\\critters\\Felboar\\Felboar", "Felboar", "unit", { Art = "unit\\animal\\FelBoar" })
--野猪
_assets_model(":units\\critters\\Pig\\Pig", "Pig", "unit", { Art = "unit\\animal\\Pig" })
--虫族小狗
_assets_model(":Units\\Critters\\zergling\\zergling", "Zergling", "unit", { Art = "unit\\animal\\Zergling" })

--人族运输船
_assets_model(":units\\creeps\\HumanTransportShip\\HumanTransportShip", "HumanTransportShip", "unit", { Art = "unit\\machine\\HumanTransport" })
--人族护卫舰
_assets_model(":units\\creeps\\HumanDestroyerShip\\HumanDestroyerShip", "HumanDestroyerShip", "unit", { Art = "unit\\machine\\HumanDestroyer" })
--人族战舰
_assets_model(":units\\creeps\\HumanBattleship\\HumanBattleship", "HumanBattleShip", "unit", { Art = "unit\\machine\\HumanBattleShip" })
--兽族运输船
_assets_model(":units\\creeps\\OrcishTransportShip\\OrcishTransportShip", "OrcTransportShip", "unit", { Art = "unit\\machine\\OrcishTransport" })
--兽族护卫舰
_assets_model(":units\\creeps\\OrcishDestroyerShip\\OrcishDestroyerShip", "OrcDestroyerShip", "unit", { Art = "unit\\machine\\OrcDestroyer" })
--兽族魔力战舰
_assets_model(":Units\\Critters\\OrcJuggernaught\\OrcJuggernaught", "OrcBattleShip", "unit", { Art = "unit\\machine\\Juggernaut" })
--不死族运输船
_assets_model(":units\\creeps\\UndeadTransportShip\\UndeadTransportShip", "UndeadTransportShip", "unit", { Art = "unit\\machine\\UndeadTransport" })
--不死族护卫舰
_assets_model(":units\\creeps\\UndeadDestroyerShip\\UndeadDestroyerShip", "OrcDestroyerShip", "unit", { Art = "unit\\machine\\UndeadDestroyer" })
--不死族战舰
_assets_model(":units\\creeps\\UndeadShipBattleShip\\UndeadShipBattleShip", "OrcBattleShip", "unit", { Art = "unit\\machine\\UndeadBattleShip" })
--暗夜运输船
_assets_model(":units\\nightelf\\NightElfTransportShip\\NightElfTransportShip", "NightElfTransportShip", "unit", { Art = "unit\\machine\\NightElfTransport" })
--暗夜护卫舰
_assets_model(":units\\nightelf\\NightElfDestroyerShip\\NightElfDestroyerShip", "NightElfDestroyerShip", "unit", { Art = "unit\\machine\\NightElfDestroyer" })
--暗夜战舰
_assets_model(":units\\creeps\\NightElfBattleship\\NightElfBattleship", "NightElfBattleShip", "unit", { Art = "unit\\machine\\NightElfFishingBoat" })
--战船
_assets_model(":doodads\\northrend\\water\\Battleship\\Battleship", "BattleShip", "unit", { Art = "unit\\machine\\BattleShip" })
--不死族飞艇
_assets_model(":units\\undead\\UndeadAirBarge\\UndeadAirBarge", "UndeadAirBarge", "unit", { Art = "unit\\machine\\UndeadAirBarge" })
--精灵车
_assets_model(":units\\other\\BloodElfWagon\\BloodElfWagon", "ElfPrisonWagon", "unit", { Art = "unit\\machine\\IllidanPrisonWagon" })
--囚车
_assets_model(":units\\other\\IllidanEvilCaged\\IllidanEvilCaged", "IllidanPrisonWagon", "unit", { Art = "unit\\machine\\CagedIllidan" })
--达拉内尔粉碎者
_assets_model(":units\\orc\\catapult\\catapult", "CatapultDraenei", "unit", { Art = "unit\\machine\\Catapult" })
--地狱机关人
_assets_model(":units\\creeps\\InfernalCannonCannon\\InfernalCannonCannon", "InfernalCannonCannon", "unit", { Art = "unit\\machine\\InfernalCannon" })
--地狱战舰
_assets_model(":units\\creeps\\InfernalCannonFlame\\InfernalCannonFlame", "InfernalCannonFlame", "unit", { Art = "unit\\machine\\InfernalFlameCannon" })
--地精地雷
_assets_model(":units\\creeps\\GoblinLandMine\\GoblinLandMine", "GoblinLandMine", "unit", { Art = "item\\misc\\GoblinLandMine" })
--地精飞艇
_assets_model(":units\\creeps\\GoblinZeppelin\\GoblinZeppelin", "GoblinZeppelin", "unit", { Art = "unit\\machine\\GoblinZeppelin" })
--地精工兵
_assets_model(":units\\creeps\\GoblinSapper\\GoblinSapper", "GoblinSapper", "unit", { Art = "unit\\machine\\GoblinSapper" })
--地精撕裂者
_assets_model(":units\\creeps\\IronGolem\\IronGolem", "GoblinIronGolem", "unit", { Art = "unit\\machine\\JunkGolem" })

--马里恩(冲锋枪小哥)
_assets_model(":Units\\Critters\\Marine\\Marine", "Marine", "unit", { Art = "unit\\human\\Marine" })
--邪恶空间兽人(冲锋枪兽人)
_assets_model(":Units\\Critters\\ChaosSpaceOrc\\ChaosSpaceOrc", "ChaosSpaceOrc", "unit", { Art = "unit\\beast\\ChaosSpaceOrc" })
--村民男1
_assets_model(":units\\critters\\VillagerMan\\VillagerMan", "VillagerMan1", "unit", { Art = "unit\\human\\VillagerMan" })
--村民男2
_assets_model(":units\\critters\\VillagerMan1\\VillagerMan1", "VillagerMan2", "unit", { Art = "unit\\human\\VillagerMan1" })
--村民女1
_assets_model(":units\\critters\\VillagerWoman\\VillagerWoman", "VillagerWoman1", "unit", { Art = "unit\\human\\VillagerWoman" })
--村民小孩1
_assets_model(":units\\critters\\VillagerKid\\VillagerKid", "VillagerKid1", "unit", { Art = "unit\\human\\VillagerKid" })
--村民小孩2
_assets_model(":units\\critters\\VillagerKid1\\VillagerKid1", "VillagerKid2", "unit", { Art = "unit\\human\\VillagerKid2" })

--【 物品模型 】

--物品宝箱
_assets_model(":Objects\\InventoryItems\\TreasureChest\\treasurechest.mdl", "TreasureChest", "item")
--物品灵魂神符（紫色符文）
_assets_model(":Objects\\InventoryItems\\runicobject\\runicobject.mdl", "RunicObject", "item")
--物品防御浮雕（橙色符文）
_assets_model(":Objects\\InventoryItems\\Glyph\\Glyph.mdl", "Glyph", "item")
--物品金币
_assets_model(":Objects\\InventoryItems\\PotofGold\\PotofGold.mdl", "PotOfGold", "item")
--物品木材
_assets_model(":Objects\\InventoryItems\\BundleofLumber\\BundleofLumber.mdl", "BundleOfLumber", "item")
--物品书(生命之书)
_assets_model(":Objects\\InventoryItems\\tome\\tome.mdl", "Tome", "item")
--物品书：褐色(经验之书)
_assets_model(":Objects\\InventoryItems\\tomeBrown\\tomeBrown.mdl", "TomeBrown", "item")
--物品书：红色(力量之书)
_assets_model(":Objects\\InventoryItems\\tomeRed\\tomeRed.mdl", "TomeRed", "item")
--物品书：蓝色(智力之书)
_assets_model(":Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl", "TomeBlue", "item")
--物品书：绿色(敏捷之书)
_assets_model(":Objects\\InventoryItems\\tomeGreen\\tomeGreen.mdl", "TomeGreen", "item")
--物品荧光草
_assets_model(":Objects\\InventoryItems\\Shimmerweed\\Shimmerweed.mdl", "ShimmerWeed", "item")
--物品影子之球
_assets_model(":Objects\\InventoryItems\\CrystalShard\\CrystalShard.mdl", "CrystalShard", "item")
--物品问号
_assets_model(":Objects\\InventoryItems\\QuestionMark\\QuestionMark.mdl", "QuestionMark", "item")
--物品凤凰蛋
_assets_model(":Units\\Human\\Phoenix\\PhoenixEgg.mdl", "PhoenixEgg", "item")
--物品蜥蜴蛋
_assets_model(":Objects\\InventoryItems\\ThunderLizardEgg\\ThunderLizardEgg.mdl", "ThunderLizardEgg", "item")
--礼物
_assets_model(":Objects\\InventoryItems\\BundleofGifts\\BundleofGifts.mdl", "BundleOfGifts", "item")

