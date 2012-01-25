local player = { }

function player.getImageName()
    return "pikachu"
end

function player.onKeyPressed(key)
    
end

function player.onKeyReleased(key)
    
end

local activatedActions = { "jump.lua", "walk.lua" } 

function player.loadActions(stageName)
    for _, actionPath in ipairs(activatedActions) do
        table.insert(player.actions, dofile('game/stages/' .. stageName .. "/player/" .. actionPath))
    end
end


return player
