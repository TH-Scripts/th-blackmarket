--Blackmarket Menu
--@return content menu

function OpenMainBlackmarketMenu()

    local blackmarket = {}

    for _, v in pairs(Config.Blackmarket.Menu.Kategorier) do
        table.insert(blackmarket, {
            title = v.title,
            description = v.description,
            icon = v.icon,
            onSelect = function()
                OpenBlackmarketSubMenu(v.subMenu)
            end
        })
    end

    lib.registerContext({
        id = 'blackmarket_menu',
        title = Config.Blackmarket.Menu.title,
        options = blackmarket
    })

    return lib.showContext('blackmarket_menu')
end

--Blackmarket Sub Menu
--@param kategori
--@return content menu

function OpenBlackmarketSubMenu(kategori)

    local subMenu = {}
    
    for _, v in pairs(Config.Blackmarket.Menu.SubMenus[kategori]) do
        table.insert(subMenu, {
            title = v.title,
            description = v.description,
            icon = v.icon,
            onSelect = function()
                lib.callback('th-blackmarket:server:buyItem', false, function(Bought)
                    if Bought then
                        lib.notify({
                            title = 'Item købt',
                            description = 'Du har købt dette item',
                            duration = 5000,
                            type = 'success'
                        })
                    elseif not Bought then
                        lib.notify({
                            title = 'Du har ikke nok penge',
                            description = 'Du har ikke nok penge til at købe dette item',
                            duration = 5000,
                            type = 'error'
                        })
                    end
                end, v.item, v.price, v.count)
            end
        })
    end

    lib.registerContext({
        id = 'blackmarket_sub_menu',
        title = kategori,
        options = subMenu,
        menu = 'blackmarket_menu',
        onBack = function()
            OpenMainBlackmarketMenu()
        end
    })

    return lib.showContext('blackmarket_sub_menu')
end

