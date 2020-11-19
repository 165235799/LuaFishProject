--界面根节点
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.mainView = {};
    self.view = {};
    self.popup = {};
end

function m:init()
    self.mainView = {
        obj = LuaTool.GetGameObject(self.gameObject, "MainView"),
        trans = LuaTool.GetTransform(self.gameObject, "MainView"),
        groupComp = LuaTool.GetComponent(self.gameObject, "MainView", "CanvasGroup"),
    };

    self.view = {
        obj = LuaTool.GetGameObject(self.gameObject, "View"),
        trans = LuaTool.GetTransform(self.gameObject, "View"),
        groupComp = LuaTool.GetComponent(self.gameObject, "View", "CanvasGroup"),
    };

    self.popup = {
        obj = LuaTool.GetGameObject(self.gameObject, "Popup"),
        trans = LuaTool.GetTransform(self.gameObject, "Popup"),
        groupComp = LuaTool.GetComponent(self.gameObject, "Popup", "CanvasGroup"),
    };
end

------------------------------------------------------------------------------------------------------
function m:GetMainViewTrans()
    return self.mainView.trans;
end

function m:GetMainViewGameObject()
    return self.mainView.obj;
end 

function m:GetViewTrans()
    return self.view.trans;
end

function m:GetViewGameObject()
    return self.view.obj;
end 

function m:GetPopupViewTrans()
    return self.popup.trans;
end

function m:GetPopupViewGameObject()
    return self.popup.obj;
end 

function m:GetGameObjectForType(uiType)
    if uiType == UIType.MainView then
        return self.mainView.obj;
    elseif uiType == UIType.View then
        return self.view.obj;
    elseif uiType == UIType.Popup then
        return self.popup.obj;
    else
        print('!!!!!!!!!!!!!! not find uiType = ' .. tostring(uiType));
        return nil;
    end
end

function m:GetTranformForType(uiType)
    if uiType == UIType.MainView then
        return self.mainView.trans;
    elseif uiType == UIType.View then
        return self.view.trans;
    elseif uiType == UIType.Popup then
        return self.popup.trans;
    else
        print('!!!!!!!!!!!!!! not find uiType = ' .. tostring(uiType));
        return nil;
    end
end

------------------------------------------------------------------------------------------------------


return m;