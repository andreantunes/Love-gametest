local action = { }

function action:poll(thing, dt)
    if thing.script.keys["right"] ~= nil and thing.script.keys["right"] then
        thing.script:move(2, 0)
    end

    if thing.script.keys["left"] ~= nil and thing.script.keys["left"] then
        thing.script:move(-2, 0)
    end
end

return action