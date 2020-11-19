--界面管理页面
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.uiroot = nil;
    self.uiList = {};
    self.waitOpenUIList = {};
end

function m:init()
end

function m:ShowUIRoot()
    if self.uiroot == nil then
        ResourceLoad.InstancePrefab(UIRoot.PrefabStr, UIRoot.LuaStr, function(lua)
            self.uiroot = lua;
            if table.getn( self.waitOpenUIList) > 0 then
                for i = 1, table.getn(self.waitOpenUIList) do
                    self:ShowPanel(self.waitOpenUIList[i]);
                end
            end
        end);
    end
end

function m:ShowPanel(uiId)
    if self.uiList[uiId] ~= nil then
    else
        if self.uiroot == nil then
            table.insert(self.waitOpenUIList, uiId);
            print('!!!!!!!!!!!!!!!!!!!!!!!UI Root is Null');
            return;
        end

        local data = View[uiId];
        local parentTrans = self.uiroot:GetTranformForType(data.Type);
        ResourceLoad.InstancePrefab(data.PrefabStr, data.LuaStr, parentTrans, function(lua)
            self.uiList[uiId] = lua;
        end);
    end
end

function m:HidePanel(uiId)
end

function m:GetPanel(uiId)
end


return m;