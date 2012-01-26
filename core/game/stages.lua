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
    
    stage:setW(main.width)
    stage:setH(main.height)
end

function g_stages:loadThings(stage, stageName)
    local things = dofile('game/stages/' .. stageName .. "/things.lua")
    
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

        local objectScript = nil
        
        if thing.script ~= nil then
            objectScript = dofile('game/stages/' .. stageName .. "/objects/" .. thing.script)
        else
            objectScript = dofile('game/stages/' .. stageName .. "/objects/default.lua")
        end
        
        setmetatable(objectScript, { __index = g_game.defaultObjectScript } )
        
        newObject:setScript(objectScript)
        newObject.script:init(newObject)
        newObject.script:loadActions(stageName)
        newObject.script:thingInit()

        stage:addThing(newObject, thing.layer)
    end
    
    local player = things.player
    
    local newPlayer = Player.create()
    
    newPlayer:setGX(player.gX)
    newPlayer:setGY(player.gY)
    newPlayer:setW(player.width)
    newPlayer:setH(player.height)
    
    newPlayer:setStage(stage)
    stage:setPlayer(newPlayer)
    
    local playerScript = dofile('game/stages/' .. stageName .. "/player.lua")
    setmetatable(playerScript, { __index = g_game.defaultPlayerScript } )
    
    newPlayer:setScript(playerScript)
    newPlayer.script:loadActions(stageName)
    newPlayer.script:init(newPlayer)
    newPlayer.script:thingInit()
        
    stage:addThing(newPlayer, player.layer)
    
    for _, thing in ipairs(things.monsters) do
        local newMonster = Monster.create()
        
        newMonster:setGX(thing.gX)
        newMonster:setGY(thing.gY)
        
        local monsterScript = dofile('game/stages/' .. stageName .. "/monsters/" .. thing.script)
        setmetatable(monsterScript, { __index = g_game.defaultMonsterScript } )
        
        newMonster:load(stage, monsterScript)
        newMonster:setScript(monsterScript)
        newMonster.script:init(newMonster)
        newMonster.script:loadActions(stageName)
        newMonster.script:thingInit()
            
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

