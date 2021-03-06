Monster = { }
setmetatable(Monster, Creature_mt)
Monster_mt = { __index = Monster }

function Monster.create()
    local newMonster = { }
    setmetatable(newMonster, Monster_mt)
    
    return newMonster
end

function Monster:isMonster()
    return true
end

function Monster:load(stage, script)
    self:setImage(stage.images[script.image])

    self:setWidth(script.w)
    self:setHeight(script.h)
    
    self:setStage(stage)
end
