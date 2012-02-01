local action = { }

local isJumping = false
local jumpTicks = 0
local maxJumpTicks = 0.8

local jumpPixelsPerSecond = 350

function action:poll(player, dt)
    if isJumping then
        if player:getStage():checkColision(player, 0, 1) and player.script.common.speedY <= 0 then
            isJumping = false
            
            return
        end
    end
end

function action:keyPressed(player, key)
    if key == "up" and not isJumping then
        if player:getStage():checkColision(player, 0, 3) then
           if player.script.common.speedY == nil then
                player.script.common.speedY = 0
            end
            
            player.script.common.speedY = player.script.common.speedY + jumpPixelsPerSecond

            isJumping = true
        end
    end
end

return action