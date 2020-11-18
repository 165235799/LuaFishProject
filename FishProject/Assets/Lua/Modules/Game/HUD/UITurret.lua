local LuaBase = require("LuaBase")
local Class =  require("Class")
local TurretCell =  require("Game/HUD/TurretCell")

local m = Class.New(LuaBase);

function m:ctor()
    self.seatTransList = {}
    self.turretCellList = {}
end

function m:init()
   self:registeredListener()
    self:initSeatTrans();
end

function m:registeredListener()
    EvnetManager:AddListener(GameEventHandle.PlayerInMatch, function(gamePlayerInfo) 
        self:playerIn(gamePlayerInfo);
    end);

    EvnetManager:AddListener(GameEventHandle.ClickTouchFire, function(clickScreenPos) 
         self:oneselfFireBullet(clickScreenPos);
     end);
end

function m:removeListener()
    
end

---初始化位置节点
function m:initSeatTrans()
    for i = 0, Constanct.MAX_TURRET_COUNT, 1 do
        local trans = self.transform:Find(string.format("Seat_%d", i));
        self.seatTransList[i] = trans;
    end 
end

--玩家开火
function m:oneselfFireBullet(clickScreenPos)
    for i, turret in pairs(self.turretCellList) do
        if(turret.GamePlayerData ~= nil and turret.GamePlayerData.isOneSelf) then
            turret:FireBullet(clickScreenPos, function(bulletInfo) 
                EvnetManager:EmitEvent(GameEventHandle.PlayerFireBullet, bulletInfo);
            end);
        end
    end
end

--其他玩家开火
function m:otherFireBullet()
end

-------------------------------------------------------------------------------------------
--玩家进入渔场消息
--gamePlayerInfo #GamePlayerInfo
function m:playerIn(gamePlayerInfo)
    if(self.turretCellList[gamePlayerInfo.uiSeatId] ~= nil) then
        self:UpdateTurretInfo(gamePlayerInfo);
    else
        self:AddNewTurretInfo(gamePlayerInfo);
    end
end

--玩家退出渔场
function m:playerOut()
    if(self.turretCellList[gamePlayerInfo.uiSeatId] ~= nil) then
        self:RemoveTurretInfo(gamePlayerInfo);
    end
end

-------------------------------------------------------------------------------------------
--添加炮台信息
--gamePlayerInfo #GamePlayerInfo
function m:AddNewTurretInfo(gamePlayerInfo)
    local trans = self.seatTransList[gamePlayerInfo.uiSeatId];
    if(trans == nil) then
        LuaTool.DebugLog(LogType.Error, ">>>>>>Not Find Seat Not  = " .. tostring(gamePlayerInfo.uiSeatId));
    end

    ResourceLoad.LoadAsset(View[UIType.TurretCell].PrefabStr, trans, function(instanceObj)
        local cellClass = Class.New(TurretCell);
        instanceObj.transform.localPosition = Vector3.New(0.0, 0.0, 0.0);
        cellClass:Awake(instanceObj);
        cellClass:Show(gamePlayerInfo);
        self.turretCellList[gamePlayerInfo.uiSeatId] = cellClass;
    end);
end

--更新炮台信息
--gamePlayerInfo #GamePlayerInfo
function m:UpdateTurretInfo(gamePlayerInfo) 
    if(self.turretCellList[gamePlayerInfo.uiSeatId] ~= nil) then
        self.turretCellList[gamePlayerInfo.uiSeatId]:updateTurret(gamePlayerInfo)
    end
end

--删除炮台
--gamePlayerInfo #GamePlayerInfo
function m:RemoveTurretInfo(gamePlayerInfo)
    if(self.turretCellList[gamePlayerInfo.uiSeatId] ~= nil) then
        self.turretCellList[gamePlayerInfo.uiSeatId]:clearTurret()
    end
end

return m;