-- 各种UI相关的判断

local common = require "lib.common"

ui = {}

-- 角色选择界面
ui.chooseRole = "choose_role"
ui.homePage = "home_page"



-- 是否为角色主界面
function ui.isHomePage()
    return common.findImage(ui.homePage)
end

-- 是否为角色选择界面
function ui.isChooseRolePage()
    return common.findImage(ui.chooseRole)
end

return ui
