local object = { }

function object:getImageName()
    return "pau"
end

function object:init()
    self.width = 100
    self.height = 10
end

local activatedActions = {  } 

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