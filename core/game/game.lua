g_game = { }
g_game.currentStage = nil

g_game.defaultThingScript = nil
g_game.defaultObjectScript = nil
g_game.defaultCreatureScript = nil
g_game.defaultPlayerScript = nil
g_game.defaultMonsterScript = nil

function g_game:init()
    self:loadDefaultScripts()
    
    self:chooseStage('campo')

    g_camera:setGX(0)
    g_camera:setGY(0)
    
    g_camera:setWidth(1024)
    g_camera:setHeight(768)
end

function g_game:poll(dt)
    if g_game.currentStage ~= nil then
        g_game.currentStage:poll(dt)
    end
    
    g_camera:poll(dt)
end

function g_game:chooseStage(stageName)
    if self.currentStage ~= nil then
        self.currentStage:stop()
        
        self.currentStage = nil
    end
    
    local stage = g_stages:get(stageName)
    
    if stage ~= nil then
        self.currentStage = stage
        
        stage:start()
    else
        error(stageName .. " not found.")
    end
end

function g_game:loadDefaultScripts()
    self.defaultThingScript = dofile('core/script/thing.lua')
    self.defaultCreatureScript = dofile('core/script/creature.lua')
    self.defaultPlayerScript = dofile('core/script/player.lua')
    self.defaultObjectScript = dofile('core/script/object.lua')
    self.defaultMonsterScript = dofile('core/script/monster.lua')

    setmetatable(self.defaultCreatureScript, { __index = self.defaultThingScript } )
    setmetatable(self.defaultPlayerScript, { __index = self.defaultCreatureScript } )
    setmetatable(self.defaultObjectScript, { __index = self.defaultCreatureScript } )
    setmetatable(self.defaultMonsterScript, { __index = self.defaultCreatureScript } )
end

function g_game:keyPressed(key, unicode)
    if self.currentStage == nil then
        return
    end
    
    self.currentStage:onKeyPressed(key)
end

function g_game:keyReleased(key, unicode)
    if self.currentStage == nil then
        return
    end
    
    self.currentStage:onKeyReleased(key)
end
