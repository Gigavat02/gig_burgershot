CreateThread(function()
    RequestModel('prop_food_bs_tray_01')
    while not HasModelLoaded('prop_food_bs_tray_01') do
        Wait(10)
    end

    for k, v in pairs(Config.trays) do
        trayProp = CreateObject('prop_food_bs_tray_01', v.coords.x, v.coords.y, v.coords.z, false, true, true)
        SetEntityHeading(trayProp, v.r)
        PlaceObjectOnGroundProperly(trayProp)
        SetEntityAsMissionEntity(trayProp, true, true)
        FreezeEntityPosition(trayProp, true)

        TriggerServerEvent('esx_burgershot:registerTrayStash', k)

        local dataThirdEye = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsTrayStash'.. k,
                onSelect = function(data)
                    exports.ox_inventory:openInventory('stash', data.name)
                end,
                icon = 'fa fa-hand',
                label = 'Access Tray',
                distance = v.dist
            }
        }

        createTargetBox(dataThirdEye)
    end
end)