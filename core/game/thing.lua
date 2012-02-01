Thing = { }
setmetatable(Thing, Rect_mt)
Thing_mt = { __index = Thing } 

Thing.stage = nil
Thing.image = nil
Thing.name = ''
Thing.noImage = false
Thing.script = 0

function Thing:setNoImage(state)
    self.noImage = state
end

function Thing:setStage(stage)
    self.stage = stage
end

function Thing:getImage()
    local imageName = self.script:getImageName()
    
    if imageName == nil then
        return nil
    end
    
    return self.stage:getImage(imageName)
end

function Thing:setImage(image)
    self.image = image
end

function Thing.create()
    local newThing = { }
    setmetatable(newThing, Thing_mt)
    return newThing
end

function Thing:isBlockeable()
    return self.script:blockeable()
end

function Thing:poll(dt)
    self.script:poll(dt)
    self.script:actionsPoll(dt)
end

function Thing:isObject()
    return false
end

function Thing:isMonster()
    return false
end

function Thing:isPlayer()
    return false
end

function Thing:setScript(script)
    self.script = script
    
end

function Thing:onMove(oldPos, newPos)
    self.script:onMove(oldPos, newPos)
    self.script:actionsOnMove(oldPos, newPos)
end

function Thing:getStage()
    return self.stage
end

function Thing:getWidth()
    return self.script.width 
end

function Thing:getHeight() 
    return self.script.height 
end
