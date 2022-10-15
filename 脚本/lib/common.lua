-- һЩ��������

common = {}


-- �Ƿ��ҵ���ĳͼ
common.findImage = function(imageName)
    print("��ͼ��" .. imageName)
    return common.findImageScoped(0, 0, 0, 0, imageName)
end

-- ��Χ��ͼ
common.findImageScoped = function(startX, startY, endX, endY, imageName)
    print(startX, startY, endX, endY, imageName)
    local ret, x, y = findPic(startX, startY, endX, endY, imageName, "101010", 0, 0.9)
    print("��ͼ�����" .. ret, x, y)
    return x ~= -1 and y ~= -1
end


-- ���ĳ��ͼ
common.tapImage = function(imageName)
    common.tapImageScope(0, 0, 0, 0, imageName)
end

-- ��Χ���ͼƬ
common.tapImageScope = function(startX, startY, endX, endY, imageName)
    local ret, x, y = findPic(startX, startY, endX, endY, imageName, "101010", 0, 0.9)
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
