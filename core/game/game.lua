g_game = { }
g_game.currentStage = nil

function g_game:init()
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
