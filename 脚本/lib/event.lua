-- �����¼�

local common = require "lib.common"

event = {}


-- ������ɫ�б�
countSlideTimes = 0
slideDown = true
local function slideRoleList()
    local startX = slideDown and 273 or 487
    startY = 996
    local endX = slideDown and 487 or 273
    endY = 996
    if common.findImage("create_role.png") then
        -- �����ˣ��ı们������
        slideDown = false
        countSlideTimes = 0
    elseif countSlideTimes > 20 then
        -- ���˺ܶ���ˣ���ת����
        slideDown = not slideDown
        countSlideTimes = 0
    end
    touchDown(1, startX, startY)
    sleep(50)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- �л���ɫ
function event.changeRole(role)
    local x = -1
    y = -1
    ret, x, y = findPicEx(0, 0, 0, 0, role .. ".png", 0.9)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
        sleep(1000)
        tap(62, 957)
    else
        -- ������ɫ�б�
        slideRoleList()
        event.changeRole(role)
    end
end

return event

