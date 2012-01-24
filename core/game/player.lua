Player = { }
setmetatable(Player, Creature_mt)
Player_mt = { __index = Player }

function Player.create()
    local newPlayer = { }
    setmetatable(newPlayer, Player_mt)
    return newPlayer
end

function Player:isPlayer()
    return true
end
