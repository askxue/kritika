-- �ű������

-- ��������ģ�飬������һ�������������
local ui = require "lib.ui"
local event = require "lib.event"
local common = require "lib.common"
local enum = require "lib.enum"

-- ��������ģ���еķ���
if ui.isChooseRolePage() then
    toast("�����ɫѡ�����")

    -- �л���ɫ
    roleNum = 1
    event.changeRole(enum.roles[roleNum])
    common.await(ui.isHomePage)


else
    toast("���ڽ�ɫѡ����濪ʼ")
    sleep(2000)
end

toast("ִ����ϣ���Ҳ������Ϣ�ˣ�(*^��^*)")






