local monster = { }

monster.image = "pikachu"
monster.w = 52
monster.h = 52

monster.currentImageX2 = 52
monster.currentImageY2 = 52

monster.lol = 0

function monster:poll(dt)
    if self.lol == 0 then
        self.lol = math.random(1,4)
    end
    
    self:move(self.lol, 0)
end

function monster:getImageName()
    return "pikachu"
end

function monster:init(thing)
    self.width = 52
    self.height = 52
end

return monster
