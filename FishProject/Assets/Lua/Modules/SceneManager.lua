--场景管理
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = class.New(LuaBase);

function m:ctor()
    self.currentId = 0;
    self.targetId = 0;
end

function m:ChangeScene()
    
end


return m;