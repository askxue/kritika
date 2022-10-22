-- �ű������

-- ��������ģ�� ��ͳһ�ŵ�main���룬����ѭ�����õ��½ű�������
require "lib.common"
require "lib.config"
require "lib.date"
require "lib.db"
require "lib.enum"
require "lib.event"
require "lib.log"
require "lib.service"
require "lib.ui"
require "lib.util"

-- һЩȫ�ֱ���
-- ��ǰ��ɫ����
roleIndex = 1
-- �ܹ��ж��ٸ���ɫ
roleNum = #enum.roles
-- ��ǰ��ɫ
currentRole = nil

-- һЩ��ʼ������
-- db.init()

print("����ʱ��:" .. date.now())

-- �ű�����ӽ�ɫѡ����濪ʼ
if ui.isChooseRolePage() then
    toast("��ӭ�㣬���ˣ�������Ϊ�����ɣ�^_^")
    while true do
        -- �л���ɫ������������
        currentRole = enum.roles[roleIndex]
        event.changeRole(currentRole)
        util.delay()

        -- �ȴ�����������
        common.await(ui.isHomePage)
        print("�ɹ�����������")
        toast("�ɹ�����������")

        -- 1. ���ʼ�

        event.getEmail()

        -- 2. ����
        event.market()

        -- ��ȡ��������
        --event.award()

        -- 3. ����boss
        event.boss()

        -- 4. ��ÿ��������
        event.daily()



        -- ���ؽ�ɫѡ�����
        toast("���ؽ�ɫѡ�����")
        ui.backToRolePage()
        common.await(ui.isChooseRolePage)
        -- �޸Ľ�ɫ����
        roleIndex = roleIndex >= roleNum and 1 or roleIndex + 1
    end

else
    toast("���ڽ�ɫѡ����濪ʼ")
    util.delay()
end

toast("ִ����ϣ���Ҳ������Ϣ�ˣ�(*^��^*)")






