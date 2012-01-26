local t = { }

t.actions = 0
t.currentImageName = 0

t.currentQuad = nil
t.quads = 0
t.common = 0

function t:ignoreBlock(thing)
    return false
end

function t:actionsPoll(thing, dt)
    if self.actions ~= 0 then
        for _, action in ipairs(self.actions) do
            if action.poll ~= nil then
                action:poll(thing, dt)
            end
        end
    end
end
    
function t:poll(thing, dt)
    
end

function t:actionsOnMove(thing, oldPos, newPos)
    if self.actions ~= 0 then
        for _, action in ipairs(self.actions) do
            if action.onMove ~= nil then
                action:onMove(thing, oldPos, newPos)
            end
        end
    end
end

function t:onMove(thing, oldPos, newPos)
    
end

function t:getImageName()
    if self.currentImageName == 0 then
        return nil
    end
    
    return self.currentImageName
end

function t:getQuad()
    return self.currentQuad
end

function t:setCurrentQuad(quad)
    self.currentQuad = quad
end

function t.init(thing)
    
end

function t:thingInit()
    self.common = { }
end

function t:loadActions(stageName)
    
end

return t
