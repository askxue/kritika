-- ���ݣ����ж�̬���ݲ�����ͳһ����������

data = {}

-- ����iconͼ��λ��
data.icon = {
    friends = {
        iconX = 673, iconY = 1068,
        sendX = 74, sendY = 1069,
        closeX = 648, closeY = 1149
    },
    pet = {
        iconX = 169, iconY = 1107,
        callX = 588, callY = 164,
        getX = 89, getY = 241,
        getOneX = 211, getOneY = 184,
        clickX = 138, clickY = 977,
        backX = 666, backY = 1128
    }
}

-- PVE���
data.pve = {
    icon = { x = 393, y = 1044 }
}

-- ����bossս����������
data.bossOver = {
    sX = 190,
    sY = 444,
    eX = 597,
    eY = 1026,
    firstColor = "17D9F3-101010",
    offsetColor = "2|342|18DCF2-101010|-249|247|FFFFFF-101010|-135|483|82D5E6-101010",
    png = {
        sX = 253,
        sY = 782,
        eX = 522,
        eY = 1052,
        name = "bossս������.png"
    }
}

return data
