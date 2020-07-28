local m = {}

function m:ctor()
    self.playerId           = 0;
    self.matchId            = 0;
    self.seatId             = 0;
    self.uiSeatId           = 0;
    self.gold               = 0;
    self.diamond            = 0;
    self.currentWeaponId    = 0;
    self.currentWeaponValue = 0;
    self.isOneSelf          = false;
end

function m:SetInfo(gameInfo)
    self.playerId           = gameInfo.playerId;
    self.matchId            = gameInfo.matchId;
    self.seatId             = gameInfo.seatId;
    self.uiSeatId           = gameInfo.uiSeatId;
    self.currentWeaponId    = gameInfo.currentWeaponId;
    self.currentWeaponValue = gameInfo.currentWeaponValue;
    self.gold               = gameInfo.gold;
    self.diamond            = gameInfo.diamond;
    self.isOneSelf          = gameInfo.isOneSelf;

    self.minWeaponValue     = 100;
    self.maxWeaponValue     = 90000;
    self.weaponIncrement    = 100;
end

function m:ClearInfo()
    self.playerId           = 0; 
    self.matchId            = 0;
    self.seatId             = 0;
    self.uiSeatId           = 0;
    self.currentWeaponId    = 0;
    self.currentWeaponValue = 0;
    self.gold               = 0;
    self.diamond            = 0;
    self.isOneSelf          = false;
end

--是否能开火
function m:IsCanFire()
    return true;
end

--是否开启锁定
function m:IsOpenLock()
end

function m:AddWeaponValue()
    self.currentWeaponValue = self.currentWeaponValue + self.weaponIncrement;
    if(self.currentWeaponValue > self.maxWeaponValue) then
        self.currentWeaponValue = self.minWeaponValue;
    end
    
    return self.currentWeaponValue;
end

function m:LessenWeaponValue()
    self.currentWeaponValue = self.currentWeaponValue - self.weaponIncrement;
    if(self.currentWeaponValue < self.minWeaponValue) then
        self.currentWeaponValue = self.maxWeaponValue;
    end
    
    return self.currentWeaponValue;
end

return m; 