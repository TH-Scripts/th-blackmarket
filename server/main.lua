local ESX = exports['es_extended']:getSharedObject()


lib.callback.register('th-blackmarket:server:buyItem', function(source, item, price, count)
    local xPlayer       = ESX.GetPlayerFromId(source)


    if not item or not price or not count then return end
    if not xPlayer then return end

    return BuyItem(source, item, price, count)

end)

lib.callback.register('th-blackmarket:CheckItem', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem(Config.item).count == 1 then
        return true
    else
        return false
    end
end)


function BuyItem(source, item, price, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerBank   = xPlayer.getAccount("bank").money
    local xPlayerMoney  = xPlayer.getAccount("money").money


    if not item or not price or not count then return end
    if not xPlayerBank or not xPlayerMoney then return end
    if not xPlayer then return end

    if xPlayerMoney >= price then
        -- Remove Money from User
        xPlayer.removeAccountMoney("money", price)
    elseif xPlayerBank >= price then
        -- Remove Account Money from User
        xPlayer.removeAccountMoney("bank", price)
    else
        return false
    end

    --Add Item to User
    local addItem = exports.ox_inventory:AddItem(xPlayer.source, item, 1, nil, nil)
    
    return true

end
