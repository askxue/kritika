-- 各种事件

local common = require "lib.common"
local enum = require "lib.enum"
local ui = require "lib.ui"

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
    if common.findImage(ui.createRole) then
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
function event.changeRole(role)
    toast("准备切换到 " .. role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not common.findImage(rolePng) do
        print("没找到目标角色，继续滑动...")
        -- 滑动角色列表
        slideRoleList()
        sleep(1000)
    end
    -- 找到角色了，重置滑动角色slider次数
    countSlideTimes = 0
    common.tapImage(rolePng)
    sleep(2000)
    tap(enum.chooseRole.x, enum.chooseRole.y)
    sleep(3000)
    if not ui.isHomePage() then
        event.changeRole(role)
    end
end

-- 收取邮件
function event.getEmail()
    toast("开始收取邮件")
    sleep(3000)
    tap(enum.email.x, enum.email.y)
    sleep(2000)
    toast("收取个人邮件")
    tap(enum.personalEmail.x, enum.personalEmail.y)
    sleep(2000)
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    sleep(3000)
    tap(enum.closeEmail.x, enum.closeEmail.y)
    toast("关闭邮件箱")
end

return event

