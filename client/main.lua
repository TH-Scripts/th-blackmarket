-- Local Variables
local spawnped = false
local RadialIsShowing = false
local entryPoint = nil
local iplPoint = nil

-- NPC Spawn
--@param Config.Enter.NPC.model
--@param Config.Enter.NPC.coords

Citizen.CreateThread(function()
    while true do
        if spawnped == false then
            spawnped = true
            RequestModel(GetHashKey(Config.Enter.NPC.model))
            while not HasModelLoaded(GetHashKey(Config.Enter.NPC.model)) do
                Wait(1)
            end

            ped1 = CreatePed(4, GetHashKey(Config.Enter.NPC.model), Config.Enter.NPC.coords, false, true) -- ændrer disse koordinater
            FreezeEntityPosition(ped1, true)
            SetEntityInvincible(ped1, true)
            SetBlockingOfNonTemporaryEvents(ped1, true)
        end
        Citizen.Wait(10000)
    end
end)  


--OX Target
--@param Config.Enter.Target.coords

exports.ox_target:addSphereZone({
    coords = Config.Enter.Target.coords,
    radius = 1,
    debug = drawZones,
    options = {
        {
            icon = 'fa-solid fa-book',
            label = 'Åben marketet',
            onSelect = function()
                lib.showContext('blackmarket_menu')
            end
        }
    }
})


--Enter IPL
--@param Config.Enter.Entry

Citizen.CreateThread(function()
    entryPoint = lib.points.new({
        coords = Config.Enter.Entry.coords,
        radius = 1.0,
        distance = 2.0,
        onEnter = onEnter,
        onExit = onExit,
        nearby = function(point)
            DrawMarker(2, point.coords.x, point.coords.y, point.coords.z+1 - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 57, 255, 20, 100, false, true, 2, true, nil, nil, false)
        end
    })

    iplPoint = lib.points.new({
        coords = Config.Enter.IPL.coords,
        radius = 1.0,
        distance = 2.0,
        onEnter = onEnterIPL,
        onExit = onExitIPL,
    })



    while true do
        Citizen.Wait(1000)
    end
end)



