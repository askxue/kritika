-- 各种常量枚举

enum = {}

-- 各职业角色简称
enum.roles = {
    --"斩狂",
    --"拳刹",
    --"剑魔",
    --"丽娜",
    --"克莱尔",
    --"浪",
    --"赤羽灵",
    --"风舞星",
    --"火先锋",
    --"魔影师",
    "凌云",
    "魅罗刹",
    "鬼剑姬",
    "霜语者",
    "自在天",
    "御灵者",
    "天狼星",
    "夜摩天",
    "猎刃星",
    "血妖姬",
    "符纹者",
    "缔约者"
    --"时空术士"
}

-- 各种事件名（每天一次的那种）
enum.dailyEvents = {
    boss = "刷世界Boss",
    email = "收邮件",
    sign = "公会签到",
    daily = "每日任务"
}

-- 各种道具
enum.items = {
    gold = "金币.png"
}

-- 各种文字 （暂时用图片来替代）
enum.world = {
    yes = "确定.png",
    shop = "商店.png",
    notTips = "今日不再提示.png",
    canChallenge = "可以挑战.png",
    getAward = "排名奖励.png",
    gift = "特价礼包.png"
}

-- 黑市要买的物品
enum.buyList = {
    "疲劳值.png",
    "宠物碎片.png",
    "魔晶.png",
    "强化传承材料.png"
}

-- 邮件箱坐标
enum.email = { x = 674, y = 1150 }
-- 个人邮件
enum.personalEmail = { x = 518, y = 448 }
-- 3日内邮件
enum.fewDaysEmail = { x = 464, y = 590 }
-- 删除已确认过的邮件
enum.deleteEmail = { x = 467, y = 298 }
-- 关闭邮件箱
enum.closeEmail = { x = 599, y = 1146 }

-- 角色头像
enum.roleProfile = { x = 675, y = 40 }
-- 大厅icon
enum.hall = { x = 567, y = 66 }
-- 角色icon
enum.roleIcon = { x = 256, y = 366 }
-- 选择角色
enum.chooseRole = { x = 62, y = 959 }

-- 设置icon
enum.setting = { x = 672, y = 1236 }
enum.settingRole = { x = 518, y = 1237 }

-- 条件最大超时时长 5s
enum.timeout = 5

-- 黑市
enum.market = { x = 55, y = 206 }
enum.marketBegin = { x = 35, y = 131 }
enum.marketEnd = { x = 526, y = 1135 }
enum.marketClose = { x = 630, y = 1147 }

-- 挑战模式
enum.pve = { x = 401, y = 1054 }
enum.boss = { x = 138, y = 334 }
enum.boss_challenge = { x = 323, y = 633 }
enum.boss_getAward = { x = 46, y = 642 }
enum.start = { x = 50, y = 1067 }
enum.continue = { x = 64, y = 630 }
enum.back = { x = 683, y = 1137 }

-- 竞技模式

-- 一些功能模块位置，一般都是固定位置，直接tap点击即可。
-- 每日任务
enum.daily = { x = 55, y = 773 }
enum.daily_getAll = { x = 617, y = 947 }
enum.daily_close = { x = 653, y = 1153 }

-- 领取排名奖励
enum.award_yes = { x = 135, y = 636 }

-- 公会
enum.consortia = { x = 670, y = 995 }
enum.consortia_sign = { x = 410, y = 523 }
enum.consortia_sign_outer = { x = 283, y = 1228 }

-- 特价礼包
enum.gift_close = { x = 634, y = 1134 }

-- 试练塔
enum.monthTower = { x = 405, y = 791 }

return enum
