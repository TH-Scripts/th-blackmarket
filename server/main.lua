local ESX = exports['es_extended']:getSharedObject()

--MARK: Buy Item Server
--@param source
--@param id
--@param kategori
--@param count
--@return boolean

lib.callback.register('th-blackmarket:server:buyItem', function(source, id, kategori, count)
    local xPlayer       = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not id or not kategori then return end

    return BuyItem(source, id, kategori, count)

end)


--MARK: Check Item Server
--@param source
--@return boolean
lib.callback.register('th-blackmarket:CheckItem', function(source)
    local xPlayer       = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem(Config.item).count == 1 then
        return true
    else
        return false
    end
end)


--MARK: Buy Item Server Function
--@param source
--@param id
--@param kategori
--@param count
--@return boolean
function BuyItem(source, id, kategori, count)
    local xPlayer       = ESX.GetPlayerFromId(source)
    local xPlayerBank   = xPlayer.getAccount("bank").money
    local xPlayerMoney  = xPlayer.getAccount("money").money

    local price;
    local item;


    if not xPlayerBank or not xPlayerMoney then return end
    if not xPlayer or not id or not kategori then return end

    for _, v in pairs(Config.Blackmarket.Menu.SubMenus[kategori]) do
        if v.id == id then
            price = v.price * count
            item = v.item
        end
    end

    if not price or not item then return end

    if xPlayerMoney >= price then

        xPlayer.removeAccountMoney("money", price)

    elseif xPlayerBank >= price then

        xPlayer.removeAccountMoney("bank", price)

    else
        return false
    end

    --Add Item to User
    local addItem = exports.ox_inventory:AddItem(xPlayer.source, item, count, nil, nil)
    
    if not addItem then
        return false
    end
    
    SendDiscord('Købt item', 'Spilleren: ' .. GetPlayerName(source) .. '. Har lige købt ' .. count .. 'x ' .. item .. '. For ' .. price .. ' DKK', 5763719)

    return true

end
