local LuaBase = {}

function LuaBase:ctor()
    self.gameObject = null;
    self.transform = null;
end

function LuaBase:Awake(gameObject)
    if(obj == nil) then
        print("obj is nil");
        return 
    end

    self.gameObject = obj;
    self.transform = obj.transform;
    self:init()
end

function LuaBase:OnEnable()
end

function LuaBase:Start()
end

function LuaBase:Update()
end

function LuaBase:OnDisable()
end

function LuaBase:OnDestroy()
end

function LuaBase:init()
end

return LuaBase;