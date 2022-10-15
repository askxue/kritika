-- 一些公共方法

common = {}


-- 是否找到了某图
common.findImage = function(imageName)
    local x = -1
    y = -1
    print("找图片：" .. imageName)
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
    return x ~= -1 and y ~= -1
end

-- 点击某个图
common.tapImage = function(imageName)
    local x = -1
    y = -1
    ret, x, y = findPicEx(0, 0, 0, 0, imageName, 0.9)
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
