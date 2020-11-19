--游戏场景管理类
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.sceneId = SceneType.GameScene;
    self.fishGround = nil;
    self.pathManager = nil;
    self.gameHUD = nil;
    self.gameBg = nil;
    self.currentTime = 0;
    self.fishId = 0;

    self.hudCamera = nil;
    self.modelCamera = nil;
end

function m:EnterScene()
    print('---------------进入游戏场景');
end

function m:ExitScene()
    print('---------------离开游戏场景');
end


function m:init()
    self:initGameHUD();
    self:initGameBg();
    self:initFishGround();
end

function m:Update(deltaTime)
    self.currentTime = self.currentTime + deltaTime;
    if(self.currentTime > Constanct.CREATE_FISH_INTERVAL) then
        self.currentTime = 0;
        self:createFish();
    end
end

------------------------------------------------------------------
--初始化游戏UI页面
function m:initGameHUD()
    ResourceLoad.InstancePrefab(View[UIType.UIGameHUD].PrefabStr, View[UIType.UIGameHUD].LuaStr, function(lua)
        self.gameHUD = lua;
        self.hudCamera = self.gameHUD:getCamera();
    end);
end

function m:getHUDCamera()
    return self.hudCamera;
end

------------------------------------------------------------------
--初始化游戏背景
function m:initGameBg()
    ResourceLoad.InstancePrefab(View[UIType.GameBackground].PrefabStr, View[UIType.GameBackground].LuaStr, function(lua)
    end);
end
------------------------------------------------------------------
--初始化游戏渔场
function m:initFishGround()
    ResourceLoad.InstancePrefab(View[UIType.FishGround].PrefabStr, View[UIType.FishGround].LuaStr, function(lua)
        self.fishGround = lua;
        self.modelCamera = self.fishGround:getGameCamera();
    end);
end

function m:getGameCamera()
    return self.modelCamera;
end

--创建鱼
function m:createFish()
    if(self.fishGround ~= nil) then
        self.fishId = self.fishId + 1;
        self.fishGround:createFish(self.fishId)
    end
end

--击中鱼
function m:hitFish(showPos)
    self.gameHUD:showNet(showPos);
    if self.fishGround ~= nil then
        self.fishGround:hitFish(fishId);
    end
end

--鱼死亡
function m:fishDeath(fishId)
    if self.fishGround ~= nil then
        self.fishGround:deathFish(fishId);
    end
end

------------------------------------------------------------------


return m;