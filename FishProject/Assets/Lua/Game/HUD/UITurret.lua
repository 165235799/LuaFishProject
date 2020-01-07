LuaBase = require("LuaBase")
Class =  require("Class")
TurretCell =  require("Game/HUD/TurretCell")
GamePlayerData =  require("Data/LuaInstance/GamePlayerData")

local UITurret = Class.New(LuaBase);

function UITurret:ctor()
    self.seatTransList = {}
    self.turretCellList = {}
    self.turretCellPrefab = nil;
end

function UITurret:init()
    -- if(obj == nil) then
    --     print("obj is nil");
    --     return 
    -- end

    -- self.gameObject = obj;
    -- self.transform = obj.transform;
    self.turretCellPrefab = self.transform:Find("TurretCell");

    local noteName = "Seat_";
    for i = 0, 4, 1 do
        local trans = self.transform:Find(string.format("%s%d", noteName, i));
        self.seatTransList[i] = trans;
    end

    local gamePlayerInfo = Class.New(GamePlayerData);
    gamePlayerInfo:Init(1, 1,0);
    self:playerIn(gamePlayerInfo);
   
end

function UITurret:playerIn(gamePlayerInfo)
    if(self.turretCellList[gamePlayerInfo.SeatId] ~= nil) then
        self.turretCellList[gamePlayerInfo.SeatId]:Show(gamePlayerInfo);
    else
        Tool.InstanceObj(self.turretCellPrefab.gameObject, self.seatTransList[gamePlayerInfo.UISeatId], function(obj) 
            local cellClass = Class.New(TurretCell);
            cellClass:Awake(obj);
            cellClass:Show(gamePlayerInfo);
            self.turretCellList[gamePlayerInfo.SeatId] = cellClass;
        end)
    end
end

function UITurret:playerOut()
end


return UITurret;