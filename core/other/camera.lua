g_camera = {}
g_camera.stage = nil

setmetatable(g_camera, Thing_mt)

function g_camera:reset()
    self.stage = nil
end

function g_camera:setStage(stage)
    self.stage = stage
end

function g_camera:shouldDraw(thing)
    return self:isColliding(thing)
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
                    love.graphics.draw(thing:getImage(), thing:getGX() - self:getGX(), thing:getGY() - self:getGY())
                end
            end
        end
    end
end
