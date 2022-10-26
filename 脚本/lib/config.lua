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

-- 设置
config.settings = {
    -- 操作延迟（每次动作后的停顿时间，需根据游戏卡顿，网络情况动态调整）
    delay = 3000,
    -- 是否刷试练塔 （0=刷、1=不刷）
    tower = 0,
    -- 是否做每日任务 (0 = 做，1=不做)
    daily = 0,
    -- 是否刷世界boss（0=刷、1=不刷）
    boss = 0
}

-- UI名称
config.ui = "kritika.ui"


-- 加载配置
config.load = function()
    toast('启动配置UI')
    local action, arr = showUI(config.ui, 700, 1200)
    for key, value in pairs(arr) do
        config.settings[key] = value
    end
    toast('配置加载完毕')
end

return config
