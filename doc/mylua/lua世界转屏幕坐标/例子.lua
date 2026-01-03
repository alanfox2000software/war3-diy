local CJ = require "jass.common"
local Vec3 = require "3dmath.vec3"
local Camera = require "3dmath.camera"

local unit = 一个单位
local x = CJ.GetUnitX(unit)
local y = CJ.GetUnitX(unit)
--因为魔兽是z轴朝上所以这里 y和z换下位置
local vec3 = Vec3.new(x, 100, y)
vec3 = Camera.WorldToScreen(vec3)
print("屏幕x",0.8 - vec3.x * 0.8)
print("屏幕y",vec3.y * 0.6)

