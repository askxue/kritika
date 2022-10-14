-- 一些公共方法

common = {}


-- 是否找到了某图
function common.findImage(imageName, ...)
    local x = -1
    y = -1
    local images = imageName .. "|" .. table.concat({ ... }, "|")
    ret, x, y = findPicEx(0, 0, 0, 0, images, 0.9)
    return x ~= -1 and y ~= -1
end

-- 等待某条件成立
-- condition = 某个条件，应该是一个函数
function common.await(condition)
    while not condition() do
        sleep(1000)
    end
    return true
end

return common
