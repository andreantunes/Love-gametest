local t = { }

t.actions = { }

t.currentImageName = 0
t.currentImageX1 = 0
t.currentImageY1 = 0
t.currentImageX2 = 0
t.currentImageY2 = 0

function t.ignoreBlock(thing)
    return false
end

function t.poll(thing, dt)

end

function t.onMove(thing, oldPos, newPos)
    
end

function t.getImageName()
    if t.currentImageName == 0 then
        return nil
    end
    
    return t.currentImageName
end

function t.setImageX1(x1) t.currentImageX1 = x1 end
function t.setImageY1(y1) t.currentImageY1 = y1 end
function t.setImageX2(x2) t.currentImageX2 = x2 end
function t.setImageY2(y2) t.currentImageY2 = y2 end

function t.getImageX1() return t.currentImageX1 end
function t.getImageY1() return t.currentImageY1 end
function t.getImageX2() return t.currentImageX2 end
function t.getImageY2() return t.currentImageY2 end

return t
