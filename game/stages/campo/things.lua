local things = {
    objects = {
        { image = "bg", gX = 0, gY = 0, layer = 1, width = 3000, height = 960, blockeable = false },
        { image = "map", gX = 0, gY = 0, layer = 2, width = 3000, height = 960, blockeable = false },
        { gX = 0, gY = 738, width = 792, height = 100, layer = 2, blockeable = true },
    },

    player = { 
            
    },

    monsters = {
         { image = "pikachu", gX = 120, gY = 120,  width = 32, height = 32, layer = 3 }
    }
}

return things
