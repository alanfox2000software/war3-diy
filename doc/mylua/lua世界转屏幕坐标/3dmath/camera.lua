local CJ = require "jass.common"
local Vec3 = require "3dmath.vec3"
local Mat4 = require "3dmath.mat4"

---@class Camera
---摄像机类
local Camera = {}

local _curTransform = 0
local _matProj = Mat4.perspective(55 * (3.14159/ 180.0), 800/600, 1.0, 1000.0, false,
                                     -1, 1, 0)

function Camera.GetView()
    local eye = Vec3.new(CJ.GetCameraEyePositionX(), CJ.GetCameraEyePositionZ(),
                         CJ.GetCameraEyePositionY())
    local target = Vec3.new(CJ.GetCameraTargetPositionX(),
                            CJ.GetCameraTargetPositionZ(),
                            CJ.GetCameraTargetPositionY())
    local up = Vec3.new(0, 1, 0)
    return Mat4.lookAt(eye, target, up)
end

function Camera.WorldToScreen(worldPos)
    local _matViewProj = Mat4.Multiply(_matProj, Camera.GetView())
    local preTransform = Mat4.preTransforms[_curTransform]
    local out = Vec3.TransformMat4(worldPos, _matViewProj)

    local x, y = out.x, out.y
    out.x = x * preTransform[0] + y * preTransform[2]
    out.y = x * preTransform[1] + y * preTransform[3]

    out.x = (out.x + 1) * 0.5
    out.y = (out.y + 1) * 0.5
    out.z = out.z * 0.5 + 0.5

    return out
end

return Camera
