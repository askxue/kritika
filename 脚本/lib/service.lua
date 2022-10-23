-- �߼������

service = {}

-- �����Ƿ�����ĳ��
service.hasDoneEvent = function(event, role)
    return log.find(event, role) ~= nil
end

-- �����Ƿ��չ��ʼ�
service.hasDoneEmail = function()
    return service.hasDoneEvent(enum.dailyEvents.email, currentRole)
end

-- �����Ƿ�ˢ������BOSS��
service.hasDoneBoss = function()
    return service.hasDoneEvent(enum.dailyEvents.boss, currentRole)
end

-- �����Ƿ񹫻�ǩ����
service.hasSign = function()
    return service.hasDoneEvent(enum.dailyEvents.sign, currentRole)
end

-- �����Ƿ�ˢ�� (ˢ��CD 1h)
service.isMarketRefresh = function()
    local lastTime = db.read(db.events.market, currentRole)
    if lastTime ~= nil then
        return date.diffHour(lastTime, os.time()) > 1
    else
        return true
    end
end

return service
