-- һЩ������

util = {}

-- �����ӳ�
-- ����ָ���ӳٵ�ʱ���������ָ����ͳһ�ӳ�һ��ʱ�䡣
-- ��ͨ��UI��������
util.delay = function(millisecond)
    if millisecond ~= nil then
        sleep(millisecond)
    else
        sleep(tonumber(config.settings.delay))
    end
end

return util
