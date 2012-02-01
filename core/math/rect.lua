Rect = { }
Rect_mt = { __index = Rect }

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
function Rect:setWidth(w) self.width = w end
function Rect:setHeight(h) self.height = h end

function Rect:getGX() return self.gX end
function Rect:getGY() return self.gY end
function Rect:getWidth() return self.width end
function Rect:getHeight() return self.height end

    
function Rect:isInMyArea(gX, gY)
    return gX >= self.gX and gY >= self.gY and gX <= self.gX + self.width and gY <= self.gY + self.height;
end

function Rect:isOutOfMyArea(gX, gY)
    return not self:isInMyArea(gX, gY)
end

function Rect:internalColliding(thing)
    return self:isInMyArea(thing:getGX(), thing:getGY())
        or self:isInMyArea(thing:getGX(), thing:getGY() + thing:getHeight())
        or self:isInMyArea(thing:getGX() + thing:getWidth(), thing:getGY())
        or self:isInMyArea(thing:getGX() + thing:getWidth(), thing:getGY() + thing:getHeight())
end

function Rect:isColliding(thing)
    return self:internalColliding(thing) or thing:internalColliding(self)
end

function Rect:getNearestValidPosition(thing, direction)
    local myPos = { gX = self:getGX(), gY = self:getGY(), w = self:getWidth(), h = self:getHeight() }
    local thingPos = { gX = thing:getGX(), gY = thing:getGY(), w = thing:getWidth(), h = thing:getHeight() }

    if direction == "right" then
        return { gX = myPos.gX + myPos.w + 1 , gY = thingPos.gY } 

    elseif direction == "left" then
        return { gX = myPos.gX - thingPos.w - 1, gY = thingPos.gY }
    
    elseif direction == "up" then
        return { gX = thingPos.gX, gY = myPos.gY - thingPos.h - 1}

    elseif direction == "down" then
        return { gX = thingPos.gX, gY = myPos.gY + myPos.h + 1}
    end
    
    return nil
end

function Rect.figureOutMovingDirection(oldPos, newPos)
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
