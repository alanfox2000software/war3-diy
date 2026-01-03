## 计时器实现
- timer
- action
- action_queue
  
## 注册计时器核心
```lua
jass.TimerStart(jtimer, 0.01, true, function()
    local detla = 10

    -- 如果cur_index不等于0，则帧率后退
    -- 这里代表的是上一帧的序列没执行完成时，当前计时器回退1个scale
    if realTimer.cur_index ~= 0 then
        realTimer.scale_frame = realTimer.scale_frame - realTimer.scale
    end

    -- 每次调用执行delta次
    for i = 1, detla, 1 do
        realTimer:on_update()
        -- print("on_update")
    end

end)

-- 计时器回调
function timer:on_update()
    self.scale_frame = self.scale_frame + self.scale
    local frame_count = self.scale_frame // 1 - self.last_scale_frame // 1
    for i = 1, frame_count, 1 do
        timer_on_tick(self)
        self.cur_frame = self.cur_frame + 1
    end
    self.last_scale_frame = self.scale_frame
end


local function timer_on_tick(timer)
    local action_queue = timer.frame_queue[timer.cur_frame]
    -- 如果在当前帧没有委托序列
    if action_queue == nil then
        -- 设置当前序列为0
        timer.cur_index = 0
        return
    end
    -- 执行当前帧的全部委托并清空当前帧的全部委托
    for i = timer.cur_index + 1, #action_queue do
        timer.cur_index = i
        local action = action_queue[i]
        if action then action:invoke() end
        action_queue[i] = nil
    end
    -- 此时当前帧执行完毕
    -- 重置当前帧的序列为0
    timer.cur_index = 0
    -- 清空当前帧
    timer.frame_queue[timer.cur_frame] = nil
    -- 回收此队列
    table.insert(timer.frame_queue, action_queue)
end
```