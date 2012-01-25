local object = { }

function object.getImageName()
    return "map"
end

function object:init(thing)
    self:setCurrentQuad(love.graphics.newQuad(0, 0, 3000, 960, 3000, 960))
end

return object