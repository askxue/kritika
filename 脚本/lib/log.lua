-- ��־����

log = {}

-- ����log�ļ�·�� ��������������
local function getPath()
    local logDir = getSdPath() .. config.logDir
    if not fileExist(logDir) then
        -- ��ʼ��log�ļ���
        mkdir(logDir)
    end
    return logDir .. "/" .. date.today() .. ".txt"
end

-- д��־
-- ��ֱ��д���ļ�������ļ������ڣ���ᴴ����
-- log��ʽ��
-- �¼���#��ɫ#ʱ��#ʱ���
log.write = function(event, role)
    local path = getPath()
    local msg = event .. "#" .. role .. "#" .. date.now() .. "#" .. os.time() .. "\n"
    writeFile(path, msg, true)
end

-- ����־
-- ����־�ļ��У��� key=�¼���#��ɫ ���У������ظ�������
log.find = function(event, role)
    local path = getPath()
    if not fileExist(path) then
        -- �ļ������ڣ��������ˣ�ֱ�ӷ���nil
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
