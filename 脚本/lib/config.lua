-- 一些配置

config = {}

-- 数据源
config.db = {
    host = "192.168.0.110",
    port = 3307,
    username = "kritika",
    password = "Abc!123456",
    database = "kritika"
}

-- log日志文件夹目录 (相对于SD卡)
config.logDir = "/com.xue65535.kritika/log"

-- 网络延迟
config.delay = 2000

return config
