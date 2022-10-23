-- 数据持久层

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
    -- TODO 数据库 CRUD
end

-- 先实现内存版数据存储，重启脚本数据丢失。（适合存放一些不需要持久化的数据）
db.events = {
    -- 逛黑市
    market = "market"
}
db.market = {}

-- 记录某事件发生的时间
db.write = function(event, role)
    db[event][role] = os.time()
end

-- 读取某时间发生的时间
db.read = function(event, role)
    return db[event][role]
end

return db
