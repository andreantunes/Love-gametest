g_camera = {}
g_camera.stage = nil

setmetatable(g_camera, Rect_mt)

function g_camera:reset()
    self.stage = nil
end

function g_camera:setStage(stage)
    self.stage = stage
end

function g_camera:shouldDraw(thing)
    return self:isColliding(thing)
end

function g_camera:poll(dt)
    if g_game.currentStage == nil then
        return
    end
    
    local stage = g_game.currentStage
    local player = stage:getPlayer()
    
    self:setGX(math.max(math.min(player:getGX() - (self:getWidth() / 2) + (player:getWidth() / 2), stage:getWidth() - self:getWidth()), 0))
    self:setGY(math.max(math.min(player:getGY() - (self:getHeight() / 2), stage:getHeight() - self:getHeight()), 0))
end

function g_camera:draw()
    if self.stage == nil then
        return
    end
    
    local things = self.stage:getThings()

    for _, layer in ipairs(things) do
        for _, thing in ipairs(layer) do
            local image = thing:getImage()

            if image ~= nil then
                if self:shouldDraw(thing) then
                    love.graphics.drawq(thing:getImage(), thing.script:getQuad(), thing:getGX() - self:getGX(), thing:getGY() - self:getGY())
                end
            end
        end
    end
end
