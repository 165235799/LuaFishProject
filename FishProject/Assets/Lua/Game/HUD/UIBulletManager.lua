LuaBase = require("LuaBase")
Class =  require("Class")

local UIBulletManager = Class.New(LuaBase);

function UIBulletManager:ctor()
    self.bulletTrans = nil
    self.netTrans = nil
end

function UIBulletManager:init()
    self.bulletTrans = self.transform:Find("BulletNode");
    self.netTrans = self.transform:Find("NetNode");
end

function UIBulletManager:CreateBullet(playerId, )

end


return UIBulletManager;