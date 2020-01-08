LuaBase = require("LuaBase")
Class =  require("Class")

local Bullet = Class.New(LuaBase);

function Bullet:ctor()
    self.canvasGroup = nil;
    self.bulletImg = nil;
end

function Bullet:init()
    self.canvasGroup =self.transform:GetComponent("CanvasGroup")
    self.bulletImg = self.transform:Find("img");
end



function Bullet:Show()
end


function Bullet:Hide()
end

return Bullet;