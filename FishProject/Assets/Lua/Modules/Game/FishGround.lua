--渔场管理类
local LuaBase = require("LuaBase")
local Class =  require("Class")
local FishInfo = require(DataInstancePath.."FishInfo");

local m = Class.New(LuaBase);
                                                                             
function m:ctor()
    self.gameCamera = nil;
    self.smallFishNode = nil;
    self.mediumFishNode = nil;
    self.bigFishNode = nil;
    self.fishCount = 0;
    self.fishTableId = {1, 2, 101, 102, 103, 104, 200};
    self.fishClassList = {};
end

--注册消息消息
function m:registeredListener()
    -- EvnetManager:AddListener(GameEventHandle.PlayerFireBullet, function(bulletInfo) 
    --     self:playerFireBullet(bulletInfo);
    -- end);
end

--注销消息监听
function m:removeListener()
end

function m:init()
    self:initNode();
    self:initFishPath();
end

function m:initNode()
    self.gameCamera = self.transform:Find("GameCamera"):GetComponent("Camera");
    self.smallFishNode = self.transform:Find("SmallFish");
    self.mediumFishNode = self.transform:Find("MediumFish");
    self.bigFishNode = self.transform:Find("BigFish");
end

function m:getGameCamera()
    return self.gameCamera;
end
------------------------------------------------------------------------------------------------------------------
--创建鱼实体
function m:createFish(fishId)
    if self.pathManager == nil then
        return;
    end

    if(self.fishCount > Constanct.MAX_FISH_COUNT) then
        return;
    end

   local info = Class.New(FishInfo);
   local index = (fishId % table.maxn(self.fishTableId)) + 1;
   local fishTableId = self.fishTableId[index];
   local speed = math.random(8, 15);

   info:setFishInfo(fishId, fishTableId, speed, FishModel[fishTableId].FishType);
   ResourceLoad.CreateFish(FishModel[fishTableId].LuaStr, info, self.smallFishNode, function(luaClass, fishInfo)
        local pathManager = self:getFishPath(FishModel[fishTableId].PathName);
        if pathManager == nil then
            LuaTool.DebugLog(LogType.Error, "Do Fish pathName = " + FishModel[fishTableId].PathName);
            return;
        end

        luaClass:createFish(fishInfo, FishModel[fishInfo.fishId].ModelStr, pathManager);
        self.fishClassList[fishInfo.instanceId] = luaClass;
        self.fishCount = self.fishCount + 1;
    end);
end

--击中鱼
function m:hitFish(fishId)
end

--鱼死亡
function m:deathFish(fishId)
    if(self.fishClassList[fishId] ~= nil) then
        self.fishCount = self.fishCount - 1;
        self.fishClassList[fishId]:fishDeath();
    end
end

------------------------------------------------------------------------------------------------------------------
--- 创建鱼路径管理
function m:initFishPath()
    ResourceLoad.InstancePrefab(View[UIType.FishPathManager].PrefabStr, View[UIType.FishPathManager].LuaStr, function(lua)
        self.pathManager = lua;
    end);
end

function m:getFishPath(pathName)
    if self.pathManager ~= nil then
       return self.pathManager:getPathManager(pathName);
    else
        return nil;
    end
end

return m;