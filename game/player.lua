local p = { }

p.keys = { }

function p.keyPressed(player, key)
    p.keys[key] = true
    p.onKeyPressed(player, key)
    
    for _, action in ipairs(p.actions) do
        if action.keyPressed ~= nil then
            action.keyPressed(player, key)
        end
    end
end

function p.keyReleased(player,key)
    p.keys[key] = false
    p.onKeyReleased(key)
    
    for _, action in ipairs(p.actions) do
        if action.keyReleased ~= nil then
            action.keyReleased(player, key)
        end
    end
end

function p.onKeyPressed(key)

end

function p.onKeyReleased(key)
    
end

function p.poll(thing, dt)
    for _, action in ipairs(p.actions) do
        if action.poll ~= nil then
            action.poll(thing, dt)
        end
    end
end

return p