LuaBase = require("LuaBase")
Class =  require("Class")

local UITouch = Class.New(LuaBase);

function UITouch:ctor()
    self.touchBtn = nil
end

function UITouch:init()
    self.touchBtn = self.transform:Find("touchBtn");

    Tool.AddListener(self.touchBtn, function() 
        self:OnClick();
    end, 
    function() 
        self:OnClickDownEvent();
    end, 
    function() 
        self:OnClickUpEvent();
    end)
end


function UITouch:OnClick()
    ResourceLoad.LoadAsset("Assets/Prefab/Game/HUD/Common/Bullet.prefab", self.transform, function(instanceObj)
    
    end);
end

function UITouch:OnClickDownEvent()
    Tool.DebugLog(2, ">>>>>>>>>>>>>>>>>>>>OnClickDownEvent");
end

function UITouch:OnClickUpEvent()
    Tool.DebugLog(2, ">>>>>>>>>>>>>>>>>>>>OnClickUpEvent");
end


return UITouch;