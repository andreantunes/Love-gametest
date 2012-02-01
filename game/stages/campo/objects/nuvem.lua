local object = { }

function object:getImageName()
    return "nuvem"
end

function object:init()
    self.width = 205
    self.height = 107
end

object.ticks = 0

function object:poll(dt)
    object.ticks = object.ticks + dt
    
    local stage = self.thing:getStage()
    
    if object.ticks >= 0.4 then
        object.ticks = 0
        if math.random(0, 100) <= 60 then
            g_stages:createMonster(stage, 2, self.thing:getGX() + math.random(1, self.width - (self.width / 3)), self.thing:getGY() + self.height, "pikachu.lua")
        end
    end
end
    
return object