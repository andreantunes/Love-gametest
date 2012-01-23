Creature = { }
setmetatable(Creature, Thing_mt)
Creature_mt = { __index = Creature } 

function Creature:gratity()
    self.stage:moveThing(self, self:getGX(), self:getGY() + 10)
end

function Creature:ignoreGravity()
    return false
end