local player = { }

function player:getImageName()
    return "tashigi"
end

function player:onKeyPressed(key)
    
end

function player:onKeyReleased(key)
    
end

local activatedActions = { "jump.lua", "walk.lua" } 

function player:loadActions(stageName)
    self.actions = { }
    
    for _, actionPath in ipairs(activatedActions) do
        table.insert(self.actions, dofile('game/stages/' .. stageName .. "/player/" .. actionPath))
    end
end

function player:init(thing, stageName)
    self:setCurrentQuad(love.graphics.newQuad(0, 0, 32, 32, 96, 128))
end

return player
