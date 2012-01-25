local action = { }

local isJumping = false
local jumpTicks = 0
local maxJumpTicks = 0.8

function action.poll(thing, dt)
    if isJumping then
        jumpTicks = jumpTicks + dt
        
        if jumpTicks >= maxJumpTicks then
            isJumping = false
            
            jumpTicks = 0
        else
            thing:getStage():moveThing(thing, 0, -5)
        end
    end
end

function action.keyPressed(thing, key)
    if key == "up" and not isJumping then
        if thing:getStage():checkColision(thing, 0, 3) then
            isJumping = true
        end
    end
end

return action