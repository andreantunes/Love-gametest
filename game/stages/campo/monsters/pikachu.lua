local monster = { }

monster.image = "pikachu"
monster.w = 52
monster.h = 52

monster.lol = 0

function monster.poll(thing, dt)
    if monster.lol == 0 then
        monster.lol = math.random(1,3)
    end
    
    thing:addGX(monster.lol)
end

function monster.getImageName()
    return "pikachu"
end

return monster
