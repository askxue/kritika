-- 各种UI相关的判断

local common = require "lib.common"
local enum = require "lib.enum"

ui = {}

-- 角色选择界面
ui.chooseRole = "选择角色.png"
ui.createRole = "创建角色.png"
ui.homePage = "背包.png|副本模式.png"




-- 是否为角色主界面
ui.isHomePage = function()
    return common.findImage(ui.homePage)
end

-- 是否为角色选择界面
ui.isChooseRolePage = function()
    return common.findImage(ui.chooseRole)
end

-- 返回选择角色界面
ui.backToRolePage = function()
    sleep(2000)
    if ui.isHomePage() then
        tap(enum.setting.x, enum.setting.y)
        sleep(2000)
        tap(enum.settingRole.x, enum.settingRole.y)
    end
end

return ui
