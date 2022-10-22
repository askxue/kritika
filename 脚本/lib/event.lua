-- �����¼�

event = {}

-- ������ɫ�б�
local countSlideTimes = 0
local slideDown = true
local function slideRoleList()
    -- �Ῠ�ڿո����䣬������������ x ����ƫ������
    local startX = slideDown and (273 + countSlideTimes * 10) or (487 - countSlideTimes * 10)
    local startY = 996
    local endX = slideDown and (487 + countSlideTimes * 10) or (273 - countSlideTimes * 5)
    local endY = 996
    if ui.isEndOfRoleList() then
        -- �����ˣ��ı们������
        slideDown = false
        countSlideTimes = 0
        toast("��ɫ�б�����")
    elseif countSlideTimes > 20 then
        -- ���˺ܶ���ˣ���ת����
        slideDown = not slideDown
        countSlideTimes = 0
        toast("���˺ܶ���ˣ�Ҫת����")
    end
    touchDown(1, startX, startY)
    util.delay(200)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- �л���ɫ
event.changeRole = function(role)
    toast("׼���л��� " .. role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not ui.isFindRole(rolePng) do
        print("û�ҵ�Ŀ���ɫ����������...")
        -- ������ɫ�б�
        slideRoleList()
    end
    -- �ҵ���ɫ�ˣ����û�����ɫslider����
    countSlideTimes = 0
    ui.tapRole(rolePng)
    util.delay()
    print("���ѡ���ɫ")
    tap(enum.chooseRole.x, enum.chooseRole.y)
    util.delay()
end

-- ��ȡ�ʼ�
event.getEmail = function()
    toast("��ʼ��ȡ�ʼ�")
    util.delay()
    tap(enum.email.x, enum.email.y)
    util.delay()
    toast("��ȡ�����ʼ�")
    tap(enum.personalEmail.x, enum.personalEmail.y)
    util.delay()
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    util.delay()
    tap(enum.deleteEmail.x, enum.deleteEmail.y)
    util.delay()
    tap(enum.closeEmail.x, enum.closeEmail.y)
    toast("�ر��ʼ���")
end

-- ���������
event.market = function()
    toast("��ʼ�����")
    util.delay()
    tap(enum.market.x, enum.market.y)
    common.await(ui.isMarket)
    print("���˺���")
    for i, item in ipairs(enum.buyList) do
        -- �Ƿ���ĳ����Ʒ
        print("�鿴�Ƿ��� " .. item)
        local xyz = common.findPicAllPointsScoped(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, item)
        print("�ܹ��ҵ�Ŀ����Ʒ������" .. #xyz)
        if xyz ~= nil then
            for n = 1, #xyz do
                local x = xyz[n].x
                local y = xyz[n].y
                -- �ж��Ƿ�Ϊ��ҿɹ���
                -- ��Χƫ����
                local startX = x - 25
                local startY = y + 310
                local endX = x + 32
                local endY = y + 428
                local canGoldBuy = common.isFindImageScoped(startX, startY, endX, endY, enum.items.gold)
                if canGoldBuy then
                    -- �����ý�ҹ���
                    print("�����ý�ҹ���")
                    common.tapImageScope(startX, startY, endX, endY, enum.items.gold)
                    util.delay()
                    print("ȷ������")
                    common.tapImageScope(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, enum.world.yes)
                    util.delay()
                else
                    print("��ϧֻ������ʯ����")
                end
            end
        end
    end
    -- �����ˣ��رպ���
    tap(enum.marketClose.x, enum.marketClose.y)
    toast("�ر��˺���")
end


-- ˢ����boss
event.boss = function()
    toast("׼��ˢ����BOSS")
    -- ������ҳ
    --ui.backToHomePage()
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    -- TODO �������ȡ����������ȡ����

    -- TODO �������ˢ��boss�ˣ���ˢ��

    -- ˢ����boss
    tap(enum.boss.x, enum.boss.y)
    util.delay()
    common.tapImageScope(189, 69, 475, 1245, enum.world.canChallenge)
    util.delay()
    tap(enum.start.x, enum.start.y)
    util.delay()
    -- �����ַ���ʯ���㣬��ˢ�ˡ�
    local hasNoRune = common.isFindImageScoped(ui.pveBossNoRune.sX, ui.pveBossNoRune.sY, ui.pveBossNoRune.eX, ui.pveBossNoRune.eY, ui.pveBossNoRune.png)
    if hasNoRune then
        toast('��ʯ���㣬��ˢ��')
        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
    else
        util.delay(63 * 1000)
        common.await(ui.isBossOver)
        tap(enum.continue.x, enum.continue.y)
        -- TODO ��¼log�������Ѿ�ˢ��boss��
    end
    toast('����������')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- ��ȡ���н���
event.award = function()
    toast('��ʼ��ȡ���н���')
    -- ������ҳ
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    local xyz = common.findPicAllPoints(enum.world.getAward)
    if xyz ~= nil then
        for n = 1, #xyz do
            local x = xyz[n].x
            local y = xyz[n].y
            tap(x, y)
            util.delay()
            tap(enum.award_yes.x, enum.award_yes.y)
            util.delay()
            tap(enum.back.x, enum.back.y)
        end
    end
end

-- ��ÿ��������
event.daily = function()
    toast('��ʼ��ÿ��������')
    util.delay()
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
end

return event

