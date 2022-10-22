-- 逻辑服务层

service = {}

-- 今天是否做过某事
service.hasDoneEvent = function(event, role)
    return log.find(event, role) ~= nil
end

-- 今天是否收过邮件
service.hasDoneEmail = function()
    return service.hasDoneEvent(enum.events.email, currentRole)
end

-- 今天是否刷过世界BOSS了
service.hasDoneBoss = function()
    return service.hasDoneEvent(enum.events.boss, currentRole)
end

-- 黑市是否刷新 (刷新CD 1h)
service.isMarketRefresh = function()
    local line = log.find(enum.events.market, currentRole)
    if line ~= nil then
        local lastTime = line[4]
        return date.diffHour(lastTime, os.time()) > 1
    else
        return true
    end
end

return service
