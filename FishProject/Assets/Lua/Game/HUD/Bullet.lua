LuaBase = require("LuaBase")
Class =  require("Class")

local Bullet = Class.New(LuaBase);

function Bullet:ctor()
    self.canvasGroup = nil;
    self.bulletImg = nil;

    self.playerId = 0;
    self.weaponValue = 0;
end

function Bullet:init()
    self.canvasGroup =self.transform:GetComponent("CanvasGroup")
    self.bulletImg = self.transform:Find("img");
end

function Bullet:SetBulletData(playerId, weaponValue)
    self.playerId = playerId;
    self.weaponValue = weaponValue;
end

function Bullet:Show()
end


function Bullet:Hide()
end

return Bullet;