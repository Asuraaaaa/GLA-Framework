local money = 0
local dirtymoney = 0
local RPGETNAME = 0
------------------------------------------------------------------------
RegisterServerEvent('etuldan:getFullNameFromId')
AddEventHandler("etuldan:getFullNameFromId", function(name, cb)
    local player = user.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT * from users WHERE name = @nom", {
        ['@nom'] = tostring(name)
    })
    if result and result[1] then

        RPGETNAME = (result[1].identifier == player)

    else
        print('ERROR: NO STEAMID DETECTED!')
    end
end)
------------------------------------------------------------------------
RegisterServerEvent("itexzoz:GetAppart")
AddEventHandler('itexzoz:GetAppart', function(name)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local player = user.getIdentifier()
        local name = name
        MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", { ['@nom'] = tostring(name) }, function(result)
            if (result) then
                count = 0
                for _ in pairs(result) do
                    count = count + 1
                end
                if count > 0 then
                    if (result[1].identifier == player) then
                        TriggerClientEvent('apart:isMine', source)
                    else
                        TriggerClientEvent('apart:isBuy', source)
                    end
                else
                    TriggerClientEvent('apart:isNotBuy', source)
                end
            end
        end)
    end)
end)

RegisterServerEvent("itexzoz:BuyAppart")
AddEventHandler('itexzoz:BuyAppart', function(name, price)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local player = user.getIdentifier()
        local name = name
        local price = price
        if (tonumber(user.getMoney()) >= tonumber(price)) then
            user.removeMoney(tonumber(price))
            MySQL.Async.execute("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", { ['@username'] = player, ['@name'] = name, ['@price'] = price })
            TriggerClientEvent('itexzoz:NotificationBuy', source);
            TriggerClientEvent('itexzoz:isMine', source)
        else
            TriggerClientEvent('itexzoz:NotificationNoMoney', source);
        end
    end)
end)

RegisterServerEvent("itexzoz:Vendre")
AddEventHandler('itexzoz:Vendre', function(name, price)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local player = user.getIdentifier()
        local name = name
        local price = price / 2
        user.addMoney(tonumber(price))
        MySQL.Async.execute("DELETE from user_appartement WHERE identifier = @username AND name = @name",
            { ['@username'] = player, ['@name'] = name })

        TriggerClientEvent('itexzoz:NotificationVendre', source);
        TriggerClientEvent('itexzoz:isNotBuy', source)
    end)
end)

RegisterServerEvent("itexzoz:DeposerArgentPropre")
AddEventHandler('itexzoz:DeposerArgentPropre', function(cash, apart)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local money = 0
        if (tonumber(user.getMoney()) >= tonumber(cash) and tonumber(cash) > 0) then
            MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", { ['@nom'] = apart }, function(result)
                if (result) then
                    money = result[1].money
                    user.removeMoney(tonumber(cash))
                    local newmoney = money + cash
                    MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom", { ['@cash'] = newmoney, ['@nom'] = apart }, function(data)
                    end)
                    TriggerClientEvent('itexzoz:NotificationPropreDepos', source, cash);
                end
            end)
            TriggerClientEvent('apart:getCash', source, money, dirtymoney)
        else
            TriggerClientEvent('itexzoz:NotificationErreurCoffre', source);
        end
    end)
end)

RegisterServerEvent("itexzoz:TakeArgentPropre")
AddEventHandler('itexzoz:TakeArgentPropre', function(cash, apart)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local money = 0
        MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", { ['@nom'] = apart }, function(result)
            if (result) then
                money = result[1].money
                if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
                    user.addMoney(tonumber(cash))
                    local newmoney = money - cash
                    MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom", { ['@cash'] = newmoney, ['@nom'] = apart }, function(data)
                    end)
                    TriggerClientEvent('itexzoz:NotificationPropreRetire', source, cash);
                else
                    TriggerClientEvent('itexzoz:NotificationErreurCoffre', source);
                end
            end
        end)
        TriggerClientEvent('apart:getCash', source, money, dirtymoney)
    end)
end)


-- SALE ZONE
RegisterServerEvent("itexzoz:DeposerArgentSale")
AddEventHandler('itexzoz:DeposerArgentSale', function(cash, apart)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local money = 0
        if (tonumber(user.getDirtyMoney()) >= tonumber(cash) and tonumber(cash) > 0) then
            MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", { ['@nom'] = apart }, function(result)
                if (result) then
                    money = result[1].dirtymoney
                    user.removeDirtyMoney(tonumber(cash))
                    local newmoney = money + cash
                    MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom", { ['@cash'] = newmoney, ['@nom'] = apart }, function(data)
                    end)
                    -- bien deposé
                    TriggerClientEvent('itexzoz:NotificationSaleDepos', source, cash);
                end
            end)
            TriggerClientEvent('apart:getCash', source, money, dirtymoney)
        else
            -- pas bien depose
            TriggerClientEvent('itexzoz:NotificationErreurCoffre', source);
        end
    end)
end)

RegisterServerEvent("itexzoz:TakeArgentSale")
AddEventHandler('itexzoz:TakeArgentSale', function(cash, apart)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local money = 0
        MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", { ['@nom'] = apart }, function(result)
            if (result) then
                money = result[1].dirtymoney
                if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
                    user.addDirtyMoney(tonumber(cash))
                    local newmoney = money - cash
                    MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom", { ['@cash'] = newmoney, ['@nom'] = apart }, function(data)
                    end)
                    -- Argent deposé
                    TriggerClientEvent('itexzoz:NotificationSaleRetire', source, cash);
                else
                    -- pas de tune sur sois
                    TriggerClientEvent('itexzoz:NotificationErreurCoffre', source);
                end
            end
        end)
        TriggerClientEvent('apart:getCash', source, money, dirtymoney)
    end)
end)

RegisterServerEvent("apart:getCash")
AddEventHandler('apart:getCash', function(name)
    local source = source
    TriggerEvent('f:getPlayer', source, function(user)
        local name = name
        MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
            if (result) then
                money = result[1].money
                dirtymoney = result[1].dirtymoney
                TriggerClientEvent('apart:getCash', source, money, dirtymoney)
            end
        end)
    end)
end)
--[[================================================================]]--
--[[================================================================]]--
--[[=============================DRESSING===========================]]--
--[[================================================================]]--
--[[================================================================]]--
