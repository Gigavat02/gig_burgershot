Config = {

    debug = false,

    jobName = 'burgershot',

    registersEnabled = true, -- If set to true, the cashregisters will be enabled
    registerScript = 'bt-cashregister', 
    --[[
        The only one available right now is 'bt-cashregister' (https://github.com/SimplyATaco/B-T-Cash-Register). Let me know if you would like any other supported.
        Set to false to add your own. You will need to manually add it in the client/stations.lua in line 223.
    ]]
    
    -- Blip Settings
    blipSettings = {
        name = 'Burgershot',
        coords = vec3(-1194.04, -891.18, 13.96),
        sprite = 103,
        scale = 0.75,
        colour = 1
    },

    -- Locations (Made for GN studios burgershot map (https://fivem.gn.studio/package/4841796))
    handWash = {
        { coords = vec3(-1197.61, -902.73, 13.8), r = 215.0, w = 0.8, d = 0.8, h = 1.0, dist = 1.0 },
        { coords = vec3(-1205.24, -893.90, 13.8), r = 215.0, w = 0.6, d = 0.8, h = 1.0, dist = 1.0 },
        { coords = vec3(-1206.01, -892.84, 13.8), r = 215.0, w = 0.6, d = 0.8, h = 1.0, dist = 1.0 },
        { coords = vec3(-1201.96, -890.09, 13.8), r = 215.0, w = 0.6, d = 0.8, h = 1.0, dist = 1.0 },
        { coords = vec3(-1201.16, -891.14, 13.8), r = 215.0, w = 0.6, d = 0.8, h = 1.0, dist = 1.0 }
    },

    prep = { 
        { coords = vec3(-1196.40, -899.12, 14.0), r = 35.0, w = 2.0, d = 0.8, h = 1.0, dist = 1.5 }
    },

    chop = { 
        { coords = vec3(-1197.19, -898.18, 14.0), r = 35.0, w = 2.0, d = 0.8, h = 1.0, dist = 1.5 }
    },

    grill = { 
        { coords = vec3(-1198.25, -895.1, 14.0), r = 35.0,  w = 1.45, d = 0.8, h = 1.0, dist = 1.5 }
    },

    fryer = { 
        { coords = vec3(-1200.85, -896.84, 14.0), r = 35.0, w = 1.6, d = 0.8, h = 1.0, dist = 1.5 }
    },
    
    soda = { 
        { coords = vec3(-1197.0, -895.0, 14.0), r = 124.0, w = 1.0, d = 0.6, h = 1.5, dist = 1.5  }
    },
    
    registers = {
        { coords = vec3(-1194.95, -893.15, 14.2), r = 124.0, w = 0.8, d = 0.6, h = 0.25, dist = 1.5 },
        { coords = vec3(-1193.97, -894.67, 14.2), r = 124.0, w = 0.8, d = 0.6, h = 0.25, dist = 1.5 },
        { coords = vec3(-1192.93, -896.24, 14.2), r = 124.0, w = 0.8, d = 0.6, h = 0.25, dist = 1.5 }
    },

    trays = {
        { coords = vec3(-1194.49, -893.86, 14.1), r = 124.0, w = 0.8, d = 0.5, h = 0.25, dist = 1.0 },
        { coords = vec3(-1193.39, -895.42, 14.1), r = 124.0, w = 0.8, d = 0.5, h = 0.25, dist = 1.0 },
        { coords = vec3(-1192.39, -896.86, 14.1), r = 124.0, w = 0.8, d = 0.5, h = 0.25, dist = 1.0 },
    },

    -- Recipies
    prepItemRecipies = {
        --[[
        ['reward'] = { -- The item you want to make
            ingredients = { -- The item required and amount of that item
                {name = 'required-item', count = 1},
                {name = 'required-item', count = 2},
            },
            data = {
                name = 'Menu Name', -- The name that will be shown in the crafting menu
                image = 'reward.png', -- The image that will be shown in the crafting menu
            }
        },
        ]]
        ['burger'] = {
            ingredients = {
                {name = 'burger_bread_industrial', count = 1}, 
                {name = 'patty_cooked', count = 2},
                {name = 'cheese_slice', count = 1}, 
                {name = 'lettuce_chopped', count = 1},
                {name = 'tomato_sliced', count = 1},
                {name = 'onion_sliced', count = 1},
            },
            data = {
                name = 'Burger',
                image = 'burger.png',
            }
        }
    },
    
    grillItemRecipies = {
        ['patty_cooked'] = {
            ingredients = {
                {name = 'patty', count = 1},
            },
            data = {
                name = 'Cooked Patty',
                image = 'patty_cooked.png',
            }
        }
    },
    
    fryerItemRecipies = {
        ['fries'] = {
            ingredients = {
                {name = 'potato_sliced_frozen', count = 1},
            },
            data = {
                name = 'French Fries',
                image = 'fries.png',
            }
        }
    },

    chopItemRecipies = {
        --[[
        ['reward'] = { -- The item you want to make
            ingredients = { -- The item required and amount !THAT WILL BE REWARDED!
                {name = 'required-item', count = 1},
                {name = 'required-item', count = 2},
            },
            data = {
                name = 'Menu Name', -- The name that will be shown in the crafting menu
                image = 'reward.png', -- The image that will be shown in the crafting menu
            }
        },
        ]]
        ['tomato_sliced'] = {
            ingredients = {
                {name = 'tomato', count = 2},
            },
            data = {
                name = 'Sliced Tomato',
                image = 'tomato_sliced.png',
            }
        },
        ['onion_sliced'] = {
            ingredients = {
                {name = 'onion', count = 2},
            },
            data = {
                name = 'Sliced Onion',
                image = 'onion_sliced.png',
            }
        },
        ['lettuce_chopped'] = {
            ingredients = {
                {name = 'lettuce', count = 4},
            },
            data = {
                name = 'Chopped Lettuce',
                image = 'lettuce_chopped.png',
            }
        }
    },

    sodaItem = 'drink_burgershot', -- The item that will be given at the soda dispenser
    dataPrice = {
        isFree = false, -- If set to true, the soda will be free (If the soda is free, ignore the bellow)
        account = 'money', -- Remove money from cash or bank ('money' or 'bank')
        price = 5 -- The price for one soda
    }
}