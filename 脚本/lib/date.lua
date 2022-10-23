-- ����ʱ�乤��

date = {}

-- ��ǰʱ��
date.now = function()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- ��ǰ����
date.today = function()
    return os.date("%Y-%m-%d")
end

-- ����
date.currentMonth = function()
    return os.date("%Y-%m")
end

-- �Ƚ�����ʱ��֮�������Сʱ
date.diffHour = function(from, to)
    local fromHour = os.date("*t", from).hour
    local toHour = os.date("*t", to).hour
    return toHour - fromHour
end

return date
