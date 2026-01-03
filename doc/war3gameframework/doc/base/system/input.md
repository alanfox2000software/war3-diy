## input
- 按键处理

## 注册本地键事件
```lua
function input.init()
    -- keycode与文本的对应表 
    input.key_to_char = {}
    for key, value in pairs(message.keyboard) do
        input.key_to_char[value] = key
    end

    -- 注册本地键盘事件
    regist_local_keyevent()

    -- 异步作弊指令
    asyncInputKeyCode()

end
local function regist_local_keyevent()
local key_record = {}
    local key_cast = {}

    -- 本地键盘事件（全都是本地事件）
    function message.hook(msg)
    end

    -- 长按事件
end
```