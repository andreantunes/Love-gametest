local object = { }

object.maxX = 150
object.curX = 0
object.going = true

function object.poll(thing, dt)
    if object.going then
        thing:getStage():moveThing(thing, 1, 0)
        
        object.curX = object.curX + 1
        
        if object.curX == object.maxX then
            object.going = false
        end
    else
        thing:getStage():moveThing(thing, -1, 0)
        
        object.curX = object.curX - 1
        
        if object.curX == 0 then
            object.going = true
        end
    end
end

function object.getImageName()
    return "stone"
end

return object