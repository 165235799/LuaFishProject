LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.bulletTrans = nil
    self.netTrans = nil
    self.bulletCounter = 0;

    self.bulletList = {}
end

function m:init()
    self.bulletTrans = self.transform:Find("BulletNode");
    self.netTrans = self.transform:Find("NetNode");
end

------------------------------------------------------------------------------------------
--子弹
--玩家发射子弹
function m:playerFireBullet(bulletInfo)
    if(self.bulletList[bulletInfo.playerId] == nil) then
        self.bulletList[bulletInfo.playerId] = {}
    else
    end
    self:CreateBullet(bulletInfo);
end

--创建子弹
function m:CreateBullet(bulletInfo)
    ResourceLoad.InstancePrefab(View[UIType.BulletCell].PrefabStr, 
    View[UIType.BulletCell].LuaStr, 
    self.bulletTrans, 
    function(luaClass) 
        self.bulletCounter = self.bulletCounter + 1;
        luaClass:FireBullet(bulletInfo, self.bulletCounter);
        table.insert(self.bulletList[bulletInfo.playerId], luaClass);
    end)
end

------------------------------------------------------------------------------------------
--渔网
--显示渔网
function m:showNet(showPos)
    self:createNetCell(showPos);
end

--创建渔网
function m:createNetCell(showPos)
    ResourceLoad.InstancePrefab(View[UIType.NetCell].PrefabStr, 
    View[UIType.NetCell].LuaStr, 
    self.netTrans, 
    function(luaClass) 
        luaClass:showNet(showPos);
    end)
end


return m;