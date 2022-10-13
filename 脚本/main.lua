-- 脚本主入口

-- 引用其他模块，并且起一个别名方便调用
local ui = require "ui"

-- 调用其他模块中的方法


-- 提示信息
toast("主人，欢迎你！")

-- 休眠 xx 毫秒
sleep(1000 * 2)

print(ui.name)

ui.test2()


-- 区域多点找色： 寻找游戏Icon
local ret = findMultiColorAll(24, 184, 615, 574, "E4E000", "32|17|FFFFFF", 0, 0.9)

-- 打印lua table类型数据，输出json格式
print(jsonLib.encode(ret))

-- 找到目标了
if ret ~= nil then

    -- lua的table，索引是从1开始的
    local firstColor = ret[1]
    -- 点击指定坐标
    tap(firstColor.x, firstColor.y)

end






