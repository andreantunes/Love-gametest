local t = { }

t.actions = { }
t.currentImageName = 0

t.currentQuad = nil
t.quads = { }

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

function t:getQuad()
    return self.currentQuad
end

function t:setCurrentQuad(quad)
    self.currentQuad = quad
end

function t.init(thing)
    
end

return t
