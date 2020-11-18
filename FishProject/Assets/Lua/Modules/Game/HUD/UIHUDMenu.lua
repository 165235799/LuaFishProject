local LuaBase = require("LuaBase")
local Class =  require("Class")

local m =  Class.New(LuaBase);

function m:ctor()
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

function m:init()
    self:initLeftMenu();
    self:intRightMenu();
end

----//左边按钮菜单
function m:initLeftMenu()
    self.leftMenu = self.transform:Find("LeftMenu");

    self.closeBtn = self.leftMenu:Find("CloseBtn");
    self.SevenDaysBtn = self.leftMenu:Find("SevenDaysBtn");
    self.OnlineReardsBtn = self.leftMenu:Find("OnlineRewardsBtn");
    self.SeaGiftBtn = self.leftMenu:Find("SeaGiftBtn");
    self.SupplyBtn = self.leftMenu:Find("SupplyBtn");
    self.TreasureBtn = self.leftMenu:Find("TreasureBtn");
    self.HarvestGiftBtn = self.leftMenu:Find("HarvestGiftBtn");
    self.GodTreasureBtn = self.leftMenu:Find("GodTreasureBtn");

    LuaTool.OnClick(self.closeBtn, function() 
        --退出渔场按钮
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>退出渔场按钮");
    end)

    LuaTool.OnClick(self.SevenDaysBtn, function() 
        --七天乐
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>七天乐");
        --测试进入游戏
        GlobalManager:Instance():enterMatch();
    end)

    LuaTool.OnClick(self.OnlineReardsBtn, function() 
        --在线奖励
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>在线奖励");
    end)

    LuaTool.OnClick(self.SeaGiftBtn, function() 
        --海底礼包
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>海底礼包");
    end)

    LuaTool.OnClick(self.SupplyBtn, function() 
        --悬赏补给
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>悬赏补给");
    end)

    LuaTool.OnClick(self.TreasureBtn, function() 
        --海妖宝藏
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>海妖宝藏");
    end)

    LuaTool.OnClick(self.HarvestGiftBtn, function() 
        --丰收礼包
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>丰收礼包");
    end)

    LuaTool.OnClick(self.GodTreasureBtn, function() 
        --神兽宝藏
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>神兽宝藏");
    end)
end

function m:hideLeftMenuBtn()
    LuaTool.SetGameObjectActive(self.SevenDaysBtn, false);
    LuaTool.SetGameObjectActive(self.OnlineReardsBtn, false);
    LuaTool.SetGameObjectActive(self.SeaGiftBtn, false);
    LuaTool.SetGameObjectActive(self.SupplyBtn, false);
    LuaTool.SetGameObjectActive(self.TreasureBtn, false);
    LuaTool.SetGameObjectActive(self.HarvestGiftBtn, false);
    LuaTool.SetGameObjectActive(self.GodTreasureBtn, false);
end

--# matchType @type MatchType 
function m:setLeftMenuBtn(matchType)
    self:hideLeftMenuBtn();
    
    LuaTool.SetGameObjectActive(self.SevenDaysBtn, true);
    LuaTool.SetGameObjectActive(self.OnlineReardsBtn, true);

    if(matchType == MatchType.SeaGiftBagType) then
        LuaTool.SetGameObjectActive(self.SeaGiftBtn, true);
    elseif(matchType == MatchType.RewardType) then
        LuaTool.SetGameObjectActive(self.SupplyBtn, true);
    elseif(matchType == MatchType.TreasureType) then 
        LuaTool.SetGameObjectActive(self.TreasureBtn, true);
    elseif(matchType == MatchType.HarvestGiftBag) then
        LuaTool.SetGameObjectActive(self.HarvestGiftBtn, true);
    elseif(matchType == MatchType.GodTreasureType) then
        LuaTool.SetGameObjectActive(self.GodTreasureBtn, true);
    end
end

----//右边按钮菜单
function m:intRightMenu()
    self.rightMenu = self.transform:Find("RightMenu");
    self.PhoneBtn = self.rightMenu:Find("Phone/BtnImg");
    self.TurretBtn = self.rightMenu:Find("Turret/BtnImg");
    self.TorpedoBtn = self.rightMenu:Find("Torpedo/BtnImg");

    LuaTool.OnClick(self.PhoneBtn, function() 
        --多话费
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>多话费");
    end)

    LuaTool.OnClick(self.TurretBtn, function() 
        --炮解锁
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>炮解锁");
    end)

    LuaTool.OnClick(self.TorpedoBtn, function() 
        --鱼雷列表
        LuaTool.DebugLog(LogType.Warning, ">>>>>>>>>>>>>>>>>>>>>>鱼雷列表");
    end)
end


--# gamePlayerInfo #type GamePlayerInfo
function m:show(gamePlayerInfo)
    self:setLeftMenuBtn(1);
end

function m:hide()
    
end


return m