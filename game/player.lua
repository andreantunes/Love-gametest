local p = { }

p.keys = { }

function p:keyPressed(player, key)
    self.keys[key] = true
    self:onKeyPressed(player, key)
    
    for _, action in ipairs(self.actions) do
        if action.keyPressed ~= nil then
            action:keyPressed(player, key)
        end
    end
end

function p:keyReleased(player,key)
    self.keys[key] = false
    self:onKeyReleased(key)
    
    for _, action in ipairs(self.actions) do
        if action.keyReleased ~= nil then
            action:keyReleased(player, key)
        end
    end
end

function p:onKeyPressed(key)

end

function p:onKeyReleased(key)
    
end

return p