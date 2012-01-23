local m = { }

m.ticks = 0;

function m:gravity(stage, thing)
    stage:moveThing(thing, thing:getGX(), thing:getGY() + 3)
end

function m:poll(stage, dt)
    self.ticks = self.ticks + dt
    
    if self.ticks >= 0.0 then
        self.ticks = 0
        
        local things = stage:getThings()
        
        for _, layer in ipairs(things) do
            for _, thing in ipairs(layer) do
                if not thing:isObject() then
                    self:gravity(stage, thing)
                end
            end
        end
    end
end

return m
