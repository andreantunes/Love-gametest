Thing = { }
setmetatable(Thing, Rect_mt)
Thing_mt = { __index = Thing } 

Thing.stage = nil
Thing.image = nil
Thing.name = ''
Thing.blockeable = false
Thing.noImage = false
   
function Thing:ignoreGravity()
    return true
end

function Thing:setNoImage(state)
    self.noImage = state
end

function Thing:setStage(stage)
    self.stage = stage
end

function Thing:getImage()
    if self.noImage then
        return nil
    end
    
    return self.image
end

function Thing:setImage(image)
    self.image = image
end

function Thing.create()
    local newThing = { }
    setmetatable(newThing, Thing_mt)
    return newThing
end

function Thing:gratity()
    
end

function Thing:isBlockeable()
    return self.blockeable
end

function Thing:setBlockeable(state)
    self.blockeable = state
end
