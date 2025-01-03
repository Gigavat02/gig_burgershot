local function washHands(sinkCoords)
    local player = PlayerPedId()
    local playerPos = GetEntityCoords(player, true)
    
    local dx = sinkCoords.x - playerPos.x
    local dy = sinkCoords.y - playerPos.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading(player, heading)

    lib.progressBar({
        duration = 5000,
        label = 'Washing hands',
        canCancel = true,
        disable = {
            car = true,
            move = true
        },
        anim = {
            dict = 'mp_arresting',
            clip = 'a_uncuff'
        }
    })
end

function activateHandWash()
    for k, v in pairs(Config.handWash) do
        local data = {
            coords = v.coords,
            w = v.w,
            d = v.d,
            h = v.h,
            r = v.r,
            options = {
                name = 'bsHandWash' .. k,
                onSelect = function()
                    washHands(v.coords)
                end,
                icon = 'fa fa-hand-holding-water',
                label = 'Wash Your Hands',
                distance = v.dist,
            }
        }
        createTargetBox(data)
    end
end

activateHandWash()