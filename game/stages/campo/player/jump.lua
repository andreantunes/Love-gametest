local action = { }

local isJumping = false
local jumpTicks = 0
local maxJumpTicks = 0.8

local jumpPixelsPerSecond = 350

function action:poll(thing, dt)
    if isJumping then
        if thing:getStage():checkColision(thing, 0, 1) and thing.script.common.speedY <= 0 then
            isJumping = false
            
            return
        end
    end
end

function action:keyPressed(thing, key)
    if key == "up" and not isJumping then
        if thing:getStage():checkColision(thing, 0, 3) then
            if thing.script.common.speedY == nil then
                thing.script.common.speedY = 0
            end
            
            thing.script.common.speedY = thing.script.common.speedY + jumpPixelsPerSecond

            isJumping = true
        end
    end
end

return action