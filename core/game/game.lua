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
    
    g_camera:setW(1024)
    g_camera:setH(768)
end

function g_game:poll(dt)
    if g_game.currentStage ~= nil then
        g_game.currentStage:poll(dt)
    end
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
    self.defaultThingScript = dofile('game/thing.lua')
    self.defaultCreatureScript = dofile('game/creature.lua')
    self.defaultPlayerScript = dofile('game/player.lua')
    self.defaultObjectScript = dofile('game/object.lua')
    self.defaultMonsterScript = dofile('game/monster.lua')

    setmetatable(self.defaultCreatureScript, { __index = self.defaultThingScript } )
    setmetatable(self.defaultPlayerScript, { __index = self.defaultCreatureScript } )
    setmetatable(self.defaultObjectScript, { __index = self.defaultCreatureScript } )
    setmetatable(self.defaultMonsterScript, { __index = self.defaultCreatureScript } )
end
