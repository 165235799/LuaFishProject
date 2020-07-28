--鱼实体类
local LuaBase = require("LuaBase")
local Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.fishInfo = nil;
    self.modelObj = nil;
    self.animator = nil;
    self.splineMove = nil;
    self.isdeath = true;
end

function m:getFishInstanceId()
    return self.fishInfo.instanceId
end

function m:isDeath()
    return self.isdeath;
end

function m:createFish(fishInfo, modelStr, pathManager)
    self.fishInfo = fishInfo;
    self.splineMove = self.transform:GetComponent("splineMove");
    self:createModel(modelStr);
    if self.splineMove ~= nil then
        self.splineMove.pathContainer = pathManager;
        self.transform.localPosition = Vector3.New(0, 0, 135);
        self.splineMove.lockPosition = DG.Tweening.AxisConstraint.Z;
        self.splineMove.speed = self.fishInfo.fishSpeed;
        self.splineMove:StartMove();
        self:setMovePoint();
    end
    self.isdeath = false;
end

function m:setMovePoint()
    local size = self.splineMove.events.Count;
    for i = 0, (size - 1), 1 do
        self.splineMove.events[i]:AddListener(function() 
            self:updatePoint();
        end)
    end
end

function m:updatePoint()
    local size = self.splineMove.events.Count;
    if(self.splineMove.currentPoint == (size - 1)) then
        self:hideFihs();
    end

end

function m:hitFish()
end

function m:fishDeath()
    self.isdeath = true;
    if( self.animator ~= nil) then
        self.animator:SetTrigger("DeathTrigger");
        self.splineMove:Stop();
        self:hideFihs();
    end
end

function m:createModel(modelStr)
    ResourceLoad.LoadAsset(modelStr, self.transform, function(modelObj)
        self.modelObj = modelObj;
        self.modelObj.transform.localPosition = Vector3.zero;
        self.animator = modelObj:GetComponent("Animator");
        self.animator:Play("Idle");
    end);
end

function m:hideFihs()
    --LuaTool.FishDeath(self.gameObject);
    LuaTool.SetGameObjectActive(self.transform, false);
    UnityEngine.GameObject.DestroyImmediate(self.gameObject);
end


return m;