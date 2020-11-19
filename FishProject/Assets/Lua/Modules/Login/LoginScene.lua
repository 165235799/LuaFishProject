--登录场景
local LuaBase = require("LuaBase")
local Class =  require("Class")
local global = require('GlobalManager');

local m = Class.New(LuaBase);

function m:ctor()
    self.sceneId = SceneType.LoginScene;
end

function m:EnterScene()
    global:Instance():ShowUIRoot();
    global:Instance():ShowUI(UIID.UILogin);
end

function m:ExitScene()
    print('---------------离开登录场景');
end

return m;