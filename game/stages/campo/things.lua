local things = {
    objects = {
        { script = "background.lua", gX = 0, gY = 0, layer = 1, width = 3000, height = 960, blockeable = false },
        { script = "map.lua", gX = 0, gY = 0, layer = 2, width = 3000, height = 960, blockeable = false },
        { script = "stone.lua", gX = 120, gY = 250, layer = 2, width = 124, height = 63, blockeable = true },

        { gX = 0, gY = 738, width = 792, height = 100, layer = 2, blockeable = true },
    },

    player = { 
         gX = 50, gY = 50, layer = 3, width = 50, height = 50,
    },

    monsters = {
        { script = "pikachu.lua", gX = 120, gY = 120, layer = 3 },
        { script = "pikachu.lua", gX = 150, gY = 120, layer = 3 },
        { script = "pikachu.lua", gX = 170, gY = 120, layer = 3 },
        { script = "pikachu.lua", gX = 180, gY = 120, layer = 3 },
        { script = "pikachu.lua", gX = 200, gY = 120, layer = 3 }
    }
}

return things
