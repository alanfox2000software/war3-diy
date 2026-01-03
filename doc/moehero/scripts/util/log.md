## log
- 日志的处理

```lua
log.path = '我的英雄不可能那么萌\\日志\\' .. split(log.path, '\\')[2]
log.debug '日志系统装载完毕,向着星辰大海出击!'

-- 重载prit
local std_print = print
function print(...)
	log.info(...)
	return std_print(...)
end
```
