-- 各种事件

local common = require "lib.common"

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
    local x = -1
    y = -1
    ret, x, y = findPicEx(0, 0, 0, 0, role .. ".png", 0.9)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
        sleep(1000)
        tap(62, 957)
    else
        -- 滑动角色列表
        slideRoleList()
        event.changeRole(role)
    end
end

return event

