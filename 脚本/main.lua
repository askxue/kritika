-- �ű������

-- ��������ģ�飬������һ�������������
local ui = require "ui"

-- ��������ģ���еķ���


-- ��ʾ��Ϣ
toast("���ˣ���ӭ�㣡")

-- ���� xx ����
sleep(1000 * 2)

print(ui.name)

ui.test2()


-- ��������ɫ�� Ѱ����ϷIcon
local ret = findMultiColorAll(24, 184, 615, 574, "E4E000", "32|17|FFFFFF", 0, 0.9)

-- ��ӡlua table�������ݣ����json��ʽ
print(jsonLib.encode(ret))

-- �ҵ�Ŀ����
if ret ~= nil then

    -- lua��table�������Ǵ�1��ʼ��
    local firstColor = ret[1]
    -- ���ָ������
    tap(firstColor.x, firstColor.y)

end






