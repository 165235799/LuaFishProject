LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.touchBtn = nil
end

function m:init()
    self.touchBtn = self.transform:Find("touchBtn");

    LuaTool.AddListener(self.touchBtn,
        function() self:OnClick();          end, 
        function() self:OnClickDownEvent(); end,
        function() self:OnClickUpEvent();   end
    )
end

function m:OnClick()
    --LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>OnClickEvent" .. tostring(UnityEngine.Input.mousePosition));
    EvnetManager:EmitEvent(GameEventHandle.ClickTouchFire, UnityEngine.Input.mousePosition);
end

function m:OnClickDownEvent()
    --LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>OnClickDownEvent");
end

function m:OnClickUpEvent()
    --LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>OnClickUpEvent");
end

return m;