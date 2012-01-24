local p = { }

p.keys = { }

function p.keyPressed(player, key)
    p.keys[key] = true
    p.onKeyPressed(player, key)
end

function p.keyReleased(player,key)
    p.keys[key] = false
    p.onKeyReleased(key)
end

function p.onKeyPressed(key)

end

function p.onKeyReleased(key)
    
end

function p.poll(thing, dt)
    if p.keys["right"] ~= nil and p.keys["right"] then
        thing:addGX(4)
    end

    if p.keys["left"] ~= nil and p.keys["left"] then
        thing:addGX(-4)
    end
end

return p