-- 各种UI相关的判断

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
-- 刷世界boss，讨伐符石不足，不刷了。
ui.pveBossNoRune = {
    sX = 150,
    sY = 351,
    eX = 530,
    eY = 926,
    png = "讨伐符石不足.png",
    cancel = {
        x = 270,
        y = 755
    }
}

-- 找色
-- 世界boss战斗结束画面
ui.bossOver = {
    firstColor = "14CAF8",
    offsetColor = "-173|-305|2CFFB2|-236|113|FFFFFF|-71|456|32CEE1"
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

-- 是否boss战结束界面
ui.isBossOver = function()
    return common.isFindColors(ui.bossOver.firstColor, ui.bossOver.offsetColor)
end

-- 返回选择角色界面
ui.backToRolePage = function()
    util.delay()
    if ui.isHomePage() then
        tap(enum.setting.x, enum.setting.y)
        util.delay()
        tap(enum.settingRole.x, enum.settingRole.y)
    end
end

-- 返回主页
ui.backToHomePage = function()
    util.delay()
    if not ui.isHomePage() then
        tap(enum.roleProfile.x, enum.roleProfile.y)
        util.delay()
        tap(enum.hall.x, enum.hall.y)
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
