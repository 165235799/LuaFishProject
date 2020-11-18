require("GemericFramework/ConstantManager")
local global = require('GlobalManager');

LuaMain = {}

function LuaMain.main()
    GlobalManager = global:New();
    --GlobalManager:Instance():loginSuccess();
end


return LuaMain;