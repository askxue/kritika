-- 日期时间工具

date = {}

-- 当前时间
date.now = function()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- 当前日期
date.today = function()
    return os.date("%Y-%m-%d")
end

-- 比较两个时间之间相隔的小时
date.diffHour = function(from, to)
    local fromHour = os.date("*t", from).hour
    local toHour = os.date("*t", to).hour
    return toHour - fromHour
end

return date
