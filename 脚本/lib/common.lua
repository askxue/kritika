-- һЩ��������

common = {}


-- �Ƿ��ҵ���ĳͼ
function common.findImage(imageName)
    local x = -1
    y = -1
    print("��ͼƬ��" .. imageName)
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
    return x ~= -1 and y ~= -1
end

-- ���ĳ��ͼ
function common.tapImage(imageName)
    local x = -1
    y = -1
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
    end
end

-- �ȴ�ĳ��������
-- condition = ĳ��������Ӧ����һ������
function common.await(condition)
    while not condition() do
        sleep(1000)
    end
    return true
end

return common
