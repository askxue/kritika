-- 脚本主入口

-- 引用其他模块 （统一放到main引入，避免循环引用导致脚本崩溃）
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


-- TODO 事项
-- 转圈延迟，统一弄一个sleep方法，里面统一设置延迟时间。
-- 弄成UI 配置，可以根据运行环境，手动调整该延迟设置。

-- 一些全局变量
-- 当前角色索引
roleIndex = 1
-- 总共有多少个角色
roleNum = #enum.roles
-- 当前角色
currentRole = nil

-- 一些初始化工作
-- TODO 有精力再去研究面向对象开发，先实现最基本的脱机版
-- db.init()

print("现在时间:" .. date.now())

-- 脚本必须从角色选择界面开始
if ui.isChooseRolePage() then
    toast("欢迎你，主人！让我来为你服务吧！^_^")
    while true do
        -- 切换角色，进入主界面
        currentRole = enum.roles[roleIndex]
        event.changeRole(currentRole)
        sleep(1000)

        -- 等待进入主界面
        common.await(ui.isHomePage)
        print("成功进入主界面")
        toast("成功进入主界面")

        -- 1. 收邮件

        event.getEmail()

        -- 2. 黑市
        event.market()

        -- 领取排名奖励
        --event.award()

        -- 3. 世界boss
        event.boss()



        -- 返回角色选择界面
        toast("返回角色选择界面")
        ui.backToRolePage()
        common.await(ui.isChooseRolePage)
        -- 修改角色索引
        roleIndex = roleIndex >= roleNum and 1 or roleIndex + 1
    end

else
    toast("请在角色选择界面开始")
    sleep(2000)
end

toast("执行完毕，我也可以休息了！(*^▽^*)")






