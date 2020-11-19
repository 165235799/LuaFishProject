local Class = require("Class");
local LuaBase = require("LuaBase");
--场景管理
local SceneManager = require("Modules/SceneManager");
local UIManager    = require("Modules/UIManager");

-- local LocalServer = require("LocalServer/LocalServer");
-- local PlayerInfo = require(DataInstancePath.."PlayerInfo");
-- local GameRoomInfo = require(DataInstancePath.."GameRoomInfo");
-- local GamePlayerInfo = require(DataInstancePath.."GamePlayerInfo");

local m = {}

function m:New(o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function m:ctor()
    self.sceneManager = Class.New(SceneManager);
    self.uiManager = Class.New(UIManager);

    self.sceneManager:InitSceneEvent();
end

function m:Instance()
    if(self.instance == nil) then
        self.instance = self:New();
        self.instance:ctor();
    end

    return self.instance;
end
---------------------------------------------------------------------------------------------------
function m:LoadScene(targetId, isunload)
    if self.sceneManager ~= nil then
        self.sceneManager:ChangeScene(targetId, isunload);
    end
end

---------------------------------------------------------------------------------------------------
--UIManager 操作
function m:ShowUIRoot()
    if self.uiManager ~= nil then
        self.uiManager:ShowUIRoot();
    end
end

function m:ShowUI(uiId)
    if self.uiManager ~= nil then
        self.uiManager:ShowPanel(uiId);
    end
end

function m:HideUIForUIId(uiId)
    if self.uiManager ~= nil then
        self.uiManager:HidePanel(uiId);
    end
end

function m:GetUIForUIId(uiId)
    if self.uiManager ~= nil then
        self.uiManager:GetPanel(uiId);
    end
end

---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------
--玩家登陆成功
-- function m:loginSuccess()
--     self.playerInfo:init(1001);
--     self:InitGameScene()
-- end

--玩家进入渔场
-- function m:enterMatch()
--     --测试代码
--     local info = Class.New(PlayerInfo)
--     info.playerId           = 1001;
--     info.matchId            = 1;
--     info.seatId             = 1;
--     info.uiSeatId           = 0;
--     info.currentWeaponId    = 1;
--     info.isOneSelf          = true;
    
--     info.gold               = 9000000;
--     info.diamond            = 9000000;
--     info.currentWeaponValue = 100;
--     self.roomInfo:playerIntoRoom(info);

--     EvnetManager:EmitEvent(GameEventHandle.PlayerInMatch, self.roomInfo.selfPlayer);
-- end

-- function m:InitGameScene()
--     self.gameScene = nil;
--     ResourceLoad.InstancePrefab(Scene[SceneType.GameScene].PrefabStr, Scene[SceneType.GameScene].LuaStr, function(luaClass)
--         self.gameScene = luaClass;
--     end);
-- end

-- function m:getGameScene()
--     return self.gameScene;
-- end


-- -------------------------------------------------------------
-- --击中鱼
-- function m:hitFish(hitInfo)
--     if self.gameScene ~= nil then
--         self.gameScene:hitFish(hitInfo.hitPos);
--     end

--     if(self.server ~= nil) then
--         self.server:hitFish(hitInfo, function(deathFishId) 
--             if(deathFishId > 0) then
--                 self:fishDeath(deathFishId);
--             end
--         end);
--     end
-- end

-- --鱼死亡
-- function m:fishDeath(deathFishId)
--     if self.gameScene ~= nil then
--         self.gameScene:fishDeath(deathFishId);
--     end
-- end

---------------------------------------------------------------------------------------------------

return m;





