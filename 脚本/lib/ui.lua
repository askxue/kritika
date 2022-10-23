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

-- ����
ui.monthTower = {
    first = "����1��",
    last = "����65��",
    notClear = "û�����¥��.png",
    homePage = {
        sX = 534,
        sY = 86,
        eX = 658,
        eY = 383,
        png = "������.png"
    },
    sX = 42,
    sY = 127,
    eX = 500,
    eY = 604,
    -- ��ʼ��ť����
    start = {
        x = 27,
        y = 1069
    },
    -- �����Ļ����ˢ
    continue = {
        x = 106,
        y = 636
    },
    -- �ɹ���������
    success = {
        firstColor = "3DEEFF",
        offsetColor = "-1|63|44FFFF|1|127|49FFFF|-4|229|44FFFF|1|364|38DDFF|-6|263|44FFFF"
    },
    -- ʧ�ܽ�������
    failed = {
        firstColor = "31CCDE",
        offsetColor = "3|81|000000|135|-50|BBBBBB|119|54|BBBBBB|-179|-89|2BB27A"
    },
    -- ����ħ����
    types = {
        physics = {
            x = 541,
            y = 249
        },
        magic = {
            x = 539,
            y = 505
        }
    }
}

ui.monthTower_types = {
    "physics",
    "magic"
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

-- �Ƿ�������������
ui.isHomePageOfTower = function()
    return common.isFindImageScoped(ui.monthTower.homePage.sX, ui.monthTower.homePage.sY, ui.monthTower.homePage.eX, ui.monthTower.homePage.eY, ui.monthTower.homePage.png)
end

-- �Ƿ񵽴���������һ��
ui.isFirstFloorOfTower = function()
    local first = ui.monthTower.first .. ".png" .. "|" .. ui.monthTower.first .. "_1.png"
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, first)
end

-- �Ƿ񵽴����������һ��
ui.isLastFloorOfTower = function()
    local last = ui.monthTower.last .. ".png" .. "|" .. ui.monthTower.last .. "_1.png"
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, last)
end

-- �Ƿ���δ����¥��
ui.hasNotClearFloor = function()
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, ui.monthTower.notClear)
end

-- ��ȡδ�����¥�������
ui.notClearFloorOfTower = function()
    return common.findPicPlus(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, ui.monthTower.notClear)
end

-- �ַ���ʯ����
ui.noRune = function()
    return common.isFindImageScoped(ui.pveBossNoRune.sX, ui.pveBossNoRune.sY, ui.pveBossNoRune.eX, ui.pveBossNoRune.eY, ui.pveBossNoRune.png)
end

-- �ò����Ƿ�ˢ�꣨�ɹ���
ui.isFloorClearOver = function()
    return common.isFindColors(ui.monthTower.success.firstColor, ui.monthTower.success.offsetColor)
end

-- �ò����Ƿ�ˢ�꣨ʧ�ܣ�
ui.isFloorClearFailed = function()
    return common.isFindColors(ui.monthTower.failed.firstColor, ui.monthTower.failed.offsetColor)
end

return ui
