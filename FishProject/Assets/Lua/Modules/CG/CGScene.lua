--CG场景（版本检测， 播放片头动画)
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.sceneId = SceneType.CGScene;
end

function m:EnterScene()
    print('---------------进入CG场景');
end

function m:ExitScene()
    print('---------------离开CG场景');
end

return m;