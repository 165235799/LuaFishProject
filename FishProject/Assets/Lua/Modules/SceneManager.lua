--场景管理
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.currentScene = nil;
    self.targetId     = 0;
end

function m:InitSceneEvent()
    LuaSceneTool.RegisterEvent(
        function(unloadId)  self:UnloadScene(unloadId);  end, 
        function(loadId)  self:LoadScene(loadId);  end);
end

function m:ChangeScene(targetId, isUnload)
    LuaSceneTool.ChangeScene(targetId, isUnload);
end

function m:UnloadScene(sceneId)
end

function m:LoadScene(sceneId)
    if self.currentScene ~= nil then
        self.currentScene:ExitScene();
        self.currentScene = nil;
    end

    local targetScene = require(Scene[sceneId].LuaStr);
    self.currentScene = Class.New(targetScene);
    self.currentScene:EnterScene();
end

return m;