-- 各种UI相关的判断

-- 定义一个名为ui的模块
ui = {}

ui.name = "我是常量"

-- 公有函数
function ui.isHome()
    print("我是公有函数，可以从模块外部调用")
end

function ui.test2()
    test()
end

local function test()
    print("我是私有函数，不能从模块外部调用")
end

return ui
