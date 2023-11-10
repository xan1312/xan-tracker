Config = {}

Config.PayForTracker = 1250

Config.locales = {
    ServerSideNotify = {
       N1 = "Someone is doing tracker right now",
       N2 = "You don`t have money to get tracker job",
    --    N3 = "You recived "..Config.RecivedMoney.."$"
    },
}

Config.blips = {title="Tracker garage", colour=47, id=326, x = 1204.39, y = -3115.59, z = 5.53}

Config.RecivedMoney = math.random(2000,5000)

Config.CarsForRob = { 
    Car1 = "habanero",
    Car2 = "gauntlet",
    Car3 = "infernus",
    Car4 = "rapidgt",
    Car5 = "rocoto"
}