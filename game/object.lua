local object = { }

function object.ignoreBlock(thing)
    return true
end

function object.onMovePushThings(thing, oldPos, newPos)
    local stage = thing:getStage()
    
    local things = stage:getCollidingThings(thing)
    
    if #things == 0 then
        return
    end

    local function figureOutMovingDirection(oldPos, newPos)
        if newPos.gX - oldPos.gX > 0 then
            return "right"
        elseif newPos.gX - oldPos.gX < 0 then
            return "left"
        elseif newPos.gY - oldPos.gY > 0 then
            return "down"
        else
            return "up"
        end
    end

    local myMovingDirection = figureOutMovingDirection(oldPos, newPos)
    
    for _, collidingThing in ipairs(things) do
        if not collidingThing.script.ignoreBlock(collidingThing) then
            local movingPos = thing:getNearestValidPosition(collidingThing, myMovingDirection)

            if movingPos ~= nil then
                stage:moveThingTo(collidingThing, movingPos.gX, movingPos.gY)
            end
        end
    end
end

function object.onMove(thing, oldPos, newPos)
    object.onMovePushThings(thing, oldPos, newPos)
end

return object