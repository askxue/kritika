-- �����¼�

local common = require "lib.common"
local enum = require "lib.enum"
local ui = require "lib.ui"

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
    if common.findImage(ui.createRole) then
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
    sleep(200)
    touchMoveEx(1, endX, endY, 800)
    touchUp(1)
    countSlideTimes = countSlideTimes + 1
end


-- �л���ɫ
function event.changeRole(role)
    toast("׼���л��� " .. role)
    local rolePng = role .. ".png" .. "|" .. role .. "_1.png"
    while not common.findImage(rolePng) do
        print("û�ҵ�Ŀ���ɫ����������...")
        -- ������ɫ�б�
        slideRoleList()
        sleep(1000)
    end
    -- �ҵ���ɫ�ˣ����û�����ɫslider����
    countSlideTimes = 0
    common.tapImage(rolePng)
    sleep(2000)
    tap(enum.chooseRole.x, enum.chooseRole.y)
    sleep(3000)
    if not ui.isHomePage() then
        event.changeRole(role)
    end
end

-- ��ȡ�ʼ�
function event.getEmail()
    toast("��ʼ��ȡ�ʼ�")
    sleep(3000)
    tap(enum.email.x, enum.email.y)
    sleep(2000)
    toast("��ȡ�����ʼ�")
    tap(enum.personalEmail.x, enum.personalEmail.y)
    sleep(2000)
    tap(enum.fewDaysEmail.x, enum.fewDaysEmail.y)
    sleep(3000)
    tap(enum.closeEmail.x, enum.closeEmail.y)
    toast("�ر��ʼ���")
end

return event

