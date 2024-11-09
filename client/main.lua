-- Local Variables
local spawnped = false


-- NPC Spawn
--@param Config.NPC.model
--@param Config.NPC.coords

Citizen.CreateThread(function()
    while true do
        if spawnped == false then
            spawnped = true
            RequestModel(GetHashKey(Config.NPC.model))
            while not HasModelLoaded(GetHashKey(Config.NPC.model)) do
                Wait(1)
            end

            ped1 = CreatePed(4, GetHashKey(Config.NPC.model), Config.NPC.coords, false, true) -- ændrer disse koordinater
            FreezeEntityPosition(ped1, true)
            SetEntityInvincible(ped1, true)
            SetBlockingOfNonTemporaryEvents(ped1, true)
        end
        Citizen.Wait(10000)
    end
end)  


--OX Target
--@param Config.Target.coords

exports.ox_target:addSphereZone({
    coords = Config.Target.coords,
    radius = 1,
    debug = drawZones,
    options = {
        {
            icon = 'fa-solid fa-book',
            label = 'Snak med Jens',
            onSelect = function()
                lib.showContext('liste')
            end
        }
    }
})