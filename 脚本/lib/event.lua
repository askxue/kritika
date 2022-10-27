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
        -- ������ɫ�б�
        slideRoleList()
    end
    -- �ҵ���ɫ�ˣ����û�����ɫslider����
    countSlideTimes = 0
    util.delay()
    ui.tapRole(rolePng)
    util.delay()
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
    -- ��¼��־
    log.write(enum.dailyEvents.email, currentRole)
    toast("�ر��ʼ���")
end

-- ���������
event.market = function()
    toast("��ʼ�����")
    util.delay()
    tap(enum.market.x, enum.market.y)
    common.await(ui.isMarket)
    for i, item in ipairs(enum.buyList) do
        -- �Ƿ���ĳ����Ʒ
        local xyz = common.findPicAllPointsScoped(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, item)
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
                    common.tapImageScope(startX, startY, endX, endY, enum.items.gold)
                    util.delay()
                    common.tapImageScope(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, enum.world.yes)
                    util.delay()
                end
            end
        end
    end
    -- �����ˣ��رպ���
    tap(enum.marketClose.x, enum.marketClose.y)
    -- ��¼��־
    db.write(db.events.market, currentRole)
    toast("�ر��˺���")
end


-- ˢ����boss
event.boss = function()
    toast("׼��ˢ����BOSS")
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    -- ˢ����boss
    tap(enum.boss.x, enum.boss.y)
    util.delay()
    -- �Ƿ����ս��������ս���ǽ�����
    local canChallenge = common.isFindImageScoped(249, 481, 417, 815, enum.world.canChallenge)
    if canChallenge then
        tap(enum.boss_challenge.x, enum.boss_challenge.y)
        util.delay()
        -- ��ȡ��������
        local rank = common.isFindImageScoped(27, 457, 139, 781, enum.world.getAward)
        if rank then
            toast('��ȡ��������')
            tap(enum.boss_getAward.x, enum.boss_getAward.y)
        end
        util.delay()
        -- ��ʼ��ս
        tap(enum.start.x, enum.start.y)
        util.delay()
        -- �����ַ���ʯ���㣬��ˢ�ˡ�
        if ui.noRune() then
            toast('��ʯ���㣬��ˢ��')
            tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
        else
            util.delay(65 * 1000)
            common.await(ui.isBossOver)
            toast('Boss done!')
            print('Boss done!')
            tap(enum.continue.x, enum.continue.y)
            -- ��¼log
            log.write(enum.dailyEvents.boss, currentRole)
        end
    else
        toast('����Boss������')
    end
    util.delay()
    toast('����������')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- ��ÿ��������
event.daily = function()
    toast('��ʼ��ÿ������')
    util.delay()
    -- ����ѷ���ƣ��
    tap(data.icon.friends.iconX, data.icon.friends.iconY)
    util.delay()
    tap(data.icon.friends.sendX, data.icon.friends.sendY)
    util.delay()
    tap(data.icon.friends.closeX, data.icon.friends.closeY)
    util.delay()
    -- �����ٻ�һ��
    tap(data.icon.pet.iconX, data.icon.pet.iconY)
    util.delay()
    tap(data.icon.pet.callX, data.icon.pet.callY)
    util.delay()
    tap(data.icon.pet.getX, data.icon.pet.getY)
    util.delay()
    tap(data.icon.pet.getOneX, data.icon.pet.getOneY)
    util.delay()
    tap(data.icon.pet.clickX, data.icon.pet.clickY)
    util.delay()
    tap(data.icon.pet.backX, data.icon.pet.backY)
    util.delay()
    -- ������һ��
    tap(data.pve.icon.x, data.pve.icon.y)
    util.delay()
    tap(enum.monthTower.x, enum.monthTower.y)
    util.delay()
    while not ui.isFirstFloorOfTower() do
        -- ����������һֱ������һ��
        touchDown(1, 145, 377)
        util.delay(200)
        touchMoveEx(1, 400, 377, 800)
        touchUp(1)
    end
    toast('��������1���ˣ���ʼˢ��')
    util.delay()
    ui.tapFirstFloorOfTower()
    util.delay()
    -- ��ʼ��ս
    tap(ui.monthTower.start.x, ui.monthTower.start.y)
    util.delay()
    if ui.noRune() then
        -- �ַ����Ĳ��㣬��ˢ��
        toast('��ʯ���㣬��ˢ��')
        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
    else
        -- ��ʼˢ���ˣ��ȴ����� finish����
        local result = common.awaitYesNo(ui.isFloorClearOver, ui.isFloorClearFailed, 60 * 1000)
        if not result then
            -- �ɹ������
            -- ʧ�����˳�ˢ�����򲻹��������ˡ�o(�i�n�i)o��
            toast('������,���ˣ���ʱ������')
        end
        util.delay()
        tap(ui.monthTower.continue.x, ui.monthTower.continue.y)
        util.delay()
        -- �ȴ�����������������
        common.await(ui.isHomePageOfTower)
    end
    -- �˳���������������ҳ
    toast('����������')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end

    -- TODO  δ�����



    -- ��ȡÿ�ս���
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
    -- ��¼log
    log.write(enum.dailyEvents.daily, currentRole)
end

-- ����ǩ��
event.sign = function()
    toast('��ʼÿ�չ���ǩ��')
    util.delay()
    tap(enum.consortia.x, enum.consortia.y)
    util.delay()
    tap(enum.consortia_sign.x, enum.consortia_sign.y)
    util.delay()
    tap(enum.consortia_sign_outer.x, enum.consortia_sign_outer.y)
    -- ��¼log
    log.write(enum.dailyEvents.sign, currentRole)
    util.delay()
    tap(enum.back.x, enum.back.y)
    util.delay()
end

-- ����
event.monthTower = function()
    toast('��ʼ��������')
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    tap(enum.monthTower.x, enum.monthTower.y)
    util.delay()
    -- �����Ƿ��Ѿ��ƹ����� ������ħ����
    for i, item in ipairs(ui.monthTower_types) do
        local type = item
        if not service.hasClearTower(type) then
            toast('׼����' .. type)
            util.delay()
            tap(ui.monthTower.types[type].x, ui.monthTower.types[type].y)
            util.delay()
            while not ui.isFirstFloorOfTower() do
                -- ����������һֱ������һ��
                touchDown(1, 145, 377)
                util.delay(200)
                touchMoveEx(1, 400, 377, 800)
                touchUp(1)
            end
            toast('��������1���ˣ���ʼˢ��')
            util.delay()
            -- �Ƿ����ˢ����ʶλ
            local continue = true
            local failed = false
            while not ui.isLastFloorOfTower() do
                -- û�����һ�㣬��һֱˢ��������;��ʧ�ܵ������
                while ui.hasNotClearFloor() and continue and not failed do
                    local ret, x, y = ui.notClearFloorOfTower()
                    tap(x, y)
                    util.delay()
                    -- ��ʼ��ս
                    tap(ui.monthTower.start.x, ui.monthTower.start.y)
                    util.delay()
                    if ui.noRune() then
                        -- �ַ����Ĳ��㣬��ˢ��
                        toast('��ʯ���㣬��ˢ��')
                        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
                        continue = false
                    else
                        -- ��ʼˢ���ˣ��ȴ����� finish����
                        local result = common.awaitYesNo(ui.isFloorClearOver, ui.isFloorClearFailed, 60 * 1000)
                        if not result then
                            -- �ɹ������
                            -- ʧ�����˳�ˢ�����򲻹��������ˡ�o(�i�n�i)o��
                            toast('������,���ˣ���ʱ������')
                            failed = true
                        end
                        util.delay()
                        tap(ui.monthTower.continue.x, ui.monthTower.continue.y)
                        util.delay()
                        -- �ȴ�����������������
                        common.await(ui.isHomePageOfTower)
                    end
                end
                if not continue or failed then
                    -- �˳����ѭ�� (û���ġ���սʧ��..�ȸ������)
                    break
                end
                -- û��δ����¥�㣬�������ϻ���
                -- ����������һֱ�������һ��
                touchDown(1, 400, 377)
                util.delay(200)
                touchMoveEx(1, 145, 377, 800)
                touchUp(1)
            end
            -- ��¼��־�����ļ���
            if continue or failed then
                log.write(type, currentRole, true)
            end
            toast(type .. '������')
            util.delay()
        end
    end
    -- �˳���������������ҳ
    toast('����������')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- ��������(��ʱ����ÿ���������Զ����ˣ������û��Ҫ��)
event.getAward = function()
    toast('��ȡÿ��������')
    util.delay()
    -- ��ȡÿ�ս���
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
end

return event

