local object = { }

function object:getImageName()
    return "nuvem"
end

function object:init(thing)
    self:setCurrentQuad(love.graphics.newQuad(0, 0, 205, 107, 205, 107))
end

return object