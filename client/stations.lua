local created = false

-- Prep Station
local function registerPrepStationMenu()
    local context = {
        id = 'bs_prepStation',
        title = 'Prep Station',
        options = {}
    }
    for k, v in pairs(Config.prepItemRecipies) do
        table.insert(context.options, {
            title = v.data.name,
            icon = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            image = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            onSelect = function()
                TriggerServerEvent('esx_burgershot:craftPrepItem', k)
            end
        })
    end
    lib.registerContext(context)
end

local function activatePrepStation()
    registerPrepStationMenu()
    for k, v in pairs(Config.prep) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsPrepStation' .. k,
                onSelect = function()
                    lib.showContext('bs_prepStation')
                end,
                icon = 'fa fa-hand',
                label = 'Prep Station',
                distance = v.dist,
                groups = 'burgershot'
            }
        }
        createTargetBox(data)
    end
end

-- Grill Station

local function registerGrillStationMenu()
    local context = {
        id = 'bs_grillStation',
        title = 'Grill Station',
        options = {}
    }
    for k, v in pairs(Config.grillItemRecipies) do
        table.insert(context.options, {
            title = v.data.name,
            icon = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            image = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            onSelect = function()
                TriggerServerEvent('esx_burgershot:craftGrillItem', k)
            end
        })
    end
    lib.registerContext(context)
end

local function activateGrillStation()
    registerGrillStationMenu()
    for k, v in pairs(Config.grill) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsPrepStation' .. k,
                onSelect = function()
                    lib.showContext('bs_grillStation')
                end,
                icon = 'fa fa-hand',
                label = 'Grill Station',
                distance = v.dist,
                groups = 'burgershot'
            }
        }
        createTargetBox(data)
    end
end

-- Fryer Station

local function registerFryerStationMenu()
    local context = {
        id = 'bs_fryerStation',
        title = 'Deep Frying Station',
        options = {}
    }
    for k, v in pairs(Config.fryerItemRecipies) do
        table.insert(context.options, {
            title = v.data.name,
            icon = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            image = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            onSelect = function()
                TriggerServerEvent('esx_burgershot:craftFryerItem', k)
            end
        })
    end
    lib.registerContext(context)
end

local function activateFryerStation()
    registerFryerStationMenu()
    for k, v in pairs(Config.fryer) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsPrepStation' .. k,
                onSelect = function()
                    lib.showContext('bs_fryerStation')
                end,
                icon = 'fa fa-hand',
                label = 'Frier Station',
                distance = v.dist,
                groups = 'burgershot'
            }
        }
        createTargetBox(data)
    end
end

-- Chop Station

local function registerChopStationMenu()
    local context = {
        id = 'bs_chopStation',
        title = 'Chop Station',
        options = {}
    }
    for k, v in pairs(Config.chopItemRecipies) do
        table.insert(context.options, {
            title = v.data.name,
            icon = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            image = 'https://r2.fivemanage.com/ybWHwrDvZkPxeXZqKBG4S/' .. v.data.image,
            onSelect = function()
                TriggerServerEvent('esx_burgershot:craftChopItem', k)
            end
        })
    end
    lib.registerContext(context)
end

local function activateChopStation()
    registerChopStationMenu()
    for k, v in pairs(Config.chop) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsChopStation' .. k,
                onSelect = function()
                    lib.showContext('bs_chopStation')
                end,
                icon = 'fa fa-hand',
                label = 'Chop Station',
                distance = v.dist,
                groups = 'burgershot'
            }
        }
        createTargetBox(data)
    end
end

local function activateSodaStation()
    for k, v in pairs(Config.soda) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsSodaStation' .. k,
                onSelect = function()
                    TriggerServerEvent('esx_burgershot:giveSoda')
                end,
                icon = 'fa fa-hand',
                label = 'Get Soda',
                distance = v.dist,
                groups = 'burgershot'
            }
        }
        if not Config.dataPrice.isFree then
            data.options.label = 'Get Soda ('.. Config.dataPrice.price ..'$)'
        end
        createTargetBox(data)
    end
end

local function activateCashRegisters()
    if Config.registersEnabled then
        for k, v in pairs(Config.registers) do
            local data = {
                coords = v.coords,
                w = v.w,
                d = v.d,
                h = v.h,
                r = v.r,
                options = {
                    name = 'bsCashRegister' .. k,
                    onSelect = function()
                        if Config.registerScript == 'bt-cashregister' then
                            TriggerEvent('bt-cashregister:openRegister')
                        else
                            -- You can add your custom cash register scirpt here
                        end
                    end,
                    icon = 'fa fa-cash-register',
                    label = 'Use Cash Register',
                    distance = v.dist,
                    groups = 'burgershot'
                }
            }
            createTargetBox(data)
        end
    end
end

function activateStations()
    if not created then
        activatePrepStation()
        activateGrillStation()
        activateFryerStation()
        activateChopStation()
        activateSodaStation()
        activateCashRegisters()
        created = true
    end
end

lib.callback.register('esx_burgershot:makeProgressBar', function(data)
    if lib.progressBar({
        duration = data.duration,
        label = data.label,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = data.dict,
            clip = data.clip,
            scenario = data.scenario
        },
    }) then
        return true 
    else 
        lib.notify({ description = 'Action canceled', type = 'error' })
        return false
    end
end)


RegisterNetEvent('esx_burgershot:cleanProps')
AddEventHandler('esx_burgershot:cleanProps', function()
    local entityCoords = GetEntityCoords(PlayerPedId())
    Wait(900)
    ClearArea(entityCoords.x, entityCoords.y, entityCoords.z, 1.0, true, false, false, false)
end)