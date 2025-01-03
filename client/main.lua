RegisterNetEvent('esx_burgershot:activateJobPoints')
AddEventHandler('esx_burgershot:activateJobPoints', function()
    activateStations()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('esx_burgershot:checkjob')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
    TriggerServerEvent('esx_burgershot:checkjob')
end)

function createTargetBox(data)
    exports.ox_target:addBoxZone({
        coords = data.coords,
        size = vec3(data.w, data.d, data.h),
        rotation = data.r,
        debug = Config.debug,
        options = data.options
    })
end

CreateThread(function()
    local blipData = Config.blipSettings
    local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)

    SetBlipSprite(blip, blipData.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipData.scale)
    SetBlipColour(blip, blipData.colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.name)
    EndTextCommandSetBlipName(blip)
end)