require("GemericFramework/ConstantManager")
local global = require('GlobalManager');

LuaMain = {}

function LuaMain.main()
    GlobalManager = global:New();

    --启动游戏
    GlobalManager:Instance():LoadScene(SceneType.LoginScene, false);
end


return LuaMain;