local Class =  require("Class")

local PlayerInfo = {}

function PlayerInfo:ctor()
    self.InstanceId   = 0;
    self.Level        = 0;
    self.vipLevel     = 0;
    self.nickName     = 0;
    self.Gold         = 0;
    self.Diamond      = 0;
    self.SceneType    = 0;
    self.weaponArray  = {}
end

function PlayerInfo:init(instanceId)
    self.InstanceId   = instanceId;
    self.Level        = 1;
    self.vipLevel     = 1;
    self.nickName     = "Gk";
    self.Gold         = 1000;
    self.Diamond      = 1000;

    self.weaponArray  = {}
end


return PlayerInfo;