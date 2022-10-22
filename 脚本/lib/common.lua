-- һЩ��������

common = {}

-- ��ͼ�� ��ͨ & �߼���ͼ��˫��У��
common.findPicPlus = function(startX, startY, endX, endY, imageName)
    local ret, x, y = findPic(startX, startY, endX, endY, imageName, "101010", 0, 0.9)
    if x == -1 and y == -1 then
        -- û�ҵ�ͼ��ʹ�ø߼������ٴγ���
        ret, x, y = findPicEx(startX, startY, endX, endY, imageName, 0.9)
    end
    return ret, x, y
end

-- ��ĳ��ͼ������λ�ã� ȫ��
common.findPicAllPoints = function(imageName)
    return common.findPicAllPointsScoped(0, 0, 0, 0, imageName)
end

-- ��ĳ��ͼ������λ�ã� ָ����Χ
common.findPicAllPointsScoped = function(startX, startY, endX, endY, imageName)
    return findPicAllPoint(startX, startY, endX, endY, imageName, 0.9)
end

-- �Ƿ��ҵ���ĳͼ�� ȫ��
common.isFindImage = function(imageName)
    return common.isFindImageScoped(0, 0, 0, 0, imageName)
end

-- �Ƿ��ҵ���ĳͼ�� ָ����Χ
common.isFindImageScoped = function(startX, startY, endX, endY, imageName)
    print(startX, startY, endX, endY, imageName)
    local ret, x, y = common.findPicPlus(startX, startY, endX, endY, imageName)
    print("��ͼ[" .. imageName .. "]�����" .. ret, x, y)
    return x ~= -1 and y ~= -1
end

-- �Ƿ��ҵ���ĳЩ��ɫ�� ȫ��
common.isFindColors = function(firstColor, offsetColor)
    return common.isFindColorsScoped(0, 0, 0, 0, firstColor, offsetColor)
end

-- �Ƿ��ҵ���ĳЩ��ɫ�� ָ����Χ
common.isFindColorsScoped = function(startX, startY, endX, endY, firstColor, offsetColor)
    local x, y = findMultiColor(startX, startY, endX, endY, firstColor, offsetColor, 0, 0.9)
    return x ~= -1 and y ~= -1
end

-- ���ĳ��ͼ
common.tapImage = function(imageName)
    common.tapImageScope(0, 0, 0, 0, imageName)
end

-- ��Χ���ͼƬ
common.tapImageScope = function(startX, startY, endX, endY, imageName)
    local ret, x, y = common.findPicPlus(startX, startY, endX, endY, imageName)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
    end
end

-- �ȴ�ĳ��������
-- condition = ĳ��������Ӧ����һ������
common.await = function(condition)
    local timer = 0;
    while not condition() do
        sleep(1000)
        timer = timer + 1
        if timer > 3 then
            -- ���м�飬�Ƿ�����ĳЩ����ԭ�򣬵���һֱ���������ˡ�
            common.closeTips()
        end
    end
    return true
end

-- �رս��ջ��ʾ
common.closeTips = function()
    common.tapImage(enum.world.notTips)
end

return common
