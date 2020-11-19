--场景类型
SceneType =
{
    EnterScene = 0,
    LoadingScene = 1,
    CGScene = 2,
    LoginScene = 3,
    LobbyScene = 4,
    GameScene = 5
}

--场景定义
Scene = 
{
    [SceneType.EnterScene] = {SceneType = SceneType.EnterScene, LuaStr = ""}, --入口场景
    [SceneType.LoadingScene] = {SceneType = SceneType.LoadingScene, LuaStr = ""}, --Loading场景
    --可控制场景
    [SceneType.CGScene] = {SceneType = SceneType.CGScene, LuaStr = "Modules/CG/CGScene"},   --CG场景
    [SceneType.LoginScene] = {SceneType = SceneType.LoginScene, LuaStr = "Modules/Login/LoginScene"},   --登录场景
    [SceneType.LobbyScene] = {SceneType = SceneType.LobbyScene, LuaStr = "Modules/Lobby/LobbyScene"},   --大厅场景
    [SceneType.GameScene] = {SceneType = SceneType.GameScene, LuaStr = "Modules/Game/GameScene"},    --游戏场景
}



-------------------------------------------------------------------------------------------------------------------------------
--页面类型定义

--UI层级
UILevel = 
{
    NONE = 0,
    Low = 1,
    Normal = 2,
    Hight = 3
}

--UI类型
UIType ={
    MainView = 1,
    View     = 2,
    Popup    = 3
}


--UI索引Id
UIID = 
{
     --登录场景界面(2~99)
    UILogin = 2,
    --UI场景界面(100~198)

    --游戏场景界面（199~ 300）
    FishGround = 199,
    UIGameHUD = 200,
    FishPathManager = 201,
    UITurret = 202,
    UITouch = 203,
    UIHUDMenu = 204,
    UIBulletManager = 205,

    GameBackground = 299,

    --游戏场景组件
    TurretCell = 301,
    BulletCell = 302,
    NetCell    = 303
}

UIRoot = {PrefabStr = "UIRoot.prefab", LuaStr = "Modules/UIRoot.lua"};

View =
{
    --登录场景界面(2~99)
    [UIID.UILogin] = {Type = UIType.View, Level = UILevel.Normal, PrefabStr = "Login/UILogin.prefab", LuaStr = "Modules/Login/View/UILogin.lua"}, --渔场实体管理页面
    --UI场景界面(100~198)
    --游戏场景界面（199~ 300）
    [199] = {UIType = 199, Level = 0, PrefabStr = "Game/FishGround.prefab", LuaStr = "Game/FishGround.lua"}, --渔场实体管理页面
    [200] = {UIType = 200, Level = 0, PrefabStr = "Game/GameHUD.prefab", LuaStr = "Game/GameHUD.lua"}, --游戏场景HUD管理页面
    [201] = {UIType = 201, Level = 0, PrefabStr = "Game/PathManager.prefab", LuaStr = "Game/FishPathManager.lua"}, --鱼路径管理

    [202] = {UIType = 202, Level = 2, PrefabStr = "Game/HUD/UITurret.prefab", LuaStr = "Game/HUD/UITurret.lua"}, --炮台页面
    [203] = {UIType = 203, Level = 1, PrefabStr = "Game/HUD/UITouch.prefab", LuaStr = "Game/HUD/UITouch.lua"}, --点击管理页面
    [204] = {UIType = 204, Level = 2, PrefabStr = "Game/HUD/UIHUDMenu.prefab", LuaStr = "Game/HUD/UIHUDMenu.lua"}, --菜单页面
    [205] = {UIType = 205, Level = 1, PrefabStr = "Game/HUD/UIBulletManager.prefab", LuaStr = "Game/HUD/UIBulletManager.lua"}, --子弹管理页面
    
    [299] = {UIType = 299, Level = 0, PrefabStr = "Game/GameBG.prefab", LuaStr = "Game/GameBg.lua"}, --渔场背景页面
    --游戏场景组件
    [301] = {UIType = 301, Level = 0, PrefabStr = "Game/HUD/Common/TurretCell.prefab", LuaStr = "Game/HUD/TurretCell.lua"},
    [302] = {UIType = 302, Level = 0, PrefabStr = "Game/HUD/Common/BulletCell.prefab", LuaStr = "Game/HUD/Bullet.lua"},
    [303] = {UIType = 303, Level = 0, PrefabStr = "Game/HUD/Common/NetCell.prefab", LuaStr = "Game/HUD/Net.lua"},
}

-------------------------------------------------------------------------------------------------------------------------------
--鱼表格
FishModel = 
{
    --小鱼（1~99）
    [1] = {FishType = 1, PathName = "Path0001", ModelStr = "Game/Model/Fish/FengWeiYuBlue.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    [2] = {FishType = 1, PathName = "Path0002", ModelStr = "Game/Model/Fish/FengWeiYuPink.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    --中鱼（100~199）
    [101] = {FishType = 2, PathName = "Path0003", ModelStr = "Game/Model/Fish/BianFuYuBlue.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    [102] = {FishType = 2, PathName = "Path0004", ModelStr = "Game/Model/Fish/BianFuYuOrange.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    [103] = {FishType = 2, PathName = "Path0005", ModelStr = "Game/Model/Fish/DengLongYu.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    [104] = {FishType = 2, PathName = "Path0006", ModelStr = "Game/Model/Fish/HaiDaoYu.prefab", LuaStr = "Game/FishGround/Fish.lua"},
    --大鱼（200~299）
    [200] = {FishType = 3, PathName = "Path0007", ModelStr = "Game/Model/Fish/ShaYu.prefab", LuaStr = "Game/FishGround/Fish.lua"},
}

--鱼的类型(小鱼， 普通， 大鱼)
FishTypes = 
{
    Small = 1,
    Medium = 2,
    Big = 3
}

-------------------------------------------------------------------------------------------------------------------------------
--日志等级
LogType = 
{
    Normal = 0,
    Warning = 1,
    Error = 2,
}

--常量定义
Constanct = 
{
    MAX_TURRET_COUNT = 4,       --最大显示人数
    CREATE_FISH_INTERVAL = 0.5, --创建鱼间隔(秒)
    MAX_FISH_COUNT = 5,        --最大显示鱼的数量
    NET_DISPLAY_SECOND = 1.0,   --渔网显示时间
}

