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

-- 月塔
ui.monthTower = {
    first = "月塔1层",
    last = "月塔65层",
    notClear = "没清理的楼层.png",
    homePage = {
        sX = 534,
        sY = 86,
        eX = 658,
        eY = 383,
        png = "试练塔.png"
    },
    sX = 42,
    sY = 127,
    eX = 500,
    eY = 604,
    -- 开始按钮坐标
    start = {
        x = 27,
        y = 1069
    },
    -- 点击屏幕继续刷
    continue = {
        x = 106,
        y = 636
    },
    -- 成功结束画面
    success = {
        firstColor = "3DEEFF",
        offsetColor = "-1|63|44FFFF|1|127|49FFFF|-4|229|44FFFF|1|364|38DDFF|-6|263|44FFFF",
        secondColor = "58E0FF",
        secondOffsetColor = "49|148|AAFFFF|23|243|44FFFF|22|275|44FFFF|46|321|99FFFF|37|385|66FFFF",
        sX = 524,
        sY = 403,
        eX = 670,
        eY = 887
    },
    -- 失败结束画面
    failed = {
        firstColor = "31CCDE",
        offsetColor = "3|81|000000|135|-50|BBBBBB|119|54|BBBBBB|-179|-89|2BB27A"
    },
    -- 物理、魔法塔
    types = {
        physics = {
            x = 541,
            y = 249
        },
        magic = {
            x = 539,
            y = 505
        }
    }
}

ui.monthTower_types = {
    "physics",
    "magic"
}


-- 找色
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
    local findColor = common.isFindColorsScoped(data.bossOver.sX, data.bossOver.sY, data.bossOver.eX, data.bossOver.eY, data.bossOver.firstColor, data.bossOver.offsetColor)
    local findPng = common.isFindImageScoped(data.bossOver.png.sX, data.bossOver.png.sY, data.bossOver.png.eX, data.bossOver.png.eY, data.bossOver.png.name)
    print('find color', findColor)
    print('find png', findPng)
    toast('find color and png ', findColor, findPng)
    return findColor or findPng
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

-- 是否试练塔主界面
ui.isHomePageOfTower = function()
    return common.isFindImageScoped(ui.monthTower.homePage.sX, ui.monthTower.homePage.sY, ui.monthTower.homePage.eX, ui.monthTower.homePage.eY, ui.monthTower.homePage.png)
end

-- 是否到达了月塔第一层
ui.isFirstFloorOfTower = function()
    local first = ui.monthTower.first .. ".png" .. "|" .. ui.monthTower.first .. "_1.png"
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, first)
end

-- 是否到达了月塔最后一层
ui.isLastFloorOfTower = function()
    local last = ui.monthTower.last .. ".png" .. "|" .. ui.monthTower.last .. "_1.png"
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, last)
end

-- 是否有未清理楼层
ui.hasNotClearFloor = function()
    return common.isFindImageScoped(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, ui.monthTower.notClear)
end

-- 获取未清理的楼层的坐标
ui.notClearFloorOfTower = function()
    return common.findPicPlus(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, ui.monthTower.notClear)
end

-- 点击试练塔第一层
ui.tapFirstFloorOfTower = function()
    local first = ui.monthTower.first .. ".png" .. "|" .. ui.monthTower.first .. "_1.png"
    common.tapImageScope(ui.monthTower.sX, ui.monthTower.sY, ui.monthTower.eX, ui.monthTower.eY, first)
end

-- 讨伐符石不足
ui.noRune = function()
    return common.isFindImageScoped(ui.pveBossNoRune.sX, ui.pveBossNoRune.sY, ui.pveBossNoRune.eX, ui.pveBossNoRune.eY, ui.pveBossNoRune.png)
end

-- 该层塔是否刷完（成功）
ui.isFloorClearOver = function()
    local firstColor = common.isFindColors(ui.monthTower.success.firstColor, ui.monthTower.success.offsetColor)
    local secondColor = common.isFindColorsScoped(ui.monthTower.success.sX, ui.monthTower.success.sY, ui.monthTower.success.eX, ui.monthTower.success.eY, ui.monthTower.success.secondColor, ui.monthTower.success.secondOffsetColor)
    return firstColor or secondColor
end

-- 该层塔是否刷完（失败）
ui.isFloorClearFailed = function()
    return common.isFindColors(ui.monthTower.failed.firstColor, ui.monthTower.failed.offsetColor)
end

return ui
