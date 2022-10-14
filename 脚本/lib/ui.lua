-- 各种UI相关的判断

local common = require "lib.common"
local enum = require "lib.enum"

ui = {}

-- 角色选择界面
ui.chooseRole = "choose_role.png"
ui.homePage = "home_page.png"



-- 是否为角色主界面
function ui.isHomePage()
    return common.findImage(ui.homePage)
end

-- 是否为角色选择界面
function ui.isChooseRolePage()
    return common.findImage(ui.chooseRole)
end

-- 返回选择角色界面
function ui.backToRolePage()
    sleep(2000)
    if ui.isHomePage() then
        tap(enum.setting.x, enum.setting.y)
        sleep(2000)
        tap(enum.settingRole.x, enum.settingRole.y)
    end
end

return ui
