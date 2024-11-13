--Blackmarket Menu
--@return content menu

function OpenMainBlackmarketMenu()

    local blackmarket = {}

    for _, v in pairs(Config.Blackmarket.Menu.Kategorier) do
        table.insert(blackmarket, {
            title = v.title,
            description = v.description,
            icon = v.icon,
            iconColor = v.iconColor,
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
            iconColor = v.iconColor,
            onSelect = function()
                local bought = BuyItemClient(v.id, kategori, v.title)

                if not bought then
                    lib.notify({
                        title = 'Købet blev annulleret',
                        description = 'Du har ikke nok penge til at købe dette item',
                        duration = 5000,
                        type = 'error'
                    })
                    return
                end

                lib.notify({
                    title = 'Item købt',
                    description = 'Du har købt dette item',
                    duration = 5000,
                    type = 'success'
                })

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



--MARK: Buy Item Client
--@param id
--@param kategori
--@param title
--@return boolean
function BuyItemClient(id, kategori, title)

    local input = lib.inputDialog('Antal', {
        {type = 'number', label = 'Antal', description = 'Antallet af ' .. title .. ' du vil købe', icon = 'hashtag', max = 50, min = 1},
    })

    if not input then return end
        
    local count = input[1]

    local server_call = lib.callback.await('th-blackmarket:server:buyItem', false, id, kategori, count)

    if not server_call then
        return false
    end

    return true

end