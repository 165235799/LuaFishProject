--登录界面
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
end

function m:init()
    self.inputUserName = nil;
    self.inputPasswrod = nil;
    self.loginBtn = nil;
end

function m:OnClickLoginBtn()
end

return m;