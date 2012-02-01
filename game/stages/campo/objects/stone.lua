local object = { }

object.maxX = 150
object.curX = 0
object.going = true

function object:poll(dt)
    if object.going then
        self:move(0, 5)
        
        object.curX = object.curX + 5
        
        if object.curX == object.maxX then
            object.going = false
        end
    else
        self:move(0, -5)
        
        object.curX = object.curX - 5
        
        if object.curX == 0 then
            object.going = true
        end
    end
end

function object:getImageName()
    return "stone"
end

function object:init()
    self.width = 124
    self.height = 63
end

local activatedActions = { "push.lua" } 

function object:loadActions(stageName)
    self.actions = { }
    
    for _, actionPath in ipairs(activatedActions) do
        table.insert(self.actions, dofile('game/stages/' .. stageName .. "/objects/actions/" .. actionPath))
    end
end

function object:blockeable()
    return true
end

return object