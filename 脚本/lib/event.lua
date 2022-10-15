-- 各种事件

local common = require "lib.common"
local enum = require "lib.enum"
local ui = require "lib.ui"

event = {}


-- 滑动角色列表
countSlideTimes = 0
slideDown = true
local function slideRoleList()
    local startX = slideDown and 273 or 487
    startY = 996
    local endX = slideDown and 487 or 273
    endY = 996
    if common.findImage("create_role.png") then
        -- 到底了，改变滑动方向
        slideDown = false
        countSlideTimes = 0
    elseif countSlideTimes > 20 then
        -- 划了很多次了，该转向了
        slideDown = not slideDown
        countSlideTimes = 0
    end
    touchDown(1, startX, startY)
    sleep(50)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- 切换角色
function event.changeRole(role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not common.findImage(rolePng) do
        -- 滑动角色列表
        slideRoleList()
        sleep(1000)
    end
    common.tapImage(rolePng)
    sleep(2000)
    tap(enum.chooseRole.x, enum.chooseRole.y)
    sleep(2000)
    if not ui.isHomePage() then
        event.changeRole(role)
    end
end

-- 收取邮件
function event.getEmail()
    sleep(3000)
    tap(enum.email.x, enum.email.y)
    sleep(2000)
    tap(enum.personalEmail.x, enum.personalEmail.y)
    sleep(2000)
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    sleep(3000)
    tap(enum.closeEmail.x, enum.closeEmail.y)
end

return event

