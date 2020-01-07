local GamePlayerData = {}

function GamePlayerData:ctor()
    self.InstanceId   = instanceId;
    self.Level        = 1;
    self.SeatId       = seatId;
    self.UISeatId     = uiseatId;
    self.WeaponId     = 1;
    self.WeaponLevel  = 1;
    self.WeaponValue  = 100;
    self.Gold         = 1000;
    self.Diamond      = 1000;
    self.SceneType    = 0;
end

function GamePlayerData:Init(instanceId, seatId, uiseatId)
    self.InstanceId   = instanceId;
    self.Level        = 1;
    self.SeatId       = seatId;
    self.UISeatId     = uiseatId;
    self.WeaponId     = 1;
    self.WeaponLevel  = 1;
    self.WeaponValue  = 10;
    self.Gold         = 1000;
    self.Diamond      = 1000;
end

function GamePlayerData:UpdateWeaponValue(weaponValue)
    self.WeaponValue  = weaponValue;
end


function GamePlayerData:MinWeaponValue()
    return 1;
end

function GamePlayerData:MaxWeaponValue()
    return 1000;
end


return GamePlayerData;