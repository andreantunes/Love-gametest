Creature = { }
setmetatable(Creature, Thing_mt)
Creature_mt = { __index = Creature } 

function Creature:isObject()
    return false
end

function Creature:isMonster()
    return false
end

function Creature:isPlayer()
    return false
end
