local Class = {}

function Class.New(base)
    local o = {};
    for key, var in pairs(base) do
        o[key] = var
    end
    o:ctor();
    return o;
end

return Class; 