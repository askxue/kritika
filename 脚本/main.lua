-- 脚本主入口

-- 引用其他模块，并且起一个别名方便调用
local ui = require "lib.ui"
local event = require "lib.event"
local common = require "lib.common"
local enum = require "lib.enum"

-- 一些全局变量
-- 当前角色索引
roleIndex = 1
-- 总共有多少个角色
roleNum = #enum.roles

-- 脚本必须从角色选择界面开始
if ui.isChooseRolePage() then
    toast("进入角色选择界面")
    while true do
        -- 切换角色，进入主界面
        event.changeRole(enum.roles[roleIndex])
        sleep(1000)

        -- 等待进入主界面
        common.await(ui.isHomePage)

        -- 1. 收邮件
        event.getEmail()


        -- 2. 黑市

        -- 返回角色选择界面
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






