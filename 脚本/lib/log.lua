-- 日志工具

log = {}

-- 返回log文件路径 （以日期命名）
local function getPath()
    local logDir = getSdPath() .. config.logDir
    if not fileExist(logDir) then
        -- 初始化log文件夹
        mkdir(logDir)
    end
    return logDir .. "/" .. date.today() .. ".txt"
end

-- 写日志
-- 可直接写入文件，如果文件不存在，则会创建。
-- log格式：
-- 事件名#角色#时间#时间戳
log.write = function(event, role)
    local path = getPath()
    local msg = event .. "#" .. role .. "#" .. date.now() .. "#" .. os.time() .. "\n"
    writeFile(path, msg, true)
end

-- 读日志
-- 从日志文件中，找 key=事件名#角色 的行，并返回该行内容
log.find = function(event, role)
    local path = getPath()
    if not fileExist(path) then
        -- 文件不存在，不用找了，直接返回nil
        return nil
    else
        local result = nil
        for line in io.lines(path) do
            local ret = splitStr(line, "#")
            if ret[1] == event and ret[2] == role then
                result = ret
            end
        end
        return result
    end
end

return log
