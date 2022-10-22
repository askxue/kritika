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
    sleep(200)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- 切换角色
event.changeRole = function(role)
    toast("准备切换到 " .. role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not ui.isFindRole(rolePng) do
        print("没找到目标角色，继续滑动...")
        -- 滑动角色列表
        slideRoleList()
    end
    -- 找到角色了，重置滑动角色slider次数
    countSlideTimes = 0
    ui.tapRole(rolePng)
    sleep(2000)
    print("点击选择角色")
    tap(enum.chooseRole.x, enum.chooseRole.y)
    sleep(2000)
end

-- 收取邮件
event.getEmail = function()
    toast("开始收取邮件")
    sleep(3000)
    tap(enum.email.x, enum.email.y)
    sleep(2000)
    toast("收取个人邮件")
    tap(enum.personalEmail.x, enum.personalEmail.y)
    sleep(2000)
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    sleep(1000)
    tap(enum.deleteEmail.x, enum.deleteEmail.y)
    sleep(2000)
    tap(enum.closeEmail.x, enum.closeEmail.y)
    toast("关闭邮件箱")
end

-- 黑市买道具
event.market = function()
    toast("开始逛黑市")
    sleep(2000)
    tap(enum.market.x, enum.market.y)
    common.await(ui.isMarket)
    print("打开了黑市")
    for i, item in ipairs(enum.buyList) do
        -- 是否有某个商品
        print("查看是否有 " .. item)
        local xyz = common.findPicAllPointsScoped(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, item)
        print("总共找到目标物品数量：" .. #xyz)
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
                    print("可以用金币购买")
                    common.tapImageScope(startX, startY, endX, endY, enum.items.gold)
                    sleep(2000)
                    print("确定购买")
                    common.tapImageScope(enum.marketBegin.x, enum.marketBegin.y, enum.marketEnd.x, enum.marketEnd.y, enum.world.yes)
                    sleep(2000)
                else
                    print("可惜只能用钻石购买")
                end
            end
        end
    end
    -- 完事了，关闭黑市
    tap(enum.marketClose.x, enum.marketClose.y)
    toast("关闭了黑市")
end


-- 刷世界boss
event.boss = function()
    toast("准备刷世界BOSS")
    -- 返回主页
    --ui.backToHomePage()
    sleep(1000)
    tap(enum.pve.x, enum.pve.y)
    sleep(2000)
    -- TODO 如果有领取奖励，则领取奖励

    -- TODO 如果当天刷过boss了，则不刷了

    -- 刷世界boss
    tap(enum.boss.x, enum.boss.y)
    sleep(1000)
    common.tapImageScope(189, 69, 475, 1245, enum.world.canChallenge)
    sleep(3000)
    tap(enum.start.x, enum.start.y)
    sleep(2000)
    -- 弹出讨伐符石不足，则不刷了。
    local hasNoRune = common.isFindImageScoped(ui.pveBossNoRune.sX, ui.pveBossNoRune.sY, ui.pveBossNoRune.eX, ui.pveBossNoRune.eY, ui.pveBossNoRune.png)
    if hasNoRune then
        toast('符石不足，不刷了')
        tap(ui.pveBossNoRune.cancel.x, ui.pveBossNoRune.cancel.y)
    else
        sleep(63 * 1000)
        common.await(ui.isBossOver)
        tap(enum.continue.x, enum.continue.y)
        -- TODO 记录log，今天已经刷过boss了
    end
    toast('返回主界面')
    for i = 1, 2 do
        sleep(2000)
        tap(enum.back.x, enum.back.y)
    end
end

-- 领取排行奖励
event.award = function()
    -- 返回主页
    ui.backToHomePage()
    sleep(1000)
    tap(enum.pve.x, enum.pve.y)
    sleep(3000)
    local xyz = common.findPicAllPoints(enum.world.getAward)
    if xyz ~= nil then
        for n = 1, #xyz do
            local x = xyz[n].x
            local y = xyz[n].y
            tap(x, y)
            sleep(3000)
            common.tapImage(enum.world.yes)
            sleep(2000)
            tap(enum.back.x, enum.back.y)
        end
    end


end

return event

