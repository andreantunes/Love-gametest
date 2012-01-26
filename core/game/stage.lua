Stage = {}
Stage_mt = { __index = Stage }
setmetatable(Stage, Rect_mt)

Stage.player = 0
Stage.things = { }
Stage.images = { }
Stage.modules = { }

Stage.width = 0
Stage.height = 0

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

function Stage:setPlayer(player)
    self.player = player
end

function Stage:getPlayer()
    return self.player
end

function Stage:onKeyPressed(key)
    self.player.script:keyPressed(self.player, key)
end

function Stage:onKeyReleased(key)
    self.player.script:keyReleased(self.player, key)
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

function Stage:getImage(name)
    return self.images[name]
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
    local oldPosition = { gX = thing:getGX(), gY = thing:getGY() }
    local newPosition = Stage:getLongestAvaiblePosition(thing, gX, gY)
    
    if newPosition == nil then
        return
    end
    
    thing:setGX(newPosition.gX)
    thing:setGY(newPosition.gY)
    
    thing:onMove(oldPosition, newPosition)
end

function Stage:moveThingTo(thing, gX, gY)
    local oldPosition = { gX = thing:getGX(), gY = thing:getGY() }
    local newPosition = { gX = gX, gY = gY }
    
    if self:canMoveThing(thing, gX, gY) then
        thing:setGX(gX)
        thing:setGY(gY)
        
        thing:onMove(oldPosition, newPosition)
    end
end

function Stage:canMoveThing(thing, gX, gY)
    if thing.script:ignoreBlock(thing) then
        return true
    end
    
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
    for _, module in ipairs(self.modules) do
        module:poll(self, dt)
    end
    
    for _, layer in ipairs(self.things) do
        for _, thingOnLayer in ipairs(layer) do
            thingOnLayer:poll(dt)
        end
    end
end

function Stage:addModule(module)
    table.insert(self.modules, module)
end

function Stage:getCollidingThings(thing)
    local ret = { }
    
    for _, layer in ipairs(self.things) do
        for _, thingOnLayer in ipairs(layer) do
            if thing ~= thingOnLayer and not thingOnLayer.script:ignoreBlock(thingOnLayer) and thing:isColliding(thingOnLayer) then
                table.insert(ret, thingOnLayer)
            end
        end
    end
    
    return ret
end

function Stage:checkColision(thing, plusGX, plusGY)
    local testingRect = Rect.create()
    testingRect:copyRect(thing)
    testingRect:addGX(plusGX)
    testingRect:addGY(plusGY)

    for _, layer in ipairs(self.things) do
        for _, thingOnLayer in ipairs(layer) do
            if thing ~= thingOnLayer and thingOnLayer:isBlockeable() and thingOnLayer:isColliding(testingRect) then
                return true
            end
        end
    end
    
    return false
end

function Stage:getLongestAvaiblePosition(thing, plusGX, plusGY)
    if thing.script:ignoreBlock(thing) then
        return { gX = thing:getGX() + plusGX, gY = thing:getGY() + plusGY }
    end
       
    local multiplePlusGX = 0
    local multiplePlusGY = 0
    
    if plusGX ~= 0 then
        multiplePlusGX = plusGX > 0 and -1 or 1
        
    elseif plusGY ~= 0 then
        multiplePlusGY = plusGY > 0 and -1 or 1
    end

    while plusGX ~= 0 or plusGY ~= 0 do
        if not self:checkColision(thing, plusGX, plusGY) then
            return { gX = thing:getGX() + plusGX, gY = thing:getGY() + plusGY }
        end
        
        plusGX = plusGX + (1 * multiplePlusGX)
        plusGY = plusGY + (1 * multiplePlusGY)
    end
    
    return nil
end
