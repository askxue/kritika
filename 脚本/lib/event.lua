-- �����¼�

local common = require "lib.common"
local enum = require "lib.enum"
local ui = require "lib.ui"

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
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not common.findImage(rolePng) do
        -- ������ɫ�б�
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

-- ��ȡ�ʼ�
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

