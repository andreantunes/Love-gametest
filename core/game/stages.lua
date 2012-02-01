g_stages = { }
g_stages.stages = { }

function g_stages:load(stageName)
    local stage = Stage.create()
    
    self.stages[stageName] = stage
    
    self:loadImages(stage, stageName)
    self:loadThings(stage, stageName)
    self:loadMain(stage, stageName)
    
    return true
end

function g_stages:loadImages(stage, stageName)
    local images = dofile('game/stages/' .. stageName .. "/images/images.lua")
    
    for _, image in ipairs(images) do
        stage:setImage(image.name, love.graphics.newImage('game/stages/' .. stageName .. "/images/" .. image.path))
    end
end

function g_stages:loadMain(stage, stageName)
    local main = dofile('game/stages/' .. stageName .. "/main.lua")
    
    for _, modulePath in ipairs(main.modules) do
        local moduleScript = dofile('game/modules/' .. modulePath)
        stage:addModule(moduleScript)
    end
    
    stage:setWidth(main.width)
    stage:setHeight(main.height)
end

function g_stages:loadThings(stage, stageName)
    local things = dofile('game/stages/' .. stageName .. "/things.lua")
    
    for _, thing in ipairs(things.objects) do
        local newObject = Object.create()
        
        newObject:setGX(thing.gX)
        newObject:setGY(thing.gY)
        
        newObject:setStage(stage)
        newObject:setBlockeable(thing.blockeable)

        local objectScript = nil
        
        local defaultScript = false
        
        if thing.script ~= nil then
            objectScript = dofile('game/stages/' .. stageName .. "/objects/" .. thing.script)
        else
            defaultScript = true
            objectScript = dofile('game/stages/' .. stageName .. "/objects/default.lua")
        end
        
        setmetatable(objectScript, { __index = g_game.defaultObjectScript } )
        
        newObject:setScript(objectScript)
        newObject.script:loadActions(stageName)
        newObject.script:thingInit(newObject)

        if defaultScript then
            newObject:setWidth(thing.width)
            newObject:setHeight(thing.height)
            
            if thing.toGX ~= nil then
                newObject:setWidth(thing.toGX - thing.gX)
            end
            
            if thing.toGY ~= nil then
                newObject:setHeight(thing.toGY - thing.gY)
            end
        end
        
        stage:addThing(newObject, thing.layer)
    end
    
    local player = things.player
    
    local newPlayer = Player.create()
    
    newPlayer:setGX(player.gX)
    newPlayer:setGY(player.gY)
    
    newPlayer:setStage(stage)
    stage:setPlayer(newPlayer)
    
    local playerScript = dofile('game/stages/' .. stageName .. "/player.lua")
    setmetatable(playerScript, { __index = g_game.defaultPlayerScript } )
    
    newPlayer:setScript(playerScript)
    newPlayer.script:loadActions(stageName)
    newPlayer.script:thingInit(newPlayer)
        
    stage:addThing(newPlayer, player.layer)
    
    for _, thing in ipairs(things.monsters) do
        local newMonster = Monster.create()
        
        newMonster:setGX(thing.gX)
        newMonster:setGY(thing.gY)
        
        local monsterScript = dofile('game/stages/' .. stageName .. "/monsters/" .. thing.script)
        setmetatable(monsterScript, { __index = g_game.defaultMonsterScript } )
        
        newMonster:load(stage, monsterScript)
        newMonster:setScript(monsterScript)
        newMonster.script:loadActions(stageName)
        newMonster.script:thingInit(newMonster)
            
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

