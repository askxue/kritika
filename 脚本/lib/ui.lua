-- ����UI��ص��ж�

local common = require "lib.common"
local enum = require "lib.enum"

ui = {}

-- ��ɫѡ�����
ui.chooseRole = "ѡ���ɫ.png"
ui.createRole = "������ɫ.png"
ui.homePage = "����.png|����ģʽ.png"




-- �Ƿ�Ϊ��ɫ������
ui.isHomePage = function()
    return common.findImage(ui.homePage)
end

-- �Ƿ�Ϊ��ɫѡ�����
ui.isChooseRolePage = function()
    return common.findImage(ui.chooseRole)
end

-- ����ѡ���ɫ����
ui.backToRolePage = function()
    sleep(2000)
    if ui.isHomePage() then
        tap(enum.setting.x, enum.setting.y)
        sleep(2000)
        tap(enum.settingRole.x, enum.settingRole.y)
    end
end

return ui
