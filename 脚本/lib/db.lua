-- ���ݳ־ò�
local config = require "lib.config"

db = {}

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

return db
