Object = { }
setmetatable(Object, Thing_mt)
Object_mt = { __index = Object } 

function Object.create()
    local newObject = {}
    setmetatable(newObject, Object_mt)
    return newObject
end

function Object.gratity()
    return 
end

function Thing:ignoreGravity()
    return true
end