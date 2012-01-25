local monster = { }

monster.image = "pikachu"
monster.w = 52
monster.h = 52

monster.currentImageX2 = 52
monster.currentImageY2 = 52

monster.lol = 0

function monster.poll(thing, dt)
    if monster.lol == 0 then
        monster.lol = math.random(1,3)
    end
    
    thing:getStage():moveThing(thing, 2, 0)
end

function monster.getImageName()
    return "pikachu"
end

function monster:init(thing)
    self:setCurrentQuad(love.graphics.newQuad(0, 0, 52, 52, 52, 52))
end

return monster
