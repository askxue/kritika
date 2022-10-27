-- 脚本主入口

-- 引用其他模块 （统一放到main引入，避免循环引用导致脚本崩溃）
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

-- 单元测试区域

-- end

-- 从UI读取配置
config.load()

-- 一些全局变量
-- 当前角色索引
roleIndex = 1
-- 总共有多少个角色
roleNum = #enum.roles
-- 当前角色
currentRole = nil

-- 一些初始化工作
-- db.init()

-- 脚本必须从角色选择界面开始
if ui.isChooseRolePage() then
    toast("欢迎你，主人！让我来为你服务吧！^_^")
    while true do
        -- 切换角色，进入主界面
        currentRole = enum.roles[roleIndex]
        event.changeRole(currentRole)
        util.delay()

        -- 等待进入主界面
        common.await(ui.isHomePage)
        toast("成功进入主界面")

        -- 黑市
        if service.isMarketRefresh() then
            event.market()
        end

        -- 世界boss
        if tonumber(config.settings.boss) == 0 and not service.hasDoneBoss() then
            event.boss()
        end

        -- 公会签到
        if not service.hasSign() then
            event.sign()
        end

        -- 推月塔
        if tonumber(config.settings.tower) == 0 then
            event.monthTower()
        end

        -- 领每日任务奖励
        if tonumber(config.settings.daily) == 0 and not service.hasDoneDaily() then
            event.daily()
        end

        -- 收邮件
        if not service.hasDoneEmail() then
            event.getEmail()
        end

        -- 领每日任务奖励
        event.getAward()

        -- 返回角色选择界面
        toast("返回角色选择界面")
        ui.backToRolePage()
        common.await(ui.isChooseRolePage)
        -- 修改角色索引
        roleIndex = roleIndex >= roleNum and 1 or roleIndex + 1
    end

else
    toast("请在角色选择界面开始")
    util.delay()
end

toast("执行完毕，我也可以休息了！(*^▽^*)")






