local m = {}

function m:ctor()
    self:clearInfo();
end

function m:setFishInfo(instanceId, fishId, speed, fishType)
    self.instanceId = instanceId;
    self.fishId  = fishId;
    self.fishSpeed = speed;
    self.fishType = fishType
    self.fishRate = rate;
    self.itemId = 0;    
    self.createTime = 0; 
end

function m:clearInfo()
    self.instanceId = 0; --实例ID
    self.fishId  = 0;    --表格ID         
    self.fishSpeed = 0;  --游泳速度
    self.fishType = 0;   --鱼的类型(小鱼大鱼)
    self.fishRate = 0;   --鱼的倍率
    self.itemId = 0;     --携带物品ID
    self.createTime = 0; --鱼生成时间
end

return m; 