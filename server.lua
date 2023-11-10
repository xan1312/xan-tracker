local isTracker = false 

RegisterServerEvent('xan:startTrackerJob', function()
 
    local xPlayer = ESX.GetPlayerFromId(source)

    if isTracker then 
        xPlayer.showNotification(Config.locales.ServerSideNotify.N1)
    else
        CreateTracker(source)
    end
end)

CreateTracker = function(id)
    local xPlayer = ESX.GetPlayerFromId(id)

    local money = xPlayer.getMoney()

    if money >= Config.PayForTracker then 
        xPlayer.triggerEvent('xan:startTracker')
        xPlayer.removeAccountMoney("money", Config.PayForTracker)
        isTracker = true 
    else
        xPlayer.showNotification(Config.locales.ServerSideNotify.N2)
    end 

end

ESX.RegisterServerCallback('xan:addmoney', function(PlayerId)
   local xPlayer = ESX.GetPlayerFromId(PlayerId)

   xPlayer.addMoney(Config.RecivedMoney)

    isTracker = false 

   xPlayer.showNotification("You recived "..Config.RecivedMoney.."$")

end)

RegisterServerEvent('xan:restart', function ()
    isTracker = false 
end)