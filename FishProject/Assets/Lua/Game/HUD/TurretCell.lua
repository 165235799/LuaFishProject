LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.CanvasGroup = nil;
    self.GoldTxt = nil;
    self.DiamondTxt = nil;
    self.WeaponValueTxt = nil;
    self.AddWeaponValueBtn = nil;
    self.LessenWeaponValueBtn = nil;
    self.GamePlayerData = nil;
end

function m:Awake(obj)
    self.gameObject = obj;
    self.transform = obj.transform;

    self.CanvasGroup = self.transform:GetComponent("CanvasGroup");
    self.TurretNode = self.transform:Find("Turret");
    self.TurretIcon = self.transform:Find("Turret/turretIcon");
    self.GoldTxt = self.transform:Find("Info/currencyBar_0/count"):GetComponent("Text");
    self.DiamondTxt = self.transform:Find("Info/currencyBar_1/count"):GetComponent("Text");
    self.WeaponValueTxt = self.transform:Find("Turret/weaponValue/count"):GetComponent("Text");

    self.AddWeaponValueBtn = self.transform:Find("Buttons/AddButton");
    self.LessenWeaponValueBtn = self.transform:Find("Buttons/LessenButton");

    LuaTool.OnClick(self.AddWeaponValueBtn, function() 
        self:OnClickAddWeaponValue();
    end)

    LuaTool.OnClick(self.LessenWeaponValueBtn, function() 
        self:OnClickLessenWeaponValue();
    end)
end

--显示炮台数据
--gamePlayerData #GamePlayerInfo
function m:Show(gamePlayerData)
    self.GamePlayerData = gamePlayerData;
    if(self.CanvasGroup ~= nil) then
        self.CanvasGroup.alpha = 1.0;
        self.CanvasGroup.interactable = true;
        self.CanvasGroup.blocksRaycasts = true;

        self:SetCurrency(self.GamePlayerData.gold, self.GamePlayerData.diamond);
        self:SetWeapon(self.GamePlayerData.currentWeaponValue);
    else
        LuaTool.DebugLog(LogType.Error, "TurretCell CanvasGroup is null");
    end    
end

--更新炮台数据
--gamePlayerData #GamePlayerInfo
function m:updateTurret(gamePlayerData)
    self.GamePlayerData = gamePlayerData;
    self:SetCurrency(self.GamePlayerData.gold, self.GamePlayerData.diamond);
    self:SetWeapon(self.GamePlayerData.currentWeaponValue);
end

--清除炮台数据
function m:clearTurret()
    self:Hide()
end

function m:Hide()
    if(self.CanvasGroup ~= nil) then
        self.CanvasGroup.alpha = 0.0;
        self.CanvasGroup.interactable = false;
        self.CanvasGroup.blocksRaycasts = false;

        self.GamePlayerData = nil;
        self:SetCurrency(0, 0);
        self:SetWeapon(0);
    end
end

--设置玩家货币
function m:SetCurrency(gold, diamond)
    self.GoldTxt.text = tostring(gold);
    self.DiamondTxt.text = tostring(diamond);
end

--设置武器炮倍
function m:SetWeapon(waponValue)
    self.WeaponValueTxt.text = tostring(waponValue);
end

--点击加炮倍
function m:OnClickAddWeaponValue()
    if(self.GamePlayerData ~= nil) then
        local v = self.GamePlayerData:AddWeaponValue();
        self:SetWeapon(v);
    end
end

--点击减炮倍
function m:OnClickLessenWeaponValue()
    if(self.GamePlayerData ~= nil) then
        self:SetWeapon(self.GamePlayerData:LessenWeaponValue());
    end
end

--炮塔指向点击屏幕位置
function m:rotationTurret(screenPos)
    local pos = LuaTool.ScreenVectorToLocalVector(self.TurretNode, screenPos);

    local fromPos = Vector3.New(self.TurretIcon.localPosition.x, self.TurretIcon.localPosition.y, 0.0);
    local toPos = Vector3.New(pos.x, pos.y, 0.0);
    local dir = toPos - fromPos;

    local angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg;
    angle = angle -90;
    self.TurretIcon.rotation = Quaternion.AngleAxis(angle, Vector3.forward);

    return dir;
end

--发射子弹
function m:FireBullet(screenPos, fireCallback)
    local dir = self:rotationTurret(screenPos);
    local bulletInfo = 
    {
        startPos = self.TurretIcon.position,
        targetDir = Vector3.Normalize(dir),
        playerId = self.GamePlayerData.playerId,
        weaponId = self.GamePlayerData.currentWeaponId,
        weaponValue =self.GamePlayerData.currentWeaponValue
    };

    if(fireCallback ~= nil and self.GamePlayerData ~= nil) then
        fireCallback(bulletInfo);
    end
end

return m;

