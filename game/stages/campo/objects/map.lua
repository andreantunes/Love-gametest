local object = { }

function object:getImageName()
    return "map"
end

function object:init()
    self.width = 3000
    self.height = 960
end

return object