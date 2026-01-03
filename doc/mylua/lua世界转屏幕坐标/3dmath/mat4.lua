require "extensions.functions"

---@class Mat4
---@field _new function
local Mat4 = Class("Mat4")

Mat4.preTransforms = {
    [0] = {[0] = 1, [1] = 0, [2] = 0, [3] = 1},
    [1] = {[0] = 0, [1] = 1, [2] = -1, [3] = 0},
    [2] = {[0] = -1, [1] = 0, [2] = 0, [3] = -1},
    [3] = {[0] = 0, [1] = -1, [2] = 1, [3] = 0}
}

function Mat4.IDENTITY()
    return Mat4.new(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,
                    0.0, 0.0, 0.0, 1.0)
end

function Mat4.fromTranslation(v)
    local out = Mat4.new()
    out.m00 = 1;
    out.m01 = 0;
    out.m02 = 0;
    out.m03 = 0;
    out.m04 = 0;
    out.m05 = 1;
    out.m06 = 0;
    out.m07 = 0;
    out.m08 = 0;
    out.m09 = 0;
    out.m10 = 1;
    out.m11 = 0;
    out.m12 = v.x;
    out.m13 = v.y;
    out.m14 = v.z;
    out.m15 = 1;
    return out;
end

function Mat4.lookAt(eye, center, up)
    local eyex = eye.x;
    local eyey = eye.y;
    local eyez = eye.z;
    local upx = up.x;
    local upy = up.y;
    local upz = up.z;
    local centerx = center.x;
    local centery = center.y;
    local centerz = center.z;

    local z0 = eyex - centerx;
    local z1 = eyey - centery;
    local z2 = eyez - centerz;

    local len = 1 / math.sqrt(z0 * z0 + z1 * z1 + z2 * z2);
    z0 = z0 * len;
    z1 = z1 * len;
    z2 = z2 * len;

    local x0 = upy * z2 - upz * z1;
    local x1 = upz * z0 - upx * z2;
    local x2 = upx * z1 - upy * z0;
    len = 1 / math.sqrt(x0 * x0 + x1 * x1 + x2 * x2);
    x0 = x0 * len;
    x1 = x1 * len;
    x2 = x2 * len;

    local y0 = z1 * x2 - z2 * x1;
    local y1 = z2 * x0 - z0 * x2;
    local y2 = z0 * x1 - z1 * x0;

    local out = Mat4.new()
    out.m00 = x0;
    out.m01 = y0;
    out.m02 = z0;
    out.m03 = 0;
    out.m04 = x1;
    out.m05 = y1;
    out.m06 = z1;
    out.m07 = 0;
    out.m08 = x2;
    out.m09 = y2;
    out.m10 = z2;
    out.m11 = 0;
    out.m12 = -(x0 * eyex + x1 * eyey + x2 * eyez);
    out.m13 = -(y0 * eyex + y1 * eyey + y2 * eyez);
    out.m14 = -(z0 * eyex + z1 * eyey + z2 * eyez);
    out.m15 = 1;

    return out;
end

function Mat4.perspective(fov, aspect, near, far, isFOVY, minClipZ,
                          projectionSignY, orientation)
    local f = 1.0 / math.tan(fov / 2)
    local nf = 1 / (near - far)

    local x = isFOVY and f / aspect or f
    local y = (isFOVY and f or f * aspect) * projectionSignY
    local preTransform = Mat4.preTransforms[orientation]

    local out = Mat4.new()
    out.m00 = x * preTransform[0]
    out.m01 = x * preTransform[1]
    out.m02 = 0
    out.m03 = 0
    out.m04 = y * preTransform[2]
    out.m05 = y * preTransform[3]
    out.m06 = 0
    out.m07 = 0
    out.m08 = 0
    out.m09 = 0
    out.m10 = (far - minClipZ * near) * nf
    out.m11 = -1
    out.m12 = 0
    out.m13 = 0
    out.m14 = far * near * nf * (1 - minClipZ)
    out.m15 = 0
    return out
end

function Mat4.Ortho(left, right, bottom, top, near, far, minClipZ,
                    projectionSignY, orientation)
    local lr = 1 / (left - right);
    local bt = 1 / (bottom - top) * projectionSignY;
    local nf = 1 / (near - far);

    local x = -2 * lr;
    local y = -2 * bt;
    local dx = (left + right) * lr;
    local dy = (top + bottom) * bt;
    local preTransform = Mat4.preTransforms[orientation];

    local out = Mat4.new()
    out.m00 = x * preTransform[0];
    out.m01 = x * preTransform[1];
    out.m02 = 0;
    out.m03 = 0;
    out.m04 = y * preTransform[2];
    out.m05 = y * preTransform[3];
    out.m06 = 0;
    out.m07 = 0;
    out.m08 = 0;
    out.m09 = 0;
    out.m10 = nf * (1 - minClipZ);
    out.m11 = 0;
    out.m12 = dx * preTransform[0] + dy * preTransform[2];
    out.m13 = dx * preTransform[1] + dy * preTransform[3];
    out.m14 = (near - minClipZ * far) * nf;
    out.m15 = 1;
    return out;
end

function Mat4.Multiply(m1, m2)
    local a00 = m1.m00
    local a01 = m1.m01
    local a02 = m1.m02
    local a03 = m1.m03
    local a10 = m1.m04
    local a11 = m1.m05
    local a12 = m1.m06
    local a13 = m1.m07
    local a20 = m1.m08
    local a21 = m1.m09
    local a22 = m1.m10
    local a23 = m1.m11
    local a30 = m1.m12
    local a31 = m1.m13
    local a32 = m1.m14
    local a33 = m1.m15

    local out = Mat4.new()
    -- Cache only the current line of the second matrix
    local b0 = m2.m00
    local b1 = m2.m01
    local b2 = m2.m02
    local b3 = m2.m03
    out.m00 = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30
    out.m01 = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31
    out.m02 = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32
    out.m03 = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33

    b0 = m2.m04
    b1 = m2.m05
    b2 = m2.m06
    b3 = m2.m07
    out.m04 = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30
    out.m05 = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31
    out.m06 = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32
    out.m07 = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33

    b0 = m2.m08
    b1 = m2.m09
    b2 = m2.m10
    b3 = m2.m11
    out.m08 = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30
    out.m09 = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31
    out.m10 = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32
    out.m11 = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33

    b0 = m2.m12
    b1 = m2.m13
    b2 = m2.m14
    b3 = m2.m15
    out.m12 = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30
    out.m13 = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31
    out.m14 = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32
    out.m15 = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33
    return out
end

---创建新实例
---@return Mat4
function Mat4.new(m00, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11,
                  m12, m13, m14, m15)
    return Mat4._new(m00, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11,
                     m12, m13, m14, m15)
end

function Mat4:ctor(m00, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11,
                   m12, m13, m14, m15)
    if m11 then
        self:set(m00, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11,
                 m12, m13, m14, m15)
    end
end

function Mat4:set(m00, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11,
                  m12, m13, m14, m15)
    self.m00 = m00
    self.m01 = m01
    self.m02 = m02
    self.m03 = m03
    self.m04 = m04
    self.m05 = m05
    self.m06 = m06
    self.m07 = m07
    self.m08 = m08
    self.m09 = m09
    self.m10 = m10
    self.m11 = m11
    self.m12 = m12
    self.m13 = m13
    self.m14 = m14
    self.m15 = m15
end

return Mat4
