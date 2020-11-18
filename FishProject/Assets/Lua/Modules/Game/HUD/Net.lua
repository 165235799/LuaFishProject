LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.countdown = 0;
    self.isShow = false;
    self.imgObj = nil;
end

function m:init()
    self.imgObj = self.transform:Find("img");
end

function m:Update(deltaTime)
    if self.isShow then
        self.countdown = self.countdown - deltaTime;
        if self.countdown <= 0 then
            self:hideNet();
        end
    end
end

function m:showNet(wPos)
    self.transform.position = wPos;
    self.isShow = true;
    self.countdown = Constanct.NET_DISPLAY_SECOND;
    LuaTool.SetGameObjectActive(self.imgObj, true);
end

function m:hideNet()
    self.isShow = false;
    LuaTool.SetGameObjectActive(self.imgObj, false);
end

return m;