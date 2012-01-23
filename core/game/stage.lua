Stage = {}
Stage_mt = { __index = Stage }

Stage.player = { }
Stage.things = { }
Stage.images = { }
Stage.gravityTicks = 0

Stage.initialPos = { gX = 100, gY = 100 }

function Stage.create()
    local newStage = { }
    setmetatable(newStage, Stage_mt)
    newStage:reset()
    
    return newStage
end

function Stage:stop()
    self.reset()
end

function Stage:reset()
    g_camera:setStage(nil)
end

function Stage:start()
    g_camera:setStage(self)
    g_camera:setGX(self.initialPos.gX)
    g_camera:setGY(self.initialPos.gY)
end

function Stage:setImage(name, img)
    self.images[name] = img
end

function Stage:getThings()
    return self.things
end

function Stage:addThing(thing, layer)
    if self.things[layer] == nil then
        self.things[layer] = { }
    end

    table.insert(self.things[layer], thing)
end

function Stage:moveThing(thing, gX, gY)
    if self:canMoveThing(thing, gX, gY) then
        thing:setGX(gX)
        thing:setGY(gY)
    end
end

function Stage:canMoveThing(thing, gX, gY)
    local testingRect = Rect.create()
    testingRect:copyRect(thing)
    testingRect:setGX(gX)
    testingRect:setGY(gY)

    for _, layer in ipairs(self.things) do
        for _, thingOnLayer in ipairs(layer) do
            if thing ~= thingOnLayer and thingOnLayer:isBlockeable() and thingOnLayer:isColliding(testingRect) then
                return false
            end
        end
    end
    
    return true
end

function Stage:poll(dt)
    self.gravityTicks = self.gravityTicks + dt
    
    if self.gravityTicks > 0.1 then
        self.gravityTicks = 0 
        
        for _, layer in ipairs(self.things) do
            for _, thing in ipairs(layer) do
                if not thing:ignoreGravity() then
                    thing:gratity()
                end
            end
        end
    end
end

