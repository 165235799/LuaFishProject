LuaBase = require("LuaBase")
Class =  require("Class")

local TurretCell = Class.New(LuaBase);

function TurretCell:ctor()
    self.CanvasGroup = nil;
    self.GoldTxt = nil;
    self.DiamondTxt = nil;
    self.WeaponValueTxt = nil;
    self.AddWeaponValueBtn = nil;
    self.LessenWeaponValueBtn = nil;
    self.GamePlayerData = nil;
end

function TurretCell:Awake(obj)
    self.gameObject = obj;
    self.transform = obj.transform;

    self.CanvasGroup = self.transform:GetComponent("CanvasGroup");
    
    self.GoldTxt = self.transform:Find("Info/currencyBar_0/count"):GetComponent("Text");
    self.DiamondTxt = self.transform:Find("Info/currencyBar_1/count"):GetComponent("Text");
    self.WeaponValueTxt = self.transform:Find("Turret/weaponValue/count"):GetComponent("Text");

    self.AddWeaponValueBtn = self.transform:Find("Buttons/AddButton");
    self.LessenWeaponValueBtn = self.transform:Find("Buttons/LessenButton");

    Tool.OnClick(self.AddWeaponValueBtn, function() 
        self:OnClickAddWeaponValue();
    end)

    Tool.OnClick(self.LessenWeaponValueBtn, function() 
        self:OnClickLessenWeaponValue();
    end)
end

function TurretCell:Show(gamePlayerData)
    self.GamePlayerData = gamePlayerData;
    if(self.CanvasGroup ~= nil) then
        self.CanvasGroup.alpha = 1.0;
        self.CanvasGroup.interactable = true;
        self.CanvasGroup.blocksRaycasts = true;

        self:SetCurrency(self.GamePlayerData.Gold, self.GamePlayerData.Diamond);
        self:SetWeapon(self.GamePlayerData.WeaponValue);
    else
        Tool.DebugLog(LogType.Error, "TurretCell CanvasGroup is null");
    end    
end

function TurretCell:Hide()
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
function TurretCell:SetCurrency(gold, diamond)
    self.GoldTxt.text = tostring(gold);
    self.DiamondTxt.text = tostring(diamond);
end

function TurretCell:SetWeapon(waponValue)
    self.WeaponValueTxt.text = tostring(waponValue);
end


function TurretCell:OnClickAddWeaponValue()
    print(">>>>>>>>>>>>>>>>>> OnClickAddWeaponValue");
end

function TurretCell:OnClickLessenWeaponValue()
    print(">>>>>>>>>>>>>>>>>> OnClickLessenWeaponValue");
end


return TurretCell;

