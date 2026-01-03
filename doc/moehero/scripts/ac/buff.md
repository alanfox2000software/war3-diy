## buff
- buff的模拟封装实现
## 属性
## 函数
## 挂载到unit
## 注册创建接口到ac
- 封装的创建buff接口
```lua
ac.buff = setmetatable({}, {__index = function (self, key)
	local obj = {}
	obj.name = key
	obj.__index = obj
	setmetatable(obj, buff)
	self[key] = obj
	return obj
end})
```
