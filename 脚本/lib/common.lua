-- 一些公共方法

common = {}

-- 找图： 普通 & 高级找图，双重校验
local function findPicPlus(startX, startY, endX, endY, imageName)
    local ret, x, y = findPic(startX, startY, endX, endY, imageName, "101010", 0, 0.9)
    if x == -1 and y == -1 then
        -- 没找到图，使用高级查找再次尝试
        ret, x, y = findPicEx(startX, startY, endX, endY, imageName, 0.9)
    end
    return ret, x, y
end

-- 是否找到了某图
common.findImage = function(imageName)
    return common.findImageScoped(0, 0, 0, 0, imageName)
end

-- 范围找图
common.findImageScoped = function(startX, startY, endX, endY, imageName)
    print(startX, startY, endX, endY, imageName)
    local ret, x, y = findPicPlus(startX, startY, endX, endY, imageName)
    print("找图[" .. imageName .. "]结果：" .. ret, x, y)
    return x ~= -1 and y ~= -1
end


-- 点击某个图
common.tapImage = function(imageName)
    common.tapImageScope(0, 0, 0, 0, imageName)
end

-- 范围点击图片
common.tapImageScope = function(startX, startY, endX, endY, imageName)
    local ret, x, y = findPicPlus(startX, startY, endX, endY, imageName)
    if x ~= -1 and y ~= -1 then
        tap(x, y)
    end
end

-- 等待某条件成立
-- condition = 某个条件，应该是一个函数
common.await = function(condition)
    while not condition() do
        sleep(1000)
    end
    return true
end

return common
