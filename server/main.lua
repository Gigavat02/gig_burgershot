RegisterServerEvent('esx_burgershot:checkjob')
AddEventHandler('esx_burgershot:checkjob', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getJob().name == Config.jobName then
        TriggerClientEvent('esx_burgershot:activateJobPoints', src)
    end
end)

local function checkIfHasAllItems(src, recipe)
    for _, v in pairs(recipe) do
        local itemCount = exports.ox_inventory:GetItemCount(src, v.name)
        if itemCount < v.count then
            TriggerClientEvent('ox_lib:notify', src, {description = 'You do not have the required items', type = 'error'})
            return false
        end
    end
    return true
end

local function removeCraftingItems(src, recipe)
    for _, v in pairs(recipe) do
        exports.ox_inventory:RemoveItem(src, v.name, v.count)
    end
end

RegisterServerEvent('esx_burgershot:craftPrepItem')
AddEventHandler('esx_burgershot:craftPrepItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemsRequired = Config.prepItemRecipies[item].ingredients
    local progressData = {
        duration = 5000,
        label = 'Making item',
        dict = 'missheistfbisetup1',
        clip = 'hassle_intro_loop_f',
    }
    if checkIfHasAllItems(src, itemsRequired) then
        lib.callback('esx_burgershot:makeProgressBar', src, function(cb)
            if cb then
                removeCraftingItems(src, itemsRequired)
                exports.ox_inventory:AddItem(src, item, 1)
            end
        end, progressData)
    end
end)

RegisterServerEvent('esx_burgershot:craftGrillItem')
AddEventHandler('esx_burgershot:craftGrillItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemsRequired = Config.grillItemRecipies[item].ingredients
    local progressData = {
        duration = 15000,
        label = 'Grilling',
        scenario = 'PROP_HUMAN_BBQ'
    }
    if checkIfHasAllItems(src, itemsRequired) then
        lib.callback('esx_burgershot:makeProgressBar', src, function(cb)
            if cb then
                removeCraftingItems(src, itemsRequired)
                exports.ox_inventory:AddItem(src, item, 1)
                TriggerClientEvent('esx_burgershot:cleanProps', src)
            end
        end, progressData)
    end
end)

RegisterServerEvent('esx_burgershot:craftFryerItem')
AddEventHandler('esx_burgershot:craftFryerItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemsRequired = Config.fryerItemRecipies[item].ingredients
    local progressData = {
        duration = 7500,
        label = 'Deep frying',
    }
    if checkIfHasAllItems(src, itemsRequired) then
        lib.callback('esx_burgershot:makeProgressBar', src, function(cb)
            if cb then
                removeCraftingItems(src, itemsRequired)
                exports.ox_inventory:AddItem(src, item, 1)
            end
        end, progressData)
    end
end)

RegisterServerEvent('esx_burgershot:craftChopItem')
AddEventHandler('esx_burgershot:craftChopItem', function(item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = Config.chopItemRecipies[item].ingredients[1]
    print(json.encode(data))
    local check = exports.ox_inventory:GetItemCount(src, data.name)
    local progressData = {
        duration = 5000,
        label = 'Making item',
        dict = 'missheistfbisetup1',
        clip = 'hassle_intro_loop_f',
    }
    if check > 0 then
        lib.callback('esx_burgershot:makeProgressBar', src, function(cb)
            if cb then
                exports.ox_inventory:RemoveItem(src, data.name, 1)
                exports.ox_inventory:AddItem(src, item, data.count)
            end
        end, progressData)
    else
        TriggerClientEvent('ox_lib:notify', src, {description = 'You do not have the required items', type = 'error'})
    end
end)

RegisterServerEvent('esx_burgershot:giveSoda')
AddEventHandler('esx_burgershot:giveSoda', function()
    local src = source
    local sodaItem = Config.sodaItem
    local canCarry = exports.ox_inventory:CanCarryItem(src, sodaItem, 1)
    if canCarry and Config.dataPrice.isFree then
        exports.ox_inventory:AddItem(src, sodaItem, 1)
    elseif canCarry and not Config.dataPrice.isFree then
        local xPlayer = ESX.GetPlayerFromId(src)
        local balance = xPlayer.getAccount(Config.dataPrice.account).money
        if balance >= Config.dataPrice.price then
            xPlayer.removeAccountMoney(Config.dataPrice.account, Config.dataPrice.price)
            exports.ox_inventory:AddItem(src, sodaItem, 1)
        else
            TriggerClientEvent('ox_lib:notify', src, { tittle = 'No Money', description = 'You don\'t Have enought money for a soda', type = 'error'})
        end
    else
        TriggerClientEvent('ox_lib:notify', src, { tittle = 'Too Heavy', description = 'You can\'t carry any more items', type = 'error'})
    end
end)

RegisterServerEvent('esx_burgershot:registerTrayStash')
AddEventHandler('esx_burgershot:registerTrayStash', function(id)
    exports.ox_inventory:RegisterStash('bsTrayStash'.. id, 'Tray '.. id, 5, 5000)
end)