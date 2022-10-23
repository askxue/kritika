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
        local hasNoRune = common.isFindImageScoped(ui.pveBossNoRune.sX, ui.pveBossNoRune.sY, ui.pveBossNoRune.eX, ui.pveBossNoRune.eY, ui.pveBossNoRune.png)
        if hasNoRune then
            toast('符石不足，不刷了')
            tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
        else
            util.delay(65 * 1000)
            common.await(ui.isBossOver)
            tap(enum.continue.x, enum.continue.y)
            -- 记录log
            log.write(enum.dailyEvents.boss, currentRole)
        end
    else
        toast('世界Boss结算中')
    end
    toast('返回主界面')
    for i = 1, 2 do
        util.delay()
        tap(enum.back.x, enum.back.y)
    end
end

-- 领每日任务奖励
event.daily = function()
    toast('开始领每日任务奖励')
    util.delay()
    tap(enum.daily.x, enum.daily.y)
    util.delay()
    tap(enum.daily_getAll.x, enum.daily_getAll.y)
    util.delay()
    tap(enum.daily_close.x, enum.daily_close.y)
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

return event

