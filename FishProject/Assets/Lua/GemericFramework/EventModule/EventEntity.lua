local m = {}

function m:New()
    local o = o or {};
    setmetatable(o, self);
    self.__index = self;
    o:init();

    return o;
end

function m:init()
    self.EventId = 0;
    self.EventCallback = {};
end

function m:AddListener(action)
    local isContain = false;

    for k, v in pairs(self.EventCallback) do
        if v == action then
            isContain = true;
        end
    end

    if (isContain ~= true) then
        table.insert(self.EventCallback, action);
    end
end

function m:RemoveListener(action)
    for k, v in pairs(self.EventCallback) do
        if v == action then
            self.EventCallback[k] = nil
        end
    end
end

function m:Emit(eventInfo)
    for k, v in pairs(self.EventCallback) do
        self.EventCallback[k](eventInfo);
    end
end

return m;