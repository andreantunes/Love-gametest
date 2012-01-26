local action = { }

function action:onMove(thing, oldPos, newPos)
    local stage = thing:getStage()
    
    local things = stage:getCollidingThings(thing)
    
    if #things == 0 then
        return
    end

    local myMovingDirection = Rect.figureOutMovingDirection(oldPos, newPos)
    
    for _, collidingThing in ipairs(things) do
        if not collidingThing.script:ignoreBlock(collidingThing) then
            local movingPos = thing:getNearestValidPosition(collidingThing, myMovingDirection)

            if movingPos ~= nil then
                stage:moveThingTo(collidingThing, movingPos.gX, movingPos.gY)
            end
        end
    end
end

return action