-- һЩ��������

common = {}


-- �Ƿ��ҵ���ĳͼ
function common.findImage(imageName, ...)
    local x = -1
    y = -1
    local images = imageName .. "|" .. table.concat({ ... }, "|")
    ret, x, y = findPicEx(0, 0, 0, 0, images, 0.9)
    return x ~= -1 and y ~= -1
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
