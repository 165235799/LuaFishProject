--大厅场景
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.sceneId = SceneType.LobbyScene;
end

function m:EnterScene()
    print('---------------进入大厅场景');
end

function m:ExitScene()
    print('---------------离开大厅场景');
end

return m;