local eventEntity = require("GemericFramework/EventModule/EventEntity")

EvnetManager = {}; 
EvnetManager.eventEntityList = {}

function EvnetManager:AddListener(eventId, action)
    if(self.eventEntityList[eventId] == nil) then
        self.eventEntityList[eventId] = eventEntity:New();
        self.eventEntityList[eventId]:AddListener(action);
    else
        self.eventEntityList[eventId]:AddListener(action);
    end
end

function EvnetManager:RemoveListener(eventId, action)
    if(self.eventEntityList[eventId] ~= nil) then
        self.eventEntityList[eventId]:RemoveListener(action);
    end
end

function EvnetManager:EmitEvent(eventId, eventInfo)
    if(self.eventEntityList[eventId] ~= nil) then
        self.eventEntityList[eventId]:Emit(eventInfo);
    end
end