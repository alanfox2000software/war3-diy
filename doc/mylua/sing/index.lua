TPL_UNIT.Footman = UnitTpl("Footman")
    .abilitySlot({ TPL_ABILITY.ZZJY })
    .move(522)http2: Transport: cannot retry err [%v] after Request.Body was written; define Request.GetBody to avoid this error3940200619639447921227904010014361380507973927046544666794829340424572177149687032904726608825893800186160697311231939402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643-- 资源设定
Game().worth("lumber", "木头", { "gold", 1000000 }) -- 1木 = 1000000金
Game().worth("gold", "黄金")---@param this Bgm
Class("Bgm")
    .construct(
    function(this)
        PropChange(this, "volume", "std", 100, false)
    end)011839296a789a3bc0045c8a5fb42c7d1bd998f54449579b446817afbd17273e662c97ee72995ef42640c550b9013fad0761353c7086a272c24088be94769fd166500051953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f0000c6858e06b70404e9cd9e3ecb662395b4429c648139053fb521f828af606b4d3dbaa14b5e77efe75928fe1dc127a2ffa8de3348b3c1856a429bf97e7e31c2e5bd6668647976601306097149819007990813932172694353001433054093944634591855431833976560521225596406614545549772963113914808580371219879997166438125740282911150571516864797660130609714981900799081393217269435300143305409394463459185543183397655394245057746333217197532963996371363321113864768612440380340372808892707005449---@param this AbilitySlot
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
00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899---@param this FrameModel
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