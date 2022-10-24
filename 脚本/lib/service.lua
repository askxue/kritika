-- 逻辑服务层

service = {}

-- 今天是否做过某事
service.hasDoneEvent = function(event, role)
    return log.find(event, role) ~= nil
end

-- 本月是否做过某事
service.hasDoneEventMonthly = function(event, role)
    return log.find(event, role, true) ~= nil
end

-- 今天是否收过邮件
service.hasDoneEmail = function()
    return service.hasDoneEvent(enum.dailyEvents.email, currentRole)
end

-- 今天是否刷过世界BOSS了
service.hasDoneBoss = function()
    return service.hasDoneEvent(enum.dailyEvents.boss, currentRole)
end

-- 今天是否公会签到了
service.hasSign = function()
    return service.hasDoneEvent(enum.dailyEvents.sign, currentRole)
end

-- 是否做过每日任务了
service.hasDoneDaily = function()
    return service.hasDoneEvent(enum.dailyEvents.daily, currentRole)
end

-- 本月是否刷过试练塔了
service.hasClearTower = function(type)
    return service.hasDoneEventMonthly(type, currentRole)
end

-- 黑市是否刷新 (刷新CD 1h)
service.isMarketRefresh = function()
    local lastTime = db.read(db.events.market, currentRole)
    if lastTime ~= nil then
        return date.diffHour(lastTime, os.time()) > 1
    else
        return true
    end
end

return service
