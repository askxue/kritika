-- һЩ��������

common = {}


-- �Ƿ��ҵ���ĳͼ
common.findImage = function(imageName)
    local x = -1
    y = -1
    print("��ͼƬ��" .. imageName)
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
    return x ~= -1 and y ~= -1
end

-- ���ĳ��ͼ
common.tapImage = function(imageName)
    local x = -1
    y = -1
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
    end
end

-- �ȴ�ĳ��������
-- condition = ĳ��������Ӧ����һ������
common.await = function(condition)
    while not condition() do
        sleep(1000)
    end
    return true
end

return common
