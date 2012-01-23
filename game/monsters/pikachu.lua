local monster = { }

monster.image = "pikachu"
monster.w = 52
monster.h = 52

function monster.poll(thing, dt)
    thing:addGX(1)
end

return monster