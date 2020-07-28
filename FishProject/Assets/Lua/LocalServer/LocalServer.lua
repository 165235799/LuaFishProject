--本地服务器
--主要功能模拟服务器，以便后续替换线上

LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
end

function m:init()
end


function m:hitFish(hitInfo, callback)
 local resutlNum = math.random(0, 10);
 if(resutlNum > 5) then
    if(callback ~= nil) then
        callback(hitInfo.hitFishId);
    end
 end
end

return m;
