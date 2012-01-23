g_stages = { }
g_stages.stages = { }

function g_stages:load(stageName)
    local stage = Stage.create()
    
    self.stages[stageName] = stage
    
    self:loadImages(stage, stageName)
    self:loadThings(stage, stageName)
    
    return true
end

function g_stages:loadImages(stage, stageName)
    local images = require('game/stages/' .. stageName .. "/images/images.lua")
    
    for _, image in ipairs(images) do
        stage:setImage(image.name, love.graphics.newImage('game/stages/' .. stageName .. "/images/" .. image.path))
    end
end

function g_stages:loadThings(stage, stageName)
    local things = require('game/stages/' .. stageName .. "/things.lua")
    
    for _, thing in ipairs(things.objects) do
        local newObject = Object.create()

        if thing.image ~= nil then
            newObject:setImage(stage.images[thing.image])
        else
            newObject:setNoImage(true)
        end
        
        newObject:setGX(thing.gX)
        newObject:setGY(thing.gY)
        newObject:setW(thing.width)
        newObject:setH(thing.height)
        
        newObject:setStage(stage)
        newObject:setBlockeable(thing.blockeable)
        
        stage:addThing(newObject, thing.layer)
    end
    
    for _, thing in ipairs(things.monsters) do
        local newMonster = Monster.create()

        newMonster:setImage(stage.images[thing.image])
        newMonster:setGX(thing.gX)
        newMonster:setGY(thing.gY)
        newMonster:setW(thing.width)
        newMonster:setH(thing.height)
        
        newMonster:setStage(stage)
        
        stage:addThing(newMonster, thing.layer)
    end
end

function g_stages:get(stageName)
    if not self:isLoaded(stageName) then
        if self:load(stageName) then
            return self.stages[stageName]
        end
        
        return nil
    end
    
    return self.stages[stageName]
end

function g_stages:isLoaded(stageName)
    return self.stages[stageName] ~= nil 
end

