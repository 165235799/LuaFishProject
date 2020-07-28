--子弹类
LuaBase = require("LuaBase")
Class =  require("Class")

local m = Class.New(LuaBase);

function m:ctor()
    self.canvasGroup = nil;
    self.bulletImg = nil;

    self.bulletId = 0;
    self.playerId = 0;
    self.weaponId = 0
    self.weaponValue = 0;
    self.isUseing = false;
    self.moveSpeed = 25;

    self.hudCamera = nil;
    self.gameCamera = nil;
end

function m:init()
    self.canvasGroup =self.transform:GetComponent("CanvasGroup")
    self.bulletImg = self.transform:Find("img");
    self.hudCamera = GlobalManager:Instance():getGameScene():getHUDCamera();
    self.gameCamera = GlobalManager:Instance():getGameScene():getGameCamera();
    
end

--是否使用中
function m:IsCanUse()
    return self.isUseing;
end

function m:Update()
    if(self.isUseing) then
        self:moveBullet();
        self:rayHitFish();
    end
end

--移动子弹
function m:moveBullet()
    self.transform.localPosition = self.transform.localPosition + (self.targetDir * self.moveSpeed);
    local dir = LuaTool.GetBulletMoveDir(self.transform.localPosition);
    self.targetDir = Vector3.New(self.targetDir.x * dir.x, self.targetDir.y * dir.y, 0)
    self.bulletImg.up = self.targetDir;
end

--检测是否击中鱼
function m:rayHitFish()
    local scenePos = LuaTool.WorldToScenePos(self.gameCamera, self.transform.position);
    local ray = self.gameCamera:ScreenPointToRay(scenePos);
    local flag, hit = UnityEngine.Physics.Raycast(ray, nil);
    if hit ~= nil then
        local fish = LuaTool.GetFishLuaTable(hit.collider.gameObject.transform);
        if fish:isDeath() then
            return;
        end

        local hitInfo = 
        {
            playerId = self.playerId,
            weaponValue = self.weaponValue,
            hitPos = self.transform.position,
            hitFishId = fish:getFishInstanceId(),
        }
        
        self:Hide();
        GlobalManager:Instance():hitFish(hitInfo);
    end
end

--是否显示子弹
function m:setCanvas(isShow)
    if(isShow) then
        self.canvasGroup.alpha = 1.0
    else
        self.canvasGroup.alpha = 0.0
    end
end

--发射子弹
function m:FireBullet(bulletInfo, bulletId)
    self.worldStartPos = bulletInfo.startPos;
    self.targetDir =  bulletInfo.targetDir;
    self.bulletId = bulletId;
    self.playerId = bulletInfo.playerId;
    self.weaponId = bulletInfo.currentWeaponId;
    self.weaponValue = bulletInfo.currentWeaponValue;
    self.isUseing = true;
    self.transform.position = self.worldStartPos;
    self:setCanvas(true);
end

--隐藏子弹
function m:Hide()
    self.bulletId = 0;
    self.playerId = 0;
    self.weaponId = 0;
    self.weaponValue = 0;
    self.isUseing = false;
    self:setCanvas(false);
end

return m;