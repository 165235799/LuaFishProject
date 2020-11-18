local m = {}

function m:ctor()
    self.gameObject = nil;
    self.transform = nil;
end

function m:Awake(obj)
    if(obj == nil) then
        print("obj is nil");
        return 
    end

    self.gameObject = obj;
    self.transform = obj.transform;
    self:init()
end

function m:init()
end

function m:OnEnable()
end

function m:Start()
end

function m:Update(deltaTime)
end

function m:OnDisable()
end

function m:OnDestroy()
    self.gameObject = nil;
    self.transform = nil;
end

return m;