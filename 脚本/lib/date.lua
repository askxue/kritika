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

return date
