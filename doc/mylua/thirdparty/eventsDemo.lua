local EventEmitter = require "events"

local myObject = {
    name = "foo",
    greet = function ()
        print("Hello")
    end
}

myObject = EventEmitter:new(myObject)

myObject:on("knock",function ()
    print("myObject knock")
end)

myObject:emit("knock");


-- 
local hub = EventEmitter:new();
hub:on("sing",function (who)
    print(who,"is sing")
end)

hub:emit("sing","John")


local callback = function (something)
    print("says",something)
end

hub:on("greeting",callback);
hub:emit("greeting","whu");