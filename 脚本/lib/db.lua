-- 数据持久层
local config = require "lib.config"

db = {}

-- 初始化数据源连接
db.init = function()
    local handle, err = mysql_connect(config.db.host, config.db.port, config.db.database, config.db.username, config.db.password)
    if handle ~= nil then
        print("连接数据库成功");
        -- db会话句柄
        db.handle = handle
    else
        print(string.format("连接失败，错误原因 %s", err))
        exitScript()
    end
end

db.insert = function()

end


-- 脱机版，先用全局变量临时存储数据。
db.emails = {

}

return db
