## event
- 事件机制实现

## 注册事件
- obj.events.name
- 返回一个接受回调函数的接口
```lua
function ac.event_register(obj, name)end
```
## 分发事件
- 调用注册的世界
```lua
function ac.event_dispatch(obj, name, ...)end
function ac.event_notify(obj, name, ...)end
```
## 注册到ac.game
```lua
function ac.game:event_dispatch(name, ...)
	return ac.event_dispatch(self, name, ...)
end

function ac.game:event_notify(name, ...)
	return ac.event_notify(self, name, ...)
end

function ac.game:event(name)
	return ac.event_register(self, name)
end
```