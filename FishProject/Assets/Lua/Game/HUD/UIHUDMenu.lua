LuaBase = require("LuaBase")
Class =  require("Class")

local UIHUDMenu =  Class.New(LuaBase);

function UIHUDMenu:ctor()
    self.leftMenu = nil
    
    self.closeBtn = nil
    self.SevenDaysBtn = nil
    self.OnlineReardsBtn = nil
    self.SeaGiftBtn = nil
    self.SupplyBtn = nil
    self.TreasureBtn = nil
    self.HarvestGiftBtn = nil
    self.GodTreasureBtn = nil

    self.rightMenu = nil

    self.PhoneBtn = nil
    self.TurretBtn = nil
    self.TorpedoBtn = nil

end

function UIHUDMenu:init()
    self:initLeftMenu();
    self:intRightMenu();
end

function UIHUDMenu:initLeftMenu()
    self.leftMenu = self.transform:Find("LeftMenu");

    self.closeBtn = self.leftMenu:Find("CloseBtn");
    self.SevenDaysBtn = self.leftMenu:Find("SevenDaysBtn");
    self.OnlineReardsBtn = self.leftMenu:Find("OnlineRewardsBtn");
    self.SeaGiftBtn = self.leftMenu:Find("SeaGiftBtn");
    self.SupplyBtn = self.leftMenu:Find("SupplyBtn");
    self.TreasureBtn = self.leftMenu:Find("TreasureBtn");
    self.HarvestGiftBtn = self.leftMenu:Find("HarvestGiftBtn");
    self.GodTreasureBtn = self.leftMenu:Find("GodTreasureBtn");

    Tool.OnClick(self.closeBtn, function() 
        --退出渔场按钮
    end)

    Tool.OnClick(self.SevenDaysBtn, function() 
        --七天乐
    end)

    Tool.OnClick(self.OnlineReardsBtn, function() 
        --在线奖励
    end)

    Tool.OnClick(self.SeaGiftBtn, function() 
        --海底礼包
    end)

    Tool.OnClick(self.SupplyBtn, function() 
        --悬赏补给
    end)

    Tool.OnClick(self.TreasureBtn, function() 
        --海妖宝藏
    end)

    Tool.OnClick(self.HarvestGiftBtn, function() 
        --丰收礼包
    end)

    Tool.OnClick(self.GodTreasureBtn, function() 
        --神兽宝藏
    end)
end


function UIHUDMenu:intRightMenu()
    self.rightMenu = self.transform:Find("RightMenu");

    self.PhoneBtn = self.rightMenu:Find("Phone/BtnImg");
    self.TurretBtn = self.rightMenu:Find("Turret/BtnImg");
    self.TorpedoBtn = self.rightMenu:Find("Torpedo/BtnImg");

    Tool.OnClick(self.PhoneBtn, function() 
        --多话费
    end)

    Tool.OnClick(self.TurretBtn, function() 
        --炮解锁
    end)

    Tool.OnClick(self.TorpedoBtn, function() 
        --鱼雷列表
    end)
end



return UIHUDMenu