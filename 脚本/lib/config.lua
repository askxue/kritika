-- һЩ����

config = {}

-- ����Դ
config.db = {
    host = "192.168.0.110",
    port = 3307,
    username = "kritika",
    password = "Abc!123456",
    database = "kritika"
}

-- log��־�ļ���Ŀ¼ (�����SD��)
config.logDir = "/com.xue65535.kritika/log"

-- ����
config.settings = {
    -- �����ӳ٣�ÿ�ζ������ͣ��ʱ�䣬�������Ϸ���٣����������̬������
    delay = 3000
}

-- UI����
config.ui = "kritika.ui"


-- ��������
config.load = function()
    toast('��������UI')
    local action, arr = showUI(config.ui, 720, 1280)
    for key, value in pairs(arr) do
        config.settings[key] = value
    end
    toast('���ü������')
end

return config
