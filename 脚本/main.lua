-- �ű������

-- ��������ģ�� ��ͳһ�ŵ�main���룬����ѭ�����õ��½ű�������
require "lib.common"
require "lib.config"
require "lib.data"
require "lib.date"
require "lib.db"
require "lib.enum"
require "lib.event"
require "lib.log"
require "lib.service"
require "lib.ui"
require "lib.util"

-- ��Ԫ��������

-- end

-- ��UI��ȡ����
config.load()

-- һЩȫ�ֱ���
-- ��ǰ��ɫ����
roleIndex = 1
-- �ܹ��ж��ٸ���ɫ
roleNum = #enum.roles
-- ��ǰ��ɫ
currentRole = nil

-- һЩ��ʼ������
-- db.init()

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
        toast("�ɹ�����������")

        -- ����
        if service.isMarketRefresh() then
            event.market()
        end

        -- ����boss
        if tonumber(config.settings.boss) == 0 and not service.hasDoneBoss() then
            event.boss()
        end

        -- ����ǩ��
        if not service.hasSign() then
            event.sign()
        end

        -- ������
        if tonumber(config.settings.tower) == 0 then
            event.monthTower()
        end

        -- ��ÿ��������
        if tonumber(config.settings.daily) == 0 and not service.hasDoneDaily() then
            event.daily()
        end

        -- ���ʼ�
        if not service.hasDoneEmail() then
            event.getEmail()
        end

        -- ��ÿ��������
        event.getAward()

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






