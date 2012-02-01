local p = { }

p.keys = { }

function p:keyPressed(key)
    self.keys[key] = true
    self:onKeyPressed(key)
    
    for _, action in ipairs(self.actions) do
        if action.keyPressed ~= nil then
            action:keyPressed(self.thing, key)
        end
    end
end

function p:keyReleased(key)
    self.keys[key] = false
    self:onKeyReleased(key)
    
    for _, action in ipairs(self.actions) do
        if action.keyReleased ~= nil then
            action:keyReleased(self.thing, key)
        end
    end
end

function p:onKeyPressed(key)

end

function p:onKeyReleased(key)
    
end

return p