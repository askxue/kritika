-- 脚本主入口

-- 引用其他模块，并且起一个别名方便调用
local ui = require "lib.ui"
local event = require "lib.event"
local common = require "lib.common"
local enum = require "lib.enum"

-- 调用其他模块中的方法
if ui.isChooseRolePage() then
    toast("进入角色选择界面")

    -- 切换角色
    roleNum = 1
    event.changeRole(enum.roles[roleNum])
    common.await(ui.isHomePage)


else
    toast("请在角色选择界面开始")
    sleep(2000)
end

toast("执行完毕，我也可以休息了！(*^▽^*)")






