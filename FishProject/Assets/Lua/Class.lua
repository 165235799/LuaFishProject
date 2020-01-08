local Class = {}

function Class.New(base)
    local o = {};
    for key, var in pairs(base) do
        o[key] = var
    eno.__cnamne = ""
    o:ctor();
    return o;
end


return Class; 