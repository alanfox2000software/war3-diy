require "extensions.functions"

---@class Vec3
---@field _new function
local Vec3 = Class("Vec3")

---@return Vec3
function Vec3.subtract(v1, v2)
    return Vec3.new(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
end

function Vec3.cross(v1, v2)
    return Vec3.new((v1.y * v2.z) - (v1.z * v2.y),
                    (v1.z * v2.x) - (v1.x * v2.z), (v1.x * v2.y) - (v1.y * v2.x))
end

function Vec3.dot(v1, v2) return (v1.x * v2.x + v1.y * v2.y + v1.z * v2.z); end

---创建新实例
---@param x number
---@param y number
---@param z number
---@return Vec3
function Vec3.new(x, y, z) return Vec3._new(x, y, z) end

function Vec3:ctor(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function Vec3:normalize()
    local n = self.x * self.x + self.y * self.y + self.z * self.z;
    -- Already normalized.
    if n == 1.0 then return end

    n = math.sqrt(n);
    -- Too close to zero.
    if n < 2e-37 then return; end

    n = 1.0 / n;
    self.x = self.x * n;
    self.y = self.y * n;
    self.z = self.z * n;
end

function Vec3.TransformMat4(a, m)
    local x = a.x;
    local y = a.y;
    local z = a.z;
    local rhw = m.m03 * x + m.m07 * y + m.m11 * z + m.m15;
    rhw = rhw and math.abs(1 / rhw) or 1;
    return Vec3.new((m.m00 * x + m.m04 * y + m.m08 * z + m.m12) * rhw,
                    (m.m01 * x + m.m05 * y + m.m09 * z + m.m13) * rhw,
                    (m.m02 * x + m.m06 * y + m.m10 * z + m.m14) * rhw)
end

return Vec3
