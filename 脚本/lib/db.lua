-- ���ݳ־ò�

db = {}

-- ��ʼ������Դ����
db.init = function()
    local handle, err = mysql_connect(config.db.host, config.db.port, config.db.database, config.db.username, config.db.password)
    if handle ~= nil then
        print("�������ݿ�ɹ�");
        -- db�Ự���
        db.handle = handle
    else
        print(string.format("����ʧ�ܣ�����ԭ�� %s", err))
        exitScript()
    end
end

db.insert = function()
    -- TODO ���ݿ� CRUD
end

-- ��ʵ���ڴ�����ݴ洢�������ű����ݶ�ʧ�����ʺϴ��һЩ����Ҫ�־û������ݣ�
db.events = {
    -- �����
    market = "market"
}
db.market = {}

-- ��¼ĳ�¼�������ʱ��
db.write = function(event, role)
    db[event][role] = os.time()
end

-- ��ȡĳʱ�䷢����ʱ��
db.read = function(event, role)
    return db[event][role]
end

return db
