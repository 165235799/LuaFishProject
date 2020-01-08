LuaBase = require("LuaBase")
Class =  require("Class")


local UIBulletManager = Class.New(LuaBase);

function UIBulletManager:ctor()
    self.bulletTrans = nil
    self.netTrans = nil
end



return UIBulletManager;