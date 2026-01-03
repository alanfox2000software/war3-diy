## trigger
- 触发器的封装
- 属性
- 函数
  
## 注册到ac
```lua
--创建触发器
function ac.trigger(event, callback)
	local trg = setmetatable({event = event, callback = callback}, mt)
	table.insert(event, trg)
	return trg
end
```