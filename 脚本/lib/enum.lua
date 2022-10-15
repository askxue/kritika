-- 各种常量枚举

enum = {}

-- 各职业角色简称
enum.roles = {
    "zhankuang",
    "chiyuling",
    "lina",
    "kelaier",
    "quansha",
    "jianmo",
    "shikong",
    "fengwuxing",
    "huoxianfeng",
    "moyingshi",
    "lingyun",
    "meiluocha",
    "guijianji",
    "shuangyuzhe",
    "zizaitian",
    "yulingzhe",
    "tianlangxing",
    "lang",
    "yemotian",
    "lierenxing",
    "xueyaoji",
    "fuwenzhe",
    "diyuezhe"
}

-- 邮件箱坐标
enum.email = { x = 674, y = 1150 }
-- 个人邮件
enum.personalEmail = { x = 518, y = 448 }
-- 3日内邮件
enum.fewDaysEmail = { x = 464, y = 590 }
-- 关闭邮件箱
enum.closeEmail = { x = 599, y = 1146 }

-- 角色头像
enum.roleProfile = { x = 675, y = 40 }
-- 角色icon
enum.roleIcon = { x = 256, y = 366 }
-- 选择角色
enum.chooseRole = { x = 62, y = 959 }

-- 设置icon
enum.setting = { x = 672, y = 1236 }
enum.settingRole = { x = 518, y = 1237 }

-- 条件最大超时时长 5s
enum.timeout = 5

return enum
