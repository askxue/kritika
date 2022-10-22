-- 一些公共方法

common = {}

-- 找图： 普通 & 高级找图，双重校验
common.findPicPlus = function(startX, startY, endX, endY, imageName)
    local ret, x, y = findPic(startX, startY, endX, endY, imageName, "101010", 0, 0.9)
    if x == -1 and y == -1 then
        -- 没找到图，使用高级查找再次尝试
        ret, x, y = findPicEx(startX, startY, endX, endY, imageName, 0.9)
    end
    return ret, x, y
end

-- 找某张图的所有位置： 全屏
common.findPicAllPoints = function(imageName)
    return common.findPicAllPointsScoped(0, 0, 0, 0, imageName)
end

-- 找某张图的所有位置： 指定范围
common.findPicAllPointsScoped = function(startX, startY, endX, endY, imageName)
    return findPicAllPoint(startX, startY, endX, endY, imageName, 0.9)
end

-- 是否找到了某图： 全屏
common.isFindImage = function(imageName)
    return common.isFindImageScoped(0, 0, 0, 0, imageName)
end

-- 是否找到了某图： 指定范围
common.isFindImageScoped = function(startX, startY, endX, endY, imageName)
    print(startX, startY, endX, endY, imageName)
    local ret, x, y = common.findPicPlus(startX, startY, endX, endY, imageName)
    print("找图[" .. imageName .. "]结果：" .. ret, x, y)
    return x ~= -1 and y ~= -1
end

-- 是否找到了某些颜色： 全屏
common.isFindColors = function(firstColor, offsetColor)
    return common.isFindColorsScoped(0, 0, 0, 0, firstColor, offsetColor)
end

-- 是否找到了某些颜色： 指定范围
common.isFindColorsScoped = function(startX, startY, endX, endY, firstColor, offsetColor)
    local x, y = findMultiColor(startX, startY, endX, endY, firstColor, offsetColor, 0, 0.9)
    return x ~= -1 and y ~= -1
end

-- 点击某个图
common.tapImage = function(imageName)
    common.tapImageScope(0, 0, 0, 0, imageName)
end

-- 范围点击图片
common.tapImageScope = function(startX, startY, endX, endY, imageName)
    local ret, x, y = common.findPicPlus(startX, startY, endX, endY, imageName)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
    end
end

-- 等待某条件成立
-- condition = 某个条件，应该是一个函数
common.await = function(condition)
    local timer = 0;
    while not condition() do
        sleep(1000)
        timer = timer + 1
        if timer > 3 then
            -- 进行检查，是否由于某些特殊原因，导致一直卡死在这了。
            common.closeTips()
        end
    end
    return true
end

-- 关闭今日活动提示
common.closeTips = function()
    common.tapImage(enum.world.notTips)
end

return common
