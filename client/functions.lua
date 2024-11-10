

--ENTER IPL
--@param Config.Enter.IPL
--@param self

function onEnterIPL(self)
    if Config.Ui == 'radial' then
        if not RadialIsShowing then
            lib.addRadialItem({
                id = 'ipl_exit',
                icon = 'fa-solid fa-arrow-right-to-bracket',
                label = 'Gå Ud',
                onSelect = function()
                    TeleportPlayer(Config.Enter.Entry.coords)
                end
            })
            RadialIsShowing = true
        end
    elseif Config.Ui == 'text' then
        lib.showTextUI('[E] - Gå Ud')
        CreateThread(function()
            while true do
                if IsControlJustReleased(0, 38) then
                    TeleportPlayer(Config.Enter.Entry.coords)
                end
                Wait(10)
            end
        end)
    end
end

function onExitIPL(self)
    if Config.Ui == 'radial' then
        if RadialIsShowing then
            lib.removeRadialItem('ipl_exit')
            RadialIsShowing = false
        end
    elseif Config.Ui == 'text' then
        lib.hideTextUI()
    end
end

--ENTER
--@param Config.Enter.Entry
--@param self

function onEnter(self)
    
    if Config.Ui == 'radial' then
        if not RadialIsShowing then
            lib.addRadialItem({
                id = 'open_blackmarket',
                icon = 'fa-solid fa-gun',
                label = 'Black Market',
                onSelect = function()
                    TeleportPlayer(Config.Enter.IPL.coords)
                end
            })
            RadialIsShowing = true
        end
    elseif Config.Ui == 'text' then
        lib.showTextUI('[E] - Black Market')
        CreateThread(function()
            while true do
                if IsControlJustReleased(0, 38) then
                    TeleportPlayer(Config.Enter.IPL.coords)
                end
                Wait(0)
            end
        end)
    end
end

function onExit(self)
    if Config.Ui == 'radial' then
        if RadialIsShowing then
            lib.removeRadialItem('open_blackmarket')
            RadialIsShowing = false
        end
    elseif Config.Ui == 'text' then
        lib.hideTextUI()
    end
end


-- Teleport Player
--@param coords
function TeleportPlayer(coords)
    lib.callback('th-blackmarket:CheckItem', false, function(item)
        if not item then
            return lib.notify({title = 'Mangler item', description = 'Du har ikke det korrekte item, til at gå her ind!'})
        end
    
        if not coords then
            return
        end
    
        SetEntityCoords(PlayerPedId(), coords)
    end)
end
