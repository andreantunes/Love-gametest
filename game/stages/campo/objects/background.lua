local object = { }

local ticks = 0
local count = 1
local countMax = 3

function object:getImageName()
    return "bg" .. count
end

function object:poll(dt)
    ticks = ticks + dt
    
    if ticks > 0.3 then
        ticks = 0
        
        count = count + 1
        
        if count > countMax then
            count = 1
        end
    end
end

function object:init()
    self.width = 3000
    self.height = 960
end

return object