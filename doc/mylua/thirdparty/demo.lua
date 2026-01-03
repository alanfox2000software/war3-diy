-- local a = {a = 1}
-- print(a.a)

-- local b = a;
-- b.a = 2;
-- print(a.a)


--- 输出详尽内容
---@param value any 输出的table
---@param description string 调试信息格式
---@param nesting number | nil 输出时的嵌套层级，默认为 10
function dump(value, description, nesting)
    if type(nesting) ~= "number" then nesting = 10 end
    local lookup  = {}
    local result  = {}
    -- local traceback = string.explode("\n", debug.traceback("", 2))
    -- local str = "- dump from: " .. string.trim(traceback[3])
    local str     = "";
    local _format = function(v)
        if type(v) == "string" then
            v = "\"" .. v .. "\""
        end
        return tostring(v)
    end
    local _dump
    _dump         = function(val, desc, indent, nest, keyLen)
        desc = desc or "<var>"
        local spc = ""
        if type(keyLen) == "number" then
            spc = string.rep(" ", keyLen - string.len(_format(desc)))
        end
        if type(val) ~= "table" then
            result[#result + 1] = string.format("%s%s%s = %s", indent, _format(desc), spc, _format(val))
        elseif lookup[tostring(val)] then
            result[#result + 1] = string.format("%s%s%s = *REF*", indent, _format(desc), spc)
        else
            lookup[tostring(val)] = true
            if nest > nesting then
                result[#result + 1] = string.format("%s%s = *MAX NESTING*", indent, _format(desc))
            else
                result[#result + 1] = string.format("%s%s = {", indent, _format(desc))
                local indent2 = indent .. "    "
                local keys = {}
                local kl = 0
                local vs = {}
                for k, v in pairs(val) do
                    if k ~= "___message" then
                        keys[#keys + 1] = k
                        local vk = _format(k)
                        local vkl = string.len(vk)
                        if vkl > kl then kl = vkl end
                        vs[k] = v
                    end
                end
                table.sort(keys, function(a, b)
                    if type(a) == "number" and type(b) == "number" then
                        return a < b
                    else
                        return tostring(a) < tostring(b)
                    end
                end)
                for _, k in ipairs(keys) do
                    _dump(vs[k], k, indent2, nest + 1, kl)
                end
                result[#result + 1] = string.format("%s}", indent)
            end
        end
    end
    _dump(value, description, " ", 1)
    str = str .. "\n" .. table.concat(result, "\n")
    print(str)
end

local config = {
    ATK1 = "攻击+10",
    ATK2 = "攻击+30"
}
local desc = "@ATK1@\n@ATK2@"
local res = string.gsub(desc,"@(%w*)@",config)
print(res)

local t = "level_wc_dd_cc_capacity*(1+(ww_wc_capacity+skill_wc_capacity+gh_wc_capacity)/10000)";
for w in string.gmatch(t,"((%w*_)*_%w*)") do
    print(w)
end


-- require "ClassicDemo"