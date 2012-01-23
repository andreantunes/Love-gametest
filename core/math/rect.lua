Rect = { }
Rect_mt = { __index = Rect }
setmetatable(Rect, Rect_mt)

function Rect.create()
    local newRect = {}
    setmetatable(newRect, Rect_mt)
    return newRect;
end

function Rect:copyRect(other)
    self.gX = other.gX
    self.gY = other.gY
    self.height = other.height
    self.width = other.width
end

Rect.gX = 0
Rect.gY = 0
Rect.height = 0
Rect.width = 0

function Rect:addGX(x) self.gX = self.gX + x end
function Rect:addGY(y) self.gY = self.gY + y end

function Rect:setGX(x) self.gX = x end
function Rect:setGY(y) self.gY = y end
function Rect:setW(w) self.width = w end
function Rect:setH(h) self.height = h end

function Rect:getGX() return self.gX end
function Rect:getGY() return self.gY end
function Rect:getW() return self.width end
function Rect:getH() return self.height end

    
function Rect:isInMyArea(gX, gY)
    return gX >= self.gX and gY >= self.gY and gX <= self.gX + self.width and gY <= self.gY + self.height;
end

function Rect:isColliding(thing)
    return self:isInMyArea(thing:getGX(), thing:getGY())
        or self:isInMyArea(thing:getGX(), thing:getGY() + thing:getH())
        or self:isInMyArea(thing:getGX() + thing:getW(), thing:getGY())
        or self:isInMyArea(thing:getGX() + thing:getW(), thing:getGY() + thing:getH());
end
