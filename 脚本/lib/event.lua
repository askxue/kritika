-- 各种事件

event = {}

-- 滑动角色列表
local countSlideTimes = 0
local slideDown = true
local function slideRoleList()
    -- 会卡在空格区间，进行修正处理（ x 补上偏移量）
    local startX = slideDown and (273 + countSlideTimes * 10) or (487 - countSlideTimes * 10)
    local startY = 996
    local endX = slideDown and (487 + countSlideTimes * 10) or (273 - countSlideTimes * 5)
    local endY = 996
    if ui.isEndOfRoleList() then
        -- 到底了，改变滑动方向
        slideDown = false
        countSlideTimes = 0
        toast("角色列表到底了")
    elseif countSlideTimes > 20 then
        -- 划了很多次了，该转向了
        slideDown = not slideDown
        countSlideTimes = 0
        toast("划了很多次了，要转向了")
    end
    touchDown(1, startX, startY)
    util.delay(200)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- 切换角色
event.changeRole = function(role)
    toast("准备切换到 " .. role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not ui.isFindRole(rolePng) do
        -- 滑动角色列表
        slideRoleList()
    end
    -- 找到角色了，重置滑动角色slider次数
    countSlideTimes = 0
    util.delay()
    ui.tapRole(rolePng)
    util.delay()
    tap(enum.chooseRole.x, enum.chooseRole.y)
    util.delay()
end

-- 收取邮件
event.getEmail = function()
    toast("开始收取邮件")
    util.delay()
    tap(enum.email.x, enum.email.y)
    util.delay()
    toast("收取个人邮件")
    tap(enum.personalEmail.x, enum.personalEmail.y)
    util.delay()
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    util.delay()
    tap(enum.deleteEmail.x, enum.deleteEmail.y)
    util.delay()
    tap(enum.closeEmail.x, enum.closeEmail.y)
    -- 记录日志
    log.write(enum.dailyEvents.email, currentRole)
    toast("关闭邮件箱")
end

-- 黑市买道具
event.market = function()
    toast("开始逛黑市")
    util.delay()
    tap(enum.market.x, enum.market.y)
    common.await(ui.isMarket)
    for i, item in ipairs(enum.buyList) do
        -- 是否有某个商品
        local xyz = common.findPicAllPointsScoped(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, item)
        if xyz ~= nil then
            for n = 1, #xyz do
                local x = xyz[n].x
                local y = xyz[n].y
                -- 判断是否为金币可购买
                -- 范围偏移量
                local startX = x - 25
                local startY = y + 310
                local endX = x + 32
                local endY = y + 428
                local canGoldBuy = common.isFindImageScoped(startX, startY, endX, endY, enum.items.gold)
                if canGoldBuy then
                    -- 可以用金币购买
                    common.tapImageScope(startX, startY, endX, endY, enum.items.gold)
                    util.delay()
                    common.tapImageScope(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, enum.world.yes)
                    util.delay()
                end
            end
        end
    end
    -- 完事了，关闭黑市
    tap(enum.marketClose.x, enum.marketClose.y)
    -- 记录日志
    db.write(db.events.market, currentRole)
    toast("关闭了黑市")
end


-- 刷世界boss
event.boss = function()
    toast("准备刷世界BOSS")
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    -- 刷世界boss
    tap(enum.boss.x, enum.boss.y)
    util.delay()
    -- 是否可挑战，不能挑战则是结算中
    local canChallenge = common.isFindImageScoped(249, 481, 417, 815, enum.world.canChallenge)
    if canChallenge then
        tap(enum.boss_challenge.x, enum.boss_challenge.y)
        util.delay()
        -- 领取排名奖励
        local rank = common.isFindImageScoped(27, 457, 139, 781, enum.world.getAward)
        if rank then
            toast('领取排名奖励')
            tap(enum.boss_getAward.x, enum.boss_getAward.y)
        end
        util.delay()
        -- 开始挑战
        tap(enum.start.x, enum.start.y)
        util.delay()
        -- 弹出讨伐符石不足，则不刷了。
        if ui.noRune() then
            toast('符石不足，不刷了')
            tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
        else
            util.delay(65 * 1000)
            common.await(ui.isBossOver)
            toast('Boss done!')
            print('Boss done!')
            tap(enum.continue.x, enum.continue.y)
            -- 记录log
            log.write(enum.dailyEvents.boss, currentRole)
        end
    else
        toast('世界Boss结算中')
    end
    util.delay()
    toast('返回主界面')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- 领每日任务奖励
event.daily = function()
    toast('开始做每日任务')
    util.delay()
    -- 向好友发送疲劳
    tap(data.icon.friends.iconX, data.icon.friends.iconY)
    util.delay()
    tap(data.icon.friends.sendX, data.icon.friends.sendY)
    util.delay()
    tap(data.icon.friends.closeX, data.icon.friends.closeY)
    util.delay()
    -- 宠物召唤一次
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
    -- 试练塔一次
    tap(data.pve.icon.x, data.pve.icon.y)
    util.delay()
    tap(enum.monthTower.x, enum.monthTower.y)
    util.delay()
    while not ui.isFirstFloorOfTower() do
        -- 滑动月塔，一直滑到第一层
        touchDown(1, 145, 377)
        util.delay(200)
        touchMoveEx(1, 400, 377, 800)
        touchUp(1)
    end
    toast('到月塔第1层了，开始刷塔')
    util.delay()
    ui.tapFirstFloorOfTower()
    util.delay()
    -- 开始挑战
    tap(ui.monthTower.start.x, ui.monthTower.start.y)
    util.delay()
    if ui.noRune() then
        -- 讨伐符文不足，不刷了
        toast('符石不足，不刷了')
        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
    else
        -- 开始刷塔了，等待出现 finish画面
        local result = common.awaitYesNo(ui.isFloorClearOver, ui.isFloorClearFailed, 60 * 1000)
        if not result then
            -- 成功则继续
            -- 失败则退出刷塔（打不过，不打了。o(╥﹏╥)o）
            toast('打输了,算了，暂时不打了')
        end
        util.delay()
        tap(ui.monthTower.continue.x, ui.monthTower.continue.y)
        util.delay()
        -- 等待返回试练塔主界面
        common.await(ui.isHomePageOfTower)
    end
    -- 退出试练塔，返回主页
    toast('返回主界面')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end

    -- TODO  未完待续



    -- 领取每日奖励
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
    -- 记录log
    log.write(enum.dailyEvents.daily, currentRole)
end

-- 公会签到
event.sign = function()
    toast('开始每日公会签到')
    util.delay()
    tap(enum.consortia.x, enum.consortia.y)
    util.delay()
    tap(enum.consortia_sign.x, enum.consortia_sign.y)
    util.delay()
    tap(enum.consortia_sign_outer.x, enum.consortia_sign_outer.y)
    -- 记录log
    log.write(enum.dailyEvents.sign, currentRole)
    util.delay()
    tap(enum.back.x, enum.back.y)
    util.delay()
end

-- 月塔
event.monthTower = function()
    toast('开始推试练塔')
    util.delay()
    tap(enum.pve.x, enum.pve.y)
    util.delay()
    tap(enum.monthTower.x, enum.monthTower.y)
    util.delay()
    -- 本月是否已经推过塔了 （物理、魔法）
    for i, item in ipairs(ui.monthTower_types) do
        local type = item
        if not service.hasClearTower(type) then
            toast('准备推' .. type)
            util.delay()
            tap(ui.monthTower.types[type].x, ui.monthTower.types[type].y)
            util.delay()
            while not ui.isFirstFloorOfTower() do
                -- 滑动月塔，一直滑到第一层
                touchDown(1, 145, 377)
                util.delay(200)
                touchMoveEx(1, 400, 377, 800)
                touchUp(1)
            end
            toast('到月塔第1层了，开始刷塔')
            util.delay()
            -- 是否继续刷，标识位
            local continue = true
            local failed = false
            while not ui.isLastFloorOfTower() do
                -- 没到最后一层，则一直刷，除非中途有失败的情况。
                while ui.hasNotClearFloor() and continue and not failed do
                    local ret, x, y = ui.notClearFloorOfTower()
                    tap(x, y)
                    util.delay()
                    -- 开始挑战
                    tap(ui.monthTower.start.x, ui.monthTower.start.y)
                    util.delay()
                    if ui.noRune() then
                        -- 讨伐符文不足，不刷了
                        toast('符石不足，不刷了')
                        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
                        continue = false
                    else
                        -- 开始刷塔了，等待出现 finish画面
                        local result = common.awaitYesNo(ui.isFloorClearOver, ui.isFloorClearFailed, 60 * 1000)
                        if not result then
                            -- 成功则继续
                            -- 失败则退出刷塔（打不过，不打了。o(╥﹏╥)o）
                            toast('打输了,算了，暂时不打了')
                            failed = true
                        end
                        util.delay()
                        tap(ui.monthTower.continue.x, ui.monthTower.continue.y)
                        util.delay()
                        -- 等待返回试练塔主界面
                        common.await(ui.isHomePageOfTower)
                    end
                end
                if not continue or failed then
                    -- 退出外层循环 (没符文、挑战失败..等各种情况)
                    break
                end
                -- 没有未清理楼层，继续往上滑动
                -- 滑动月塔，一直滑到最后一层
                touchDown(1, 400, 377)
                util.delay(200)
                touchMoveEx(1, 145, 377, 800)
                touchUp(1)
            end
            -- 记录日志到月文件夹
            if continue or failed then
                log.write(type, currentRole, true)
            end
            toast(type .. '推完了')
            util.delay()
        end
    end
    -- 退出试练塔，返回主页
    toast('返回主界面')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- 领任务奖励(临时，等每日任务能自动做了，这个则没必要了)
event.getAward = function()
    toast('领取每日任务奖励')
    util.delay()
    -- 领取每日奖励
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
end

return event

