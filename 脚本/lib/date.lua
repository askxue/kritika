-- 日期时间工具

date = {}

-- 当前时间
date.now = function()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- 当前日期
date.today = function()
    return os.date("%Y-%m-%d")
end

return date
