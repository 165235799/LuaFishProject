---鱼路径管理
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.pathDict = {}
end

function m:init()
    for i = 0, (self.transform.childCount - 1), 1 do
        local pathTrans = self.transform:GetChild(i);
        local path = pathTrans:GetComponent("PathManager");
        self.pathDict[pathTrans.name] = path;
        path.gameObject:SetActive(false);
    end
end

function m:getPathManager(pathName)
    if self.pathDict[pathName] ~= nil then
        return self.pathDict[pathName];
    else
        return nil;
    end
end

return m;