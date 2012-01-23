g_player = { }
setmetatable(g_player, Creature_mt)

function g_player:isPlayer()
    return true
end
