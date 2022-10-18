-- ����UI��ص��ж�

local common = require "lib.common"
local enum = require "lib.enum"

ui = {}

-- ��ɫѡ�����
ui.chooseRole = {
    sX = 562,
    sY = 461,
    eX = 697,
    eY = 884,
    png = "ѡ���ɫ.png"
}
ui.createRole = "������ɫ.png"
ui.homePage = "����.png|����ģʽ.png|�̵�.png"
ui.marketPage = "����.png"
-- ��ɫ�б�UI��Χ
ui.roleList = {
    sX = 21,
    sY = 680,
    eX = 632,
    eY = 1223
}


-- �Ƿ�Ϊ��ɫ������
ui.isHomePage = function()
    return common.isFindImage(ui.homePage)
end

-- �Ƿ�Ϊ��ɫѡ�����
ui.isChooseRolePage = function()
    return common.isFindImageScoped(ui.chooseRole.sX, ui.chooseRole.sY, ui.chooseRole.eX, ui.chooseRole.eY, ui.chooseRole.png)
end

-- �Ƿ�Ϊ���н���
ui.isMarket = function()
    return common.isFindImage(ui.marketPage)
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

-- �Ƿ񵽴��˽�ɫ�б�ĩβ
ui.isEndOfRoleList = function()
    return common.isFindImageScoped(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, ui.createRole)
end

-- �Ƿ��ҵ���ĳ��ɫ
ui.isFindRole = function(role)
    return common.isFindImageScoped(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, role)
end

-- ���ĳ����ɫ
ui.tapRole = function(role)
    common.tapImageScope(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, role)
end

return ui
