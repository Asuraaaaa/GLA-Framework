-- restart tidepod_essentials

RegisterServerEvent("carshop:buy")
AddEventHandler("carshop:buy",function(title,car,data)
    local sourcePlayer = tonumber(source)
    local vt = nil
    for i = 1, #cars do
        if cars[i].title == title then
            vt = cars[i].vehicles
            break
        end
    end
    if vt ~= nil then
        local correctprice = nil
        for i = 1, #vt do
            if vt[i].name == car.name then
                correctprice = vt[i].price
                break
            end
        end
        if correctprice ~= nil then
            if car.price == correctprice then
                TriggerEvent('f:getPlayer', source, function(user)
                    if (tonumber(user.getMoney()) >= tonumber(car.price)) then
                        user.addCar(data)
                        user.removeMoney(correctprice)
                        TriggerClientEvent("carshop:bought", sourcePlayer, data)
                    else
                        TriggerClientEvent("pNotify:SendNotification", sourcePlayer, {text = "Not enough money !",type = "error",queue = "left",timeout = 2500,layout = "bottomCenter"})
                    end
                end)
            else
                BanCheater("[ANTI-CHEAT] Cheatengine usage (Modifying Values)",sourcePlayer)
            end
        else
            TriggerEvent("f:log", "errors", "[ERROR - VEHICLESHOP]::Vehicle price is NIL!")
            print("Vehicle price is nil...")
        end
    else
        TriggerEvent("f:log", "errors", "[ERROR - VEHICLESHOP]::Vehicle table is NIL!")
        print("Vehicle table is nil...")
    end
end)

cars = {
    {title = "SUVs", vehicles = {
        {name="Chevrolet Suburban", price=18550},
        {name="2017 Bentley Bentayga Lumma", price=106550},
        {name="Mercedes g65 AMG", price=98265},
        {name="Mercedes gl63", price=87950},
        {name="Hummer H1", price=43520},
        {name="Jeep Rubicon", price=26590},
        {name="Hyundai SanteFe", price=46750},
        {name="Jeep SRT", price=62350},
        {name="Tesla Model X", price=138560},
        {name="Chevrolet Trailblazer", price=17560},
        {name="Nissan Patrol Nismo", price=85690},
        --[[{name="2007 Toyota Camry V6", price=18500, model=GetHashKey("camry")},
        {name="2017 Honda Accord V6", price=22455, model=GetHashKey("accord")},
        {name="2017 Subaru BRZ t-S", price=25495, model=GetHashKey("brz")},
        {name="2014 Lexus LX570", price=82630, model=GetHashKey("lx570")},
        {name="2015 Lexus GS350F", price=36440, model=GetHashKey("gs350")},
        {name="2002 Honda NSX", price=89000, model=GetHashKey("nsx")},
        {name="2015 Mitsubishi Evo X", price=31940, model=GetHashKey("evo10")},
        {name="2006 Mitsubishi Evo IX", price=32024, model=GetHashKey("evo9")},
        --{name="2004 Subaru WRX STi", price=250000, model=GetHashkey("subwrx")},
        {name="2006 Subaru WRX STi", price=33620, model=GetHashKey("sti05")},
        {name="2004 Nissan GT-R R34", price=61985, model=GetHashKey("skyline")},
        {name="1998 Toyota Supra", price=40508, model=GetHashKey("supra")},
        {name="2015 Nissan GTR R35", price=103000, model=GetHashKey("gtr")},]]
    }},
    {title = "Muscle Cars", vehicles = {
        {name="Chevelle SS", price=19550},
        {name="Dodge Challenger SRT", price=83650},
        {name="Ford Mustang GT", price=48950},
        --[[{name="1995 BMW M3 E36T", price=80000, model=GetHashKey("e36t")},
        {name="1995 BMW M5 E34", price=130000, model=GetHashKey("m5e34")},
        {name="1990 MB 600SEL", price=150000, model=GetHashKey("sel600")},
        --{name="1999 BMW 750iL E38", price=89000, model=GetHashKey("750il")},
        {name="2016 VW Golf GTI", price=24995, model=GetHashKey("mk7")},
        {name="2006 VW Beetle Turbo", price=62659, model=GetHashKey("beetle")},
        {name="2016 Mini CooperWorks", price=20700, model=GetHashKey("cooperworks")},
        {name="2001 Audi S4", price=52250, model=GetHashKey("b5s4")},
        {name="2002 MB C32 AMG", price=71121, model=GetHashKey("benzc32")},
        {name="2003 BMW M5 E39", price=73874, model=GetHashKey("m5")},
        {name="2012 Range Rover SC", price=43009, model=GetHashKey("rover")},
        {name="2013 Audi RS4 Avant", price=78540, model=GetHashKey("rs4")},]]
    }}, 
    {title = "Super Cars", vehicles = {
        {name="Bugatti Chiron", price=1250000},
        {name="Lamborghini Asterion", price=256950},
        {name="Lamborghini Aventador", price=2965089},
        {name="Lamborghini Huracan", price=248550},
        {name="Lamborghini LP770", price=368500},
        {name="Ferrari GTO", price=112560},
        {name="Ferrari 812", price=165230},
        {name="Aston Martin DB11", price=150000},
        --[[{name="15 Range Rover Vouge", price=130000, model=GetHashKey("vogue")},
        --{name="2012 Audi Q7 V12", price=160000, model=GetHashKey("q7")},
        {name="1982 Porsche 911 Turbo", price=112000, model=GetHashKey("turbo33")},
        --{name="2009 Audi RS6 Avant", price=200000, model=GetHashKey("rs6om")},
        {name="2013 Audi S8 FSI", price=46895, model=GetHashKey("s8")},
        {name="2012 MB C63 AMG", price=63900, model=GetHashKey("c63")},
        {name="2016 Maserati GhibliS", price=70600, model=GetHashKey("ghibli")},
        {name="13 AM Vanquish", price=298450, model=GetHashKey("amv12")},
        {name="16 Porsche 911 TurboS", price=182210, model=GetHashKey("911turbos")},
        {name="2017 BMW M4 GTS", price=137850, model=GetHashKey("rmodm4gts")},
        {name="2013 Lambo LP570-4", price=173341, model=GetHashKey("gallardo")},        
        {name="16 Audi R8 V10", price=82450, model=GetHashKey("r8ppi")},
        {name="2015 Ferrari 488GTB", price=142785, model=GetHashKey("488gtb")},
        {name="2010 Lambo LP650-4", price=213502, model=GetHashKey("lp6504")},]]
    }},
    {title = "Sport Cars", vehicles = {
        {name="Toyota GT-86", price=26950},
        {name="Nissan 350z", price=42650},
        {name="Nissan GTR-Spec Skyline", price=56850},
        {name="BMW 750li", price=63850},
        {name="BMW E90", price=57630},
        {name="BMW I8", price=86550},
        {name="BMW M2", price=65850},
        {name="Mercedes a45", price=56450},
        {name="Mercedes cla45 sb", price=58950},
        {name="Chevrolet C7 Z06", price=84500},
        {name="Chevrolet Camaro Zl1", price=84560},
        {name="Honda Accord Mugen", price=32650},
        {name="Honda Integra", price=12350},
        {name="Dodge Charger Hellcat", price=54560},        
        {name="Subaru WRX", price=24560},
        
        --[[{name="1991 Lincoln TownCar", price=7500, model=GetHashKey("towncar")},
        {name="2003 Ford CrownVic LX", price=12500, model=GetHashKey("crownvic")},
        {name="12 Chevy Silverado LTZ", price=32650, model=GetHashKey("silverado")},
        {name="2013 Ford Explorer V6", price=28560, model=GetHashKey("explorer")},
        --{name="1968 Ford Mustang FB", price=100000, model=GetHashKey("68mustang")},
        {name="1969 Chevy Camaro SS", price=42535, model=GetHashKey("ss350")},
        {name="1970 Dodge Challenger", price=34560, model=GetHashKey("rt440")},
        {name="1970 Plymouth HemiCuda", price=28950, model=GetHashKey("cuda")},
        --{name="1970 Chevy Chevelle SS", price=110000, model=GetHashKey("chevelle1970")},
        {name="1967 Ford GT500", price=48950, model=GetHashKey("gt500")},
        {name="69 Ford Mustang BOSS302", price=120000, model=GetHashKey("boss302")},]]
    }},
    {title = "Sedans", vehicles = {
        {name="Toyota Prius", price=23650},
        {name="Toyota Camry", price=23750},
        {name="Mercedes e400", price=106250},
        {name="Mercedes e63", price=113550},
        {name="Mercedes s63", price=123550},
        {name="Mercedes s500", price=126550},
        {name="Mercedes s600", price=75650},
        {name="Mercedes w222", price=134550},
        {name="Mercedes X222", price=165450},
        {name="Tesla Model S", price=109580},
        {name="Kia Optima", price=28550}, 
        {name="Lexus gs350", price=73540},
    }},
    {title = "Trucks", vehicles = {
        {name="Ford Raptor", price=46850},
        {name="Chevrolet Silverado", price=21890},
        {name="Chevrolet Silverado LTZ 1500 2017", price=39460},
        {name="Chevrolet Silverado 1500 2010", price=29980},
    }},
    {title = "Motorcycles", vehicles = {
        {name="Yamaha R6", price=12650},
        {name="Yamaha XT660R", price=25651},
        {name="BMW S1000", price=29670},
        {name="Kawasaki Ninja ZX10R", price=19465},
        {name="Honda CB1000R", price=21684},
        {name="Ducati Multistrada", price=23651},
        {name="Harley Davidson Fatboy", price=79860},
    }},
}

function GetItemQuantity(item)
    local quantity = 0
    for i=1,#inventory do
        if inventory[i].id == tonumber(item) then
            quantity = inventory[i].q
        end
    end
    return quantity
end