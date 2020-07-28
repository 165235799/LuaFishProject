local Class =  require("Class");
local GamePlayerInfo = require(DataInstancePath.."GamePlayerInfo");

local m = {};

--游戏房间数据
function m:ctor()
    self.selfPlayer = Class.New(GamePlayerInfo);
    self.otherPlayer = {};
end

--玩家自己进入房间
function m:playerIntoRoom(gameplayerInfo)
    self.selfPlayer:SetInfo(gameplayerInfo);
end

--其他玩家进入房间
function m:otherPlayerIntoRoom(gameplayerInfo)
    if self.otherPlayer[gameplayerInfo.playerId] ~= nil then
        self.otherPlayer[gameplayerInfo.playerId]:SetInfo(gameplayerInfo);
    else
        self.otherPlayer[gameplayerInfo.playerId] = gameplayerInfo;
    end
end

--离开房间，清空数据
function m:exitRoom()
    self.selfPlayer:ClearInfo();
    self.otherPlayer = {}
end


return m;