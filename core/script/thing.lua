local t = { }

t.actions = 0
t.currentImageName = 0

t.currentQuad = nil
t.quads = 0
t.common = 0
t.thing = 0

t.width = 32
t.height = 32

function t:ignoreBlock(thing)
    return false
end

function t:actionsPoll(dt)
    if self.actions ~= 0 then
        for _, action in ipairs(self.actions) do
            if action.poll ~= nil then
                action:poll(self.thing, dt)
            end
        end
    end
end
    
function t:poll(thing, dt)
    
end

function t:actionsOnMove(oldPos, newPos)
    if self.actions ~= 0 then
        for _, action in ipairs(self.actions) do
            if action.onMove ~= nil then
                action:onMove(self.thing, oldPos, newPos)
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

function t:thingInit(thing)
    self.common = { }
    
    self.thing = thing
    
    self:init(thing)
    
    thing:setWidth(self.width)
    thing:setHeight(self.height)
    
    if self:getQuad() == nil then
        self:setCurrentQuad(love.graphics.newQuad(0, 0, self.width, self.height, self.width, self.height))
    end
end

function t:loadActions(stageName)
    
end

function t:move(gX, gY)
    self.thing:getStage():moveThing(self.thing, gX, gY)
end

return t
