-- ����UI��ص��ж�

-- ����һ����Ϊui��ģ��
ui = {}

ui.name = "���ǳ���"

-- ���к���
function ui.isHome()
    print("���ǹ��к��������Դ�ģ���ⲿ����")
end

function ui.test2()
    test()
end

local function test()
    print("����˽�к��������ܴ�ģ���ⲿ����")
end

return ui
