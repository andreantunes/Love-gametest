local things = {
    objects = {
        { script = "background.lua", gX = 0, gY = 0, layer = 1, width = 3000, height = 960, blockeable = false },
        { script = "map.lua", gX = 0, gY = 0, layer = 2, width = 3000, height = 960, blockeable = false },
        { script = "stone.lua", gX = 120, gY = 250, layer = 2, width = 124, height = 63, blockeable = true },
        
        { script = "nuvem.lua", gX = 10, gY = 10, layer = 4, width = 205, height = 107, blockeable = false },

        { script = "pau.lua", gX = 2382, gY = 690, layer = 4, blockeable = true },
        
        { gX = 0, gY = 742, toGX = 792, toGY = 953, layer = 2, blockeable = true },
        { gX = 833, gY = 615, toGX = 945, toGY = 669, layer = 2, blockeable = true },
        { gX = 992, gY = 743, toGX = 1352, toGY = 955, layer = 2, blockeable = true },
        { gX = 1368, gY = 611, toGX = 1471, toGY = 650, layer = 2, blockeable = true },
        { gX = 1514, gY = 745, toGX = 1810, toGY = 955, layer = 2, blockeable = true },
        { gX = 1892, gY = 745, toGX = 2044, toGY = 792, layer = 2, blockeable = true },
        { gX = 2107, gY = 745, toGX = 2266, toGY = 790, layer = 2, blockeable = true },
        { gX = 2374, gY = 745, toGX = 3000, toGY = 960, layer = 2, blockeable = true },
        { gX = 2545, gY = 556, toGX = 2738, toGY = 624, layer = 2, blockeable = true },
        { gX = 2790, gY = 449, toGX = 2975, toGY = 507, layer = 2, blockeable = true },
        { gX = 2599, gY = 331, toGX = 2732, toGY = 374, layer = 2, blockeable = true },
        { gX = 2132, gY = 186, toGX = 2291, toGY = 235, layer = 2, blockeable = true },
        { gX = 2359, gY = 252, toGX = 2512, toGY = 303, layer = 2, blockeable = true },
        { gX = 1873, gY = 92, toGX = 2079, toGY = 171, layer = 2, blockeable = true },
        
    },

    player = { 
         gX = 50, gY = 50, layer = 3, width = 32, height = 32,
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
