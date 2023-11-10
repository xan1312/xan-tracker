local isOnJob = false

RegisterNetEvent('xan:startTracker', function()
    startTracker()
end)

startTracker = function()
    isOnJob = true

    local randomveh = getRandomCar(Config.CarsForRob)

    ESX.ShowNotification("Find for me " .. randomveh .. " and bring it to the designated placem, you have 10 minute`s ")

    local blip = AddBlipForCoord(Config.blips.x, Config.blips.y, Config.blips.z)
    SetBlipSprite(blip, Config.blips.id)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, Config.blips.colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.blips.title)
    EndTextCommandSetBlipName(blip)


    findCar(randomveh, blip)
    timer(600000)
end

getRandomCar = function(config)
    local cars = {}
    for _, car in pairs(config) do
        table.insert(cars, car)
    end
    local randomIndex = math.random(1, #cars)
    return cars[randomIndex]
end

findCar = function(car, blip)
    while isOnJob do
        Wait(1)

        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))

        local distance = GetDistanceBetweenCoords(Config.blips.x, Config.blips.y, Config.blips.z, x, y, z , true)

        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        if distance <= 10.0 and GetEntityModel(vehicle) == GetHashKey(car) then
            if IsControlJustReleased(0, 38) then
                TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                Wait(2000)
                giveBackCar()
                RemoveBlip(blip)
            end
        end
    end
end

giveBackCar = function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

    DeleteVehicle(vehicle)

    ESX.TriggerServerCallback('xan:addmoney')

    isOnJob = false 

end

timer = function(msec)
    Wait(msec)
 
    isOnJob = false

    TriggerServerEvent('xan:restart')

end 