-- ��־����

log = {}

-- ����log�ļ�·�� �������ڡ��·�������
local function getPath(month)
    local logDir = getSdPath() .. config.logDir
    if not fileExist(logDir) then
        -- ��ʼ��log�ļ���
        mkdir(logDir)
    end
    if month ~= nil then
        -- ��������Ϊ��λ����־�ļ�
        return logDir .. "/" .. date.currentMonth() .. ".txt"
    else
        -- ����Ϊ��λ���ļ�
        return logDir .. "/" .. date.today() .. ".txt"
    end
end

-- д��־
-- ��ֱ��д���ļ�������ļ������ڣ���ᴴ����
-- log��ʽ��
-- �¼���#��ɫ#ʱ��#ʱ���
log.write = function(event, role, month)
    local path = getPath(month)
    local msg = event .. "#" .. role .. "#" .. date.now() .. "#" .. os.time() .. "\n"
    writeFile(path, msg, true)
end

-- ����־
-- ����־�ļ��У��� key=�¼���#��ɫ ���У������ظ�������
log.find = function(event, role, month)
    local path = getPath(month)
    if not fileExist(path) then
        -- �ļ������ڣ��������ˣ�ֱ�ӷ���nil
        return nil
    else
        for line in io.lines(path) do
            local ret = splitStr(line, "#")
            if ret[1] == event and ret[2] == role then
                return ret
            end
        end
    end
end

-- ����־ ������ƥ������һ����¼��
log.findLast = function(event, role, month)
    local path = getPath(month)
    if not fileExist(path) then
        -- �ļ������ڣ��������ˣ�ֱ�ӷ���nil
        return nil
    else
        local result
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
