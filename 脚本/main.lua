-- �ű������

-- ��������ģ�飬������һ�������������
local ui = require "lib.ui"
local event = require "lib.event"
local common = require "lib.common"
local enum = require "lib.enum"

-- һЩȫ�ֱ���
-- ��ǰ��ɫ����
roleIndex = 1
-- �ܹ��ж��ٸ���ɫ
roleNum = #enum.roles

-- �ű�����ӽ�ɫѡ����濪ʼ
if ui.isChooseRolePage() then
    toast("�����ɫѡ�����")
    while true do
        -- �л���ɫ������������
        event.changeRole(enum.roles[roleIndex])
        sleep(1000)

        -- �ȴ�����������
        common.await(ui.isHomePage)

        -- 1. ���ʼ�
        event.getEmail()


        -- 2. ����

        -- ���ؽ�ɫѡ�����
        ui.backToRolePage()
        common.await(ui.isChooseRolePage)
        -- �޸Ľ�ɫ����
        roleIndex = roleIndex >= roleNum and 1 or roleIndex + 1
    end

else
    toast("���ڽ�ɫѡ����濪ʼ")
    sleep(2000)
end

toast("ִ����ϣ���Ҳ������Ϣ�ˣ�(*^��^*)")






