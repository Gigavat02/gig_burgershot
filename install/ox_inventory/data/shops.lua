BurgerShotFridge = {
    name = "Fridge",
    groups = {
        ['burgershot'] = 0 -- Change to the job name on your config.lua
    }, inventory = {
        { name = 'burger_bread_industrial' },
        { name = 'patty' },
        { name = 'cheese_slice' },
        { name = 'tomato' },
        { name = 'lettuce' },
        { name = 'onion' },
        { name = 'potato_sliced_frozen' },
    }, locations = {
        vec3(-1201.31, -901.69, 13.75)
    }, targets = {
        { loc = vec3(-1201.31, -901.69, 13.75), length = 3.6, width = 0.6, heading = 35.0, minZ = 13.0, maxZ = 14.5, distance = 1.5 }
    }
},