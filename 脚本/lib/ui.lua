-- ����UI��ص��ж�

local common = require "lib.common"

ui = {}

-- ��ɫѡ�����
ui.chooseRole = "choose_role"
ui.homePage = "home_page"



-- �Ƿ�Ϊ��ɫ������
function ui.isHomePage()
    return common.findImage(ui.homePage)
end

-- �Ƿ�Ϊ��ɫѡ�����
function ui.isChooseRolePage()
    return common.findImage(ui.chooseRole)
end

return ui
