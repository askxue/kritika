-- 各种UI相关的判断

local common = require "lib.common"
local enum = require "lib.enum"

ui = {}

-- 角色选择界面
ui.chooseRole = {
    sX = 562,
    sY = 461,
    eX = 697,
    eY = 884,
    png = "选择角色.png"
}
ui.createRole = "创建角色.png"
ui.homePage = "背包.png|副本模式.png|商店.png"
ui.marketPage = "黑市.png"
-- 角色列表UI范围
ui.roleList = {
    sX = 21,
    sY = 680,
    eX = 632,
    eY = 1223
}


-- 是否为角色主界面
ui.isHomePage = function()
    return common.isFindImage(ui.homePage)
end

-- 是否为角色选择界面
ui.isChooseRolePage = function()
    return common.isFindImageScoped(ui.chooseRole.sX, ui.chooseRole.sY, ui.chooseRole.eX, ui.chooseRole.eY, ui.chooseRole.png)
end

-- 是否为黑市界面
ui.isMarket = function()
    return common.isFindImage(ui.marketPage)
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

-- 是否到达了角色列表末尾
ui.isEndOfRoleList = function()
    return common.isFindImageScoped(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, ui.createRole)
end

-- 是否找到了某角色
ui.isFindRole = function(role)
    return common.isFindImageScoped(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, role)
end

-- 点击某个角色
ui.tapRole = function(role)
    common.tapImageScope(ui.roleList.sX, ui.roleList.sY, ui.roleList.eX, ui.roleList.eY, role)
end

return ui
