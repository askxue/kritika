-- 一些工具类

util = {}

-- 动作延迟
-- 可以指定延迟的时长，如果不指定，统一延迟一定时间。
-- 可通过UI界面配置
util.delay = function(millisecond)
    if millisecond ~= nil then
        sleep(millisecond)
    else
        sleep(tonumber(config.settings.delay))
    end
end

return util
