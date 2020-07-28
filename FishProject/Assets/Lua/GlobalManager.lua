require("GemericFramework/ConstantManager")

local Class = require("Class")
local LuaBase = require("LuaBase")
local GameScene = require('Scene/GameScene')

local LocalServer = require("LocalServer/LocalServer");
local PlayerInfo = require(DataInstancePath.."PlayerInfo");
local GameRoomInfo = require(DataInstancePath.."GameRoomInfo");
local GamePlayerInfo = require(DataInstancePath.."GamePlayerInfo");

local m = {}

function m:New(o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function m:ctor()
    self.playerInfo = Class.New(PlayerInfo);
    self.roomInfo = Class.New(GameRoomInfo);
    self.server = Class.New(LocalServer);
end

function m:Instance()
    if(self.instance == nil) then
        self.instance = self:New();
        self.instance:ctor();
    end

    return self.instance;
end


--玩家登陆成功
function m:loginSuccess()
    self.playerInfo:init(1001);
    self:InitGameScene()
end
---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------
--玩家进入渔场
function m:enterMatch()
    --测试代码
    local info = Class.New(PlayerInfo)
    info.playerId           = 1001;
    info.matchId            = 1;
    info.seatId             = 1;
    info.uiSeatId           = 0;
    info.currentWeaponId    = 1;
    info.isOneSelf          = true;
    
    info.gold               = 9000000;
    info.diamond            = 9000000;
    info.currentWeaponValue = 100;
    self.roomInfo:playerIntoRoom(info);

    EvnetManager:EmitEvent(GameEventHandle.PlayerInMatch, self.roomInfo.selfPlayer);
end

function m:InitGameScene()
    self.gameScene = nil;
    ResourceLoad.InstancePrefab(Scene[SceneType.GameScene].PrefabStr, Scene[SceneType.GameScene].LuaStr, function(luaClass)
        self.gameScene = luaClass;
    end);
end

function m:getGameScene()
    return self.gameScene;
end


-------------------------------------------------------------
--击中鱼
function m:hitFish(hitInfo)
    if self.gameScene ~= nil then
        self.gameScene:hitFish(hitInfo.hitPos);
    end

    if(self.server ~= nil) then
        self.server:hitFish(hitInfo, function(deathFishId) 
            if(deathFishId > 0) then
                self:fishDeath(deathFishId);
            end
        end);
    end
end

--鱼死亡
function m:fishDeath(deathFishId)
    if self.gameScene ~= nil then
        self.gameScene:fishDeath(deathFishId);
    end
end

---------------------------------------------------------------------------------------------------

return m;





