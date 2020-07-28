local LuaBase = require("LuaBase")
local Class =  require("Class")

local UITouch = require("Game/HUD/UITouch")
local UITurret = require("Game/HUD/UITurret")
local UIHUDMenu = require("Game/HUD/UIHUDMenu")
local UIBulletManager = require("Game/HUD/UIBulletManager")

local m = Class.New(LuaBase);

function m:ctor()
    self.uiCamera = nil;
    self.lowNode = nil;
    self.normalNode = nil;
    self.hightNode = nil;

    self.touchPanel = nil;
    self.turretMgr = nil;
    self.bulletMgr = nil;
    self.hudMenu = nil;
end

--注册消息消息
function m:registeredListener()
    EvnetManager:AddListener(GameEventHandle.PlayerFireBullet, function(bulletInfo) 
        self:playerFireBullet(bulletInfo);
    end);
end

--注销消息监听
function m:removeListener()
end


function m:init()
    self:initUIParent();
    self:initTouchPanel();
    self:initHUDMenu();
    self:initTurretPanel();
    self:initBulletPanel();
    self:initCamera();
end

function m:Start()
    if(self.hudMenu ~= nil) then
        self.hudMenu:show();
    end
    self:registeredListener();
end

function m:Update()
end
--------------------------------------------------------------------------------------------------------
--初始化页面节点
function m:initUIParent()
    self.lowNode =  self.transform:Find("UI/Low");
    self.normalNode =  self.transform:Find("UI/Normal");
    self.hightNode =  self.transform:Find("UI/High");
end


function m:getUIParent(level)
    if(level == UILevel.Low) then
        return self.lowNode;
    elseif (level == UILevel.Normal) then
        return self.normalNode;
    elseif (level == UILevel.Hight) then
        return self.hightNode;
    end
end
--------------------------------------------------------------------------------------------------------
--初始化摄像机
function m:initCamera()
    self.uiCamera = self.transform:Find("UICamera"):GetComponent("Camera");
end

function m:getCamera()
    return self.uiCamera;
end

--------------------------------------------------------------------------------------------------------
--创建点击管理
function m:initTouchPanel()
    local node = self:getUIParent(View[UIType.UITouch].Level);

    ResourceLoad.LoadAsset(View[UIType.UITouch].PrefabStr, node, function(instanceObj)
        self.touchPanel = Class.New(UITouch)
        self.touchPanel:Awake(instanceObj);
    end);
end

--------------------------------------------------------------------------------------------------------
---创建渔场菜单界面
function m:initHUDMenu()
    local node = self:getUIParent(View[UIType.UIHUDMenu].Level);
    ResourceLoad.LoadAsset(View[UIType.UIHUDMenu].PrefabStr, node, function(instanceObj)
        self.hudMenu = Class.New(UIHUDMenu)
        self.hudMenu:Awake(instanceObj);
    end);
end

--------------------------------------------------------------------------------------------------------
---创建炮台界面
function m:initTurretPanel()
    local node = self:getUIParent(View[UIType.UITurret].Level);
    ResourceLoad.LoadAsset(View[UIType.UITurret].PrefabStr, node, function(instanceObj)
        self.turretMgr = Class.New(UITurret)
        self.turretMgr:Awake(instanceObj);
    end);
end

--------------------------------------------------------------------------------------------------------
---创建子弹/渔网管理页面
--创建页面
function m:initBulletPanel()
    local node = self:getUIParent(View[UIType.UIBulletManager].Level);
    ResourceLoad.LoadAsset(View[UIType.UIBulletManager].PrefabStr, node, function(instanceObj)
        self.bulletMgr =  Class.New(UIBulletManager)
        self.bulletMgr:Awake(instanceObj);
    end);
end

--玩家发射子弹
function m:playerFireBullet(bulletInfo)
    if(self.bulletMgr ~= nil) then
        self.bulletMgr:playerFireBullet(bulletInfo)
    end
end

--其他玩家发射子弹
function m:otherPlayerFireBullet()
end

function m:showNet(showPos)
    if(self.bulletMgr ~= nil) then
        self.bulletMgr:showNet(showPos);
    end
end

return m;