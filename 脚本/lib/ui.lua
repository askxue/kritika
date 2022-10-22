-- ����UI��ص��ж�

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
-- ˢ����boss���ַ���ʯ���㣬��ˢ�ˡ�
ui.pveBossNoRune = {
    sX = 150,
    sY = 351,
    eX = 530,
    eY = 926,
    png = "�ַ���ʯ����.png",
    cancel = {
        x = 270,
        y = 755
    }
}

-- ��ɫ
-- ����bossս����������
ui.bossOver = {
    firstColor = "14CAF8",
    offsetColor = "-173|-305|2CFFB2|-236|113|FFFFFF|-71|456|32CEE1"
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

-- �Ƿ�bossս��������
ui.isBossOver = function()
    return common.isFindColors(ui.bossOver.firstColor, ui.bossOver.offsetColor)
end

-- ����ѡ���ɫ����
ui.backToRolePage = function()
    util.delay()
    if ui.isHomePage() then
        tap(enum.setting.x, enum.setting.y)
        util.delay()
        tap(enum.settingRole.x, enum.settingRole.y)
    end
end

-- ������ҳ
ui.backToHomePage = function()
    util.delay()
    if not ui.isHomePage() then
        tap(enum.roleProfile.x, enum.roleProfile.y)
        util.delay()
        tap(enum.hall.x, enum.hall.y)
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
