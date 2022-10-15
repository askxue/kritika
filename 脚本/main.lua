-- 脚本主入口

-- 引用其他模块，并且起一个别名方便调用
local ui = require "lib.ui"
local event = require "lib.event"
local common = require "lib.common"
local enum = require "lib.enum"
local db = require "lib.db"

-- 一些全局变量
-- 当前角色索引
roleIndex = 1
-- 总共有多少个角色
roleNum = #enum.roles

-- 一些初始化工作
-- TODO 有精力再去研究面向对象开发，先实现最基本的脱机版
-- db.init()


-- 脚本必须从角色选择界面开始
if ui.isChooseRolePage() then
    toast("欢迎你，主人！让我来为你服务吧！^_^")
    while true do
        -- 切换角色，进入主界面
        event.changeRole(enum.roles[roleIndex])
        sleep(1000)

        -- 等待进入主界面
        common.await(ui.isHomePage)
        print("成功进入主界面")
        toast("成功进入主界面")

        -- 1. 收邮件
        event.getEmail()

        -- 2. 黑市
        event.market()

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






