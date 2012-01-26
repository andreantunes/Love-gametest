local m = { }

m.gravityPerSecond = -500 -- pixels/s

function m:gravity(stage, thing, dt)
    if thing.script.common.speedY == nil then
        thing.script.common.speedY = 0
    end

    if thing:getStage():checkColision(thing, 0, 1) and thing.script.common.speedY <= 0 then
        thing.script.common.speedY = 0
        return
    end

    thing.script.common.speedY = thing.script.common.speedY + (self.gravityPerSecond * dt)

    local y = math.ceil(dt * (thing.script.common.speedY))
    
    if y ~= 0 then
        thing:getStage():moveThing(thing, 0, -y)
    end
end

function m:poll(stage, dt)
    local things = stage:getThings()
    
    for _, layer in ipairs(things) do
        for _, thing in ipairs(layer) do
            if not thing:isObject() then
                self:gravity(stage, thing, dt)
            end
        end
    end
end

return m
