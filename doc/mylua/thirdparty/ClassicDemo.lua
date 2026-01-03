print("demo")

--- @class Object
--- @field new function
--- @field extend function
--- @field implement function
--- @field is function
--- @field __tostring function
Object = require "classic"

--- @class Point : Object
--- @field x number
--- @field y number
Point = Object:extend();

function Point:new(x, y)
    self.x = x or 0;
    self.y = y or 0;
end

---@return number
function Point:getScaled()
    return self.x * Point.scale, self.y * Point.scale
end

Point.scale = 2;

--- @type Point
local p = Point(10, 20)
print("p.x", p.x)
print("p.y", p.y)


print("scaled", p:getScaled())

Point.scale = 3
---@type Point
local p2 = Point(20, 30)
print("scaled", p2:getScaled())


-- 属性处理
--- @class Attr : Object
Attr = Object:extend();

function Attr:setProp()

end

function Attr:addProp()

end

function Attr:subProp()

end


--- @class AttackAttr : Attr
AttackAttr = Attr:extend()
