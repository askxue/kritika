-- �߼������

service = {}

-- �����Ƿ�����ĳ��
service.hasDoneEvent = function(event, role)
    return log.find(event, role) ~= nil
end

-- �����Ƿ��չ��ʼ�
service.hasDoneEmail = function()
    return service.hasDoneEvent(enum.events.email, currentRole)
end

-- �����Ƿ�ˢ������BOSS��
service.hasDoneBoss = function()
    return service.hasDoneEvent(enum.events.boss, currentRole)
end

-- �����Ƿ�ˢ�� (ˢ��CD 1h)
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
