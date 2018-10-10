--==============================================================================================================================--
--                                                           Variables                                                          --
--==============================================================================================================================--
user_vehicles = {}                                                                                                             --
user_garages = {}                                                                                                              --
out = {}                                                                                                                        --
local replacementgarage = {x=0.0,y=0.0,z=0.0,heading=0.0}
local currentgaragecost = nil                                                                                                   --
local slotprice = 10000                                                                                                         --
local garageposition = 1                                                                                                        --                                                                                               
local vehiclebool = false                                                                                                       --
local insurancebool = false                                                                                                     --
garage_menu = false                                                                                                             --
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                         Configuration                                                        --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
insurance = {
        {name="Chevrolet Suburban", cost=1200},
        {name="2017 Bentley Bentayga Lumma", cost=15000},
        {name="Mercedes g65 AMG", cost=15000},
        {name="Mercedes gl63", cost=15000},
        {name="Hummer H1", cost=2500},
        {name="Jeep Rubicon", cost=5000},
        {name="Hyundai SanteFe", cost=5000},
        {name="Jeep SRT", cost=7500},
        {name="Tesla Model X", cost=15000},
        {name="Chevrolet Trailblazer", cost=1200},
        {name="Nissan Patrol Nismo", cost=7500},
        {name="Chevelle SS", cost=1200},
        {name="Dodge Challenger SRT", cost=10000},
        {name="Ford Mustang GT", cost=5000},
        {name="Bugatti Chiron", cost=20000},
        {name="Lamborghini Asterion", cost=15000},
        {name="Lamborghini Aventador", cost=15000},
        {name="Lamborghini Huracan", cost=15000},
        {name="Lamborghini LP770", cost=15000},
        {name="Ferrari GTO", cost=15000},
        {name="Ferrari 812", cost=15000},
        {name="Aston Martin DB11", cost=7500},
        {name="Toyota GT-86", cost=5000},
        {name="Nissan 350z", cost=5000},
        {name="Nissan GTR-Spec Skyline", cost=5000},
        {name="BMW 750li", cost=8500},
        {name="BMW E90", cost=7500},
        {name="BMW I8", cost=12000},
        {name="BMW M2", cost=9500},
        {name="Mercedes a45", cost=7500},
        {name="Mercedes cla45 sb", cost=7500},
        {name="Chevrolet C7 Z06", cost=10000},
        {name="Chevrolet Camaro Zl1", cost=7500},
        {name="Honda Accord Mugen", cost=1500},
        {name="Honda Integra", cost=1200},      
        {name="Subaru WRX", cost=2000},
        {name="Toyota Prius", cost=1500},
        {name="Toyota Camry", cost=1500},
        {name="Mercedes e400", cost=15000},
        {name="Mercedes e63", cost=15000},
        {name="Mercedes s63", cost=15000},
        {name="Mercedes s500", cost=15000},
        {name="Mercedes s600", cost=15000},
        {name="Mercedes w222", cost=15000},
        {name="Mercedes X222", cost=15000},
        {name="Tesla Model S", cost=15000},
        {name="Kia Optima", cost=5000}, 
        {name="Lexus gs350", cost=12000},
        {name="Ford Raptor", cost=7500},
        {name="Chevrolet Silverado", cost=1500},
        {name="Yamaha R6", cost=1200},
        {name="Chevrolet Silverado LTZ 1500 2017", cost=4500},
        {name="Chevrolet Silverado 1500 2010", cost=2500},
        {name="Yamaha R6", cost=1200},
        {name="Yamaha XT660R", cost=2500},
        {name="BMW S1000", cost=2900},
        {name="Kawasaki Ninja ZX10R", cost=1900},
        {name="Honda CB1000R", cost=2100},
        {name="Ducati Multistrada", cost=2300},
        {name="Harley Davidson Fatboy", cost=7900},
}

claimspots = {
    {x=-224.0087890625,y=-1162.2670898438,z=23.012767791748},
    {x=-224.0087890625,y=-1162.2670898438,z=23.012767791748},
    {x=-224.0087890625,y=-1162.2670898438,z=23.012767791748},
    {x=-224.0087890625,y=-1162.2670898438,z=23.012767791748},
    {x=-224.0087890625,y=-1162.2670898438,z=23.012767791748},
}

emplacement_garage = {
    {name="Public Garage", colour=3, scale=0.8, sprite=357, x=214.14,y=-793.316,z=30.8491,id=1,gname="Park [1]",cost=0,heading=0.0,maxslots=5}, -- Public Park
    {name="Public Garage", colour=3, sprite=357, x=1700.06,y=4945.05,z=42.3114,id=2,gname="Hospital [2]",cost=0,heading=0.0,maxslots=5}, -- Public Hospital
    {name="Public Garage", colour=3, sprite=357, x=1232.4792480469,y=2708.3212890625,z=38.3,id=3,gname="Sandy [3]",cost=0,heading=0.0,maxslots=5}, -- Public Sandy
    {name="Public Garage", colour=3, sprite=357, x=117.96788024902,y=6599.45703125,z=32.3,id=4,gname="Paleto [4]",cost=0,heading=-90.0,maxslots=5}, -- Public Paleto
    {name="Private Garage", colour=2, sprite=357, x=-285.326,y=-760.035,z=33.9675,id=5,gname="Industrial [5]",cost=1000,heading=-95.0,maxslots=10}, -- Personal
    {name="Private Garage", colour=2, sprite=357, x=-1994.34,y=-322.084,z=48.1063,id=6,gname="Apartment Complex [6]",cost=3000,heading=-110.0,maxslots=6}, -- Personal
    {name="Private Garage", colour=2, sprite=357, x=489.812,y=-74.141,z=77.6377,id=7,gname="Hills [7]",cost=5000,heading=-45.0,maxslots=12}, -- Personal
    {name="Private Garage", colour=2, sprite=357, x=258.68347167969,y=2589.7287597656,z=45.2,id=8,gname="Autoshop Garage [8]",cost=100000,heading=10.0,maxslots=8}, -- Personal
    {name="Private Garage", colour=2, sprite=357, x=-226.0922088623,y=6436.400390625,z=31.4,id=9,gname="Residential [9]",cost=50000,heading=225.0,maxslots=4}, -- Personal
    ---{name="Private Garage", colour=2, sprite=357, x=-833.24926757813,y=-392.95385742188,z=31.7,id=10,gname="Weazel [10]",cost=150000,heading=225.0,maxslots=12}, -- Personal
    ---{name="Private Garage", colour=2, sprite=357, x=-30.303638458252,y=2.1268248558044,z=71.5,id=11,gname="Small Garage [11]",cost=50000,heading=150.0,maxslots=4}, -- Personal
    ---{name="Private Garage", colour=2, sprite=357, x=-84.019691467285,y=-820.99694824219,z=36.4,id=12,gname="Maze Tower [12]",cost=250000,heading=-365.0,maxslots=32}, -- Personal
}

emplacement_insurance = {
    {name="Buy Insurance", colour=69, sprite=498, x=-32.958335876465,y=-1111.619140625,z=26.7},
}

emplacement_selling = {
    {name="Sell vehicles", colour=6, sprite=225, x=-44.919033050537,y=-1082.6441650391,z=26.9},
}

emplacement_claim = {    
    {name="Claim Insurance", colour=50, sprite=171, x=-202.05020141602,y=-1158.6384277344,z=23.813545227051},
}

emplacement_garage_options = {    
    {name="Modify garages", colour=3, sprite=78, x=-55.156490325928,y=-1089.9210205078,z=26.5},
}
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                            Events                                                            --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
RegisterNetEvent("garage:updateVehicles")
AddEventHandler("garage:updateVehicles", function(data, gdata)
    user_vehicles = data
    user_garages = gdata
end)

RegisterNetEvent("garage:insurance")
AddEventHandler("garage:insurance",function()
    garage_menu = false
end)

RegisterNetEvent("garage:buy")
AddEventHandler("garage:buy",function()
    garage_menu = false
end)

RegisterNetEvent("garage:transfer")
AddEventHandler("garage:transfer",function()
    garage_menu = false
end)
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                          Open Menus                                                          --
--                                                          Draw Blips                                                          --
--                                                         Draw Markers                                                         --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
local incircle = false
Citizen.CreateThread(function()
    for _, item in pairs(emplacement_garage) do
        addBlip(item)
    end
    for _, item in pairs(emplacement_insurance) do
        addBlip(item)
    end
    for _, item in pairs(emplacement_selling) do
        addBlip(item)
    end
    for _, item in pairs(emplacement_claim) do
        addBlip(item)
    end
    for _, item in pairs(emplacement_garage_options) do
        addBlip(item)
    end
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        for k,v in ipairs(emplacement_garage) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(27, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 3.5001, 3.5001, 0.5001, 177, 0, 0,255, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 3.5)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to open the garage!")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) and IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                        GUI.maxVisOptions = 10; titleTextSize = {0.85, 0.65}; titleRectSize = {0.16, 0.085}; optionTextSize = {0.5, 0.5}; optionRectSize = {0.16, 0.035}; menuX = 0.75; menuXOption = 0.075; menuXOtherOption = 0.055; menuYModify = 0.3000; menuYOptionDiv = 8.56; menuYOptionAdd = 0.36
                        currentgarage = emplacement_garage[k]
                        garageposition = 1
                        garage_menu = not garage_menu
                        garage() -- Menu to draw
                    end
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 3.5)then
                    incircle = false
                    garage_menu = false
                end
            end
        end
        for k,v in ipairs(emplacement_insurance) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(27, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.7555, 1555, 90, 10,150, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to buy an insurance!")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) and IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    GUI.maxVisOptions = 20; titleTextSize = {0.85, 0.80}; titleRectSize = {0.23, 0.085}; optionTextSize = {0.5, 0.5}; optionRectSize = {0.23, 0.035}; menuX = 0.745; menuXOption = 0.11; menuXOtherOption = 0.06; menuYModify = 0.1500; menuYOptionDiv = 4.285; menuYOptionAdd = 0.21;
                        garage_menu = not garage_menu
                        insuranceMenu() -- Menu to draw
                    end
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 1.0)then
                    incircle = false
                    garage_menu = false
                end
            end
        end
        for k,v in ipairs(emplacement_claim) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(27, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.7555, 1555, 90, 10,150, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to claim insurance!")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) and IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then -- INPUT_CELLPHONE_DOWN
                    GUI.maxVisOptions = 10; titleTextSize = {0.85, 0.65}; titleRectSize = {0.16, 0.085}; optionTextSize = {0.5, 0.5}; optionRectSize = {0.16, 0.035}; menuX = 0.75; menuXOption = 0.075; menuXOtherOption = 0.055; menuYModify = 0.3000; menuYOptionDiv = 8.56; menuYOptionAdd = 0.36
                        garage_menu = not garage_menu
                        claimMenu()
                    end
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 1.0)then
                    incircle = false
                    garage_menu = false
                end
            end
        end
        for k,v in ipairs(emplacement_garage_options) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(27, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 3.5001, 3.5001, 0.7555, 1555, 90, 10,150, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 3.0)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to modify your garages!")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) and IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then -- INPUT_CELLPHONE_DOWN
                    GUI.maxVisOptions = 20; titleTextSize = {0.85, 0.80}; titleRectSize = {0.23, 0.085}; optionTextSize = {0.5, 0.5}; optionRectSize = {0.23, 0.035}; menuX = 0.745; menuXOption = 0.11; menuXOtherOption = 0.06; menuYModify = 0.1500; menuYOptionDiv = 4.285; menuYOptionAdd = 0.21;
                        garage_menu = not garage_menu
                        GarageOptions()
                    end
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 3.0)then
                    incircle = false
                    garage_menu = false
                end
            end
        end
        for k,v in ipairs(emplacement_selling) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(27, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 3.5001, 3.5001, 0.5001, 177, 0, 0,255, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 3.0)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to sell your car!")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) and IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then -- INPUT_CELLPHONE_DOWN
                        currentgarage = emplacement_selling[k]
                        local veh = GetClosestVehicle(currentgarage.x, currentgarage.y, currentgarage.z, 3.000, 0, 70)
                        if DoesEntityExist(veh) then
                            local stored = false
                            local plate = GetVehicleNumberPlateText(veh)
                            for i = 1, #user_vehicles do
                                if tostring(plate) == tostring(user_vehicles[i].p) or veh == tonumber(user_vehicles[i].instance) then
                                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
                                    stored = true
                                    TriggerServerEvent("garage:sell", user_vehicles[i].p, user_vehicles[i].c)
                                end
                            end
                            if not stored then
                                exports.pNotify:SendNotification({text = "This is not your vehicle!", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                            end
                        else
                            exports.pNotify:SendNotification({text = "You're NOT a motor vehicle!", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                        end
                    end
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 3.0)then
                    incircle = false
                end
            end
        end
    end
end)

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                          Garage Menu                                                         --
--                                                      Buy/Store/Retrieve                                                      --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function garage()
    local t = true
    for i = 1, #user_garages do
        if user_garages[i].id == currentgarage.id then
            t = false
        end
    end
    if t then
        currentgaragecost = currentgarage.cost
        menuXOtherOption = 0.027
        Menu.SetupMenu("buy_menu","Buy Garage")
        Menu.Switch(nil,"buy_menu")
        Menu.addOption("buy_menu", function()
            if(Menu.GarageBool(currentgarage.gname, vehiclebool, "~g~$~w~"..currentgaragecost,"~g~$~w~"..currentgaragecost,function(cb)   vehiclebool = cb end))then
                TriggerServerEvent("garage:buy", currentgaragecost, currentgarage.id, garageposition)
            end
        end)
        Menu.addOption("buy_menu", function()
            local slots = {}
            for i = 1, currentgarage.maxslots do
                table.insert(slots, ""..i)
            end
            if(Menu.GarageArray("Slots:", slots, garageposition,function(cb) garageposition = cb end)) then
                currentgaragecost = currentgarage.cost + slotprice * (garageposition - 1)         
            end         
        end)
    else
        menuXOtherOption = 0.055
        Menu.SetupMenu("garage_menu","Garage")
        Menu.Switch(nil,"garage_menu")
        Menu.addOption("garage_menu", function()
            if(Menu.Option("Retrieve a vehicle"))then
                GetVehicles()
            end
        end)
        Menu.addOption("garage_menu", function()
            if(Menu.Option("Store a vehicle"))then
                StoreVehicle()
            end
        end)
    end
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                          Garage Menu                                                         --
--                                                           Retrieve                                                           --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function getCarQ()
    local count = 0
    for i=1,#user_vehicles do
        if user_vehicles[i].cg == currentgarage.id then
            count = count + 1
        end
    end
    return count
end

function getGarageQ()
    for i=1,#user_garages do
        if user_garages[i].id == currentgarage.id then
            return user_garages[i].count
        end
    end
    return "lmao"
end

function GetVehicles()
    Menu.SetupMenu("vehicle_list","Cars: " .. getCarQ() .. "/" .. getGarageQ())
    Menu.Switch("garage_menu","vehicle_list")
    for i = 1,#user_vehicles do
        if (user_vehicles[i] ~= nil) then
            if user_vehicles[i].cg == currentgarage.id then
                Menu.addOption("vehicle_list", function()
                    if(Menu.Bool(tostring(user_vehicles[i].n), vehiclebool, tostring(user_vehicles[i].s),tostring(user_vehicles[i].s),function(cb)   vehiclebool = cb end))then
                        if user_vehicles[i].s ~= "~r~Missing" and user_vehicles[i].s ~= "~r~Impounded" then
                            garage_menu = false
                            SpawnVehicle(user_vehicles[i])
                        else
                            exports.pNotify:SendNotification({text = "This vehicle is not in the garage", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
                        end
                    end
                end)
            end
        end
    end
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                        Insurance Menu                                                        --
--                                                        Buy Insurance                                                         --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function insuranceMenu()
    Menu.SetupMenu("insurance_menu","Insurance")
    Menu.Switch(nil,"insurance_menu")
    for i = 1,#user_vehicles do
        if (user_vehicles[i] ~= nil) then
            local cn = tostring(user_vehicles[i].n)
            local cost = getInsuranceCost(cn)
            if user_vehicles[i].ins == "false" or user_vehicles[i].ins == 0 or user_vehicles[i].ins == "0" then
                Menu.addOption("insurance_menu", function()
                    if(Menu.CarBool(tostring(user_vehicles[i].n), insurancebool, "~g~$~w~"..cost,"~g~$~w~"..cost,function(cb)   insurancebool = cb end))then
                        TriggerServerEvent("garage:insurance", user_vehicles[i].p, cost)
                    end
                end)
            elseif user_vehicles[i].ins == "true" then
                Menu.addOption("insurance_menu", function()
                    if(Menu.CarBool(tostring(user_vehicles[i].n), insurancebool, "~g~Insured","~g~Insured",function(cb)   insurancebool = cb end))then
                    end
                end)
            else
                Citizen.Trace("This is an error: "..user_vehicles[i].ins.." report it to an admin!")
            end
        end
    end
end

function getInsuranceCost(car)
    for i = 1, #insurance do
        if car == insurance[i].name then
            return insurance[i].cost
        end
    end
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                          Claim Menu                                                          --
--                                               Get your car back if its insured                                               --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function claimMenu()
    Menu.SetupMenu("claim_menu","Insurance Claims")
    Menu.Switch(nil,"claim_menu")
    for i = 1,#user_vehicles do
        if (user_vehicles[i] ~= nil) then
            if user_vehicles[i].ins == "true" and user_vehicles[i].s == "~r~Missing" and user_vehicles[i].s ~= "~r~Impounded" then

                Menu.addOption("claim_menu", function()
                    if(Menu.Bool(tostring(user_vehicles[i].n), vehiclebool, "~g~Claim", "~g~Claim",function(cb)   vehiclebool = cb end))then
                        local instance = user_vehicles[i].instance
                        Citizen.Trace("CURRENT instance == "..instance)
                        local count = math.random(1,5)
                        for b = 1, #claimspots do
                            if b == count then
                                replacementgarage.x = claimspots[count].x
                                replacementgarage.y = claimspots[count].y
                                replacementgarage.z = claimspots[count].z
                                replacementgarage.heading = 0.0
                            end
                        end
                        local isAreaCrowded = GetClosestVehicle(replacementgarage.x, replacementgarage.y, replacementgarage.z, 3.000, 0, 70)
                        if DoesEntityExist(isAreaCrowded) then
                            exports.pNotify:SendNotification({text = "Try again, the spawn location is occupied!", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
                        else
                            for a = 1, #out do
                                if out[a] == instance then
                                    table.remove(out, a)
                                    SpawnReplacement(user_vehicles[i])
                                    while DoesEntityExist(instance) do
                                        local pos = GetEntityCoords(GetPlayerPed(-1), true)
                                        SetEntityCoords(instance, pos.x, pos.y, pos.z-2.0)
                                        SetEntityAsMissionEntity(instance, true, true)
                                        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(tonumber(instance)))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                          Modify Menu                                                         --
--                                                       Buy more storage                                                       --
--                                                        Transfer Cars                                                         --
--                                                         Sell garages                                                         --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function GarageOptions()
    Menu.SetupMenu("garage_options_menu","Modify Garages")
    Menu.Switch(nil,"garage_options_menu")
    for i = 1,#user_garages do
        if (user_garages[i] ~= nil) then
            Menu.addOption("garage_options_menu", function()
                local a = user_garages[i].id
                if(Menu.Option(emplacement_garage[a].gname))then
                    subGarageOptions(user_garages[i])
                end
            end)
        end
    end
end

function subGarageOptions(garage)
    local currentgaragecost = 10000
    Menu.SetupMenu("subgarage_options_menu",emplacement_garage[garage.id].gname)
    Menu.Switch("garage_options_menu","subgarage_options_menu")
    currentOption = 0
    Menu.addOption("subgarage_options_menu", function()
        if(Menu.Option("Transfer a car to this garage"))then
            transferVehicle(garage)
        end
    end)
    if garage.id > 4 then
        Menu.addOption("subgarage_options_menu", function()
            if(Menu.Option("Sell garage"))then
                TriggerServerEvent("garage:sellg", garage.id)
            end
        end)
    end
    if garage.count ~= emplacement_garage[garage.id].maxslots then
        Menu.addOption("subgarage_options_menu", function()
            if(Menu.GarageBool("Upgrade storage", vehiclebool, "~g~$~w~"..currentgaragecost,"~g~$~w~"..currentgaragecost,function(cb)   vehiclebool = cb end))then
                TriggerServerEvent("garage:buyslots", currentgaragecost, garage.id, (garageposition + garage.count))
            end
        end)
        Menu.addOption("subgarage_options_menu", function()
            local slots = {}
            for a = (garage.count + 1), emplacement_garage[garage.id].maxslots do
                table.insert(slots, ""..a)
            end
            if(Menu.GarageArray("Increase slots from "..garage.count.." to:", slots, garageposition,function(cb) garageposition = cb end)) then
                currentgaragecost = slotprice * garageposition       
            end         
        end)
    end
end

function transferVehicle(garage)
    Menu.SetupMenu("vehicletransfer_menu",emplacement_garage[garage.id].gname)
    Menu.Switch("subgarage_options_menu","vehicletransfer_menu")
    for i = 1, #user_vehicles do
        Menu.addOption("vehicletransfer_menu", function()
            if(Menu.TransferBool(user_vehicles[i].n, vehiclebool, emplacement_garage[user_vehicles[i].cg].gname,emplacement_garage[user_vehicles[i].cg].gname,function(cb)   vehiclebool = cb end))then
                local count = 0
                for a = 1,#user_vehicles do
                    if user_vehicles[a].cg == garage.id then
                        count = count + 1
                    end
                end
                local actualslots = garage.count
                if count <= actualslots and user_vehicles[i].cg == garage.id then
                    exports.pNotify:SendNotification({text = "You cannot transfer a vehicle to the same garage", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
                elseif count < actualslots and user_vehicles[i].cg ~= garage.id then
                    if user_vehicles[i].s == "~g~Stored" then
                        TriggerServerEvent("garage:transfer", user_vehicles[i].p, garage.id)
                    else
                        exports.pNotify:SendNotification({text = "Your car must be stored to transfer it!", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
                    end
                else
                    exports.pNotify:SendNotification({text = "This garage is full!", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
                end
            end
        end)       
    end
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                       Garage Functions                                                       --
--                                                        Store/Retrieve                                                        --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
function StoreVehicle()
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        local veh = GetClosestVehicle(currentgarage.x, currentgarage.y, currentgarage.z, 3.000, 0, 70)
        if DoesEntityExist(veh) then
            for i = 1, #out do
                if out[i] == veh then
                    table.remove(out, i)
                end
            end
            SetEntityAsMissionEntity(veh, true, true)
            local turbo
            local tiresmoke
            local xenon
            local neon0
            local neon1
            local neon2
            local neon3
            local bulletproof
            local variation
            local plate = GetVehicleNumberPlateText(veh)
            local colors = table.pack(GetVehicleColours(veh))
            local extra_colors = table.pack(GetVehicleExtraColours(veh))
            local neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
            local smokecolor = table.pack(GetVehicleTyreSmokeColor(veh))
            if IsToggleModOn(veh,18) then
                turbo = "on"
            else
                turbo = "off"
            end
            if IsToggleModOn(veh,20) then
                tiresmoke = "on"
            else
                tiresmoke = "off"
            end
            if IsToggleModOn(veh,22) then
                xenon = "on"
            else
                xenon = "off"
            end
            if IsVehicleNeonLightEnabled(veh,0) then
                neon0 = "on"
            else
                neon0 = "off"
            end
            if IsVehicleNeonLightEnabled(veh,1) then
                neon1 = "on"
            else
                neon1 = "off"
            end
            if IsVehicleNeonLightEnabled(veh,2) then
                neon2 = "on"
            else
                neon2 = "off"
            end
            if IsVehicleNeonLightEnabled(veh,3) then
                neon3 = "on"
            else
                neon3 = "off"
            end
            if GetVehicleTyresCanBurst(veh) then
                bulletproof = "off"
            else
                bulletproof = "on"
            end
            if GetVehicleModVariation(veh,23) then
                variation = "on"
            else
                variation = "off"
            end
            local stored = false
            for i = 1, #user_vehicles do
                if tostring(plate) == tostring(user_vehicles[i].p) then
                    local count = 0
                    for a = 1,#user_vehicles do
                        if user_vehicles[a].cg == currentgarage.id then
                            count = count + 1
                        end
                    end
                    local actualslots
                    for b = 1,#user_garages do
                        if user_garages[b].id == currentgarage.id then
                            actualslots = user_garages[b].count
                        end
                    end
                    if count <= actualslots and user_vehicles[i].cg == currentgarage.id then
                        local data = {
                            n="no", -- Name
                            m=GetEntityModel(veh), -- Model
                            instance=veh, -- Current vehicle instance
                            cg=currentgarage.id,
                            p=GetVehicleNumberPlateText(veh), -- Plate
                            s="~g~Stored", -- State
                            cp=colors[1], -- Colour Primary
                            cs=colors[2], -- Colour Secondary
                            pc=extra_colors[1], -- Pearlescent Colour
                            wc=extra_colors[2], -- Wheel Colour
                            pi=GetVehicleNumberPlateTextIndex(veh), -- Colour of license plate
                            nc={neoncolor[1],neoncolor[2],neoncolor[3]}, -- Neon Colours
                            wt=GetVehicleWindowTint(veh), -- Window Tint
                            wht=GetVehicleWheelType(veh), -- Wheel type
                            m0=GetVehicleMod(veh, 0), -- Vehicle Mod 0
                            m1=GetVehicleMod(veh, 1), -- Vehicle Mod 1
                            m2=GetVehicleMod(veh, 2), -- Vehicle Mod 2
                            m3=GetVehicleMod(veh, 3), -- Vehicle Mod 3
                            m4=GetVehicleMod(veh, 4), -- Vehicle Mod 4
                            m5=GetVehicleMod(veh, 5), -- Vehicle Mod 5
                            m6=GetVehicleMod(veh, 6), -- Vehicle Mod 6
                            m7=GetVehicleMod(veh, 7), -- Vehicle Mod 7
                            m8=GetVehicleMod(veh, 8), -- Vehicle Mod 8
                            m9=GetVehicleMod(veh, 9), -- Vehicle Mod 9
                            m10=GetVehicleMod(veh, 10), -- Vehicle Mod 10
                            m11=GetVehicleMod(veh, 11), -- Vehicle Mod 11
                            m12=GetVehicleMod(veh, 12), -- Vehicle Mod 12
                            m13=GetVehicleMod(veh, 13), -- Vehicle Mod 13
                            m14=GetVehicleMod(veh, 14), -- Vehicle Mod 14
                            m15=GetVehicleMod(veh, 15), -- Vehicle Mod 15
                            m16=GetVehicleMod(veh, 16), -- Vehicle Mod 16
                            t=turbo, -- Turbo
                            xl=xenon, -- Xenon Lights
                            ts=tiresmoke, -- Tyre Smoke
                            m23=GetVehicleMod(veh, 23), -- Vehicle Mod 23
                            m24=GetVehicleMod(veh, 24), -- Vehicle Mod 24
                            n0=neon0, -- Neon 0
                            n1=neon1, -- Neon 1
                            n2=neon2, -- Neon 2
                            n3=neon3, -- Neon 3
                            bp=bulletproof, -- Bulletproof tyres
                            sc={smokecolor[1],smokecolor[2],smokecolor[3]}, -- Tyre smoke colour
                            cw=variation, -- Custom Wheels
                        }
                        TriggerServerEvent("garage:stored", data)
                        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
                        exports.pNotify:SendNotification({text = "Vehicle stored", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                        garage_menu = false
                        stored = true
                    elseif count < actualslots and user_vehicles[i].cg ~= currentgarage.id then
                        local data = {
                            n="no", -- Name
                            m=GetEntityModel(veh), -- Model
                            instance=veh, -- Current vehicle instance
                            cg=currentgarage.id,
                            p=GetVehicleNumberPlateText(veh), -- Plate
                            s="~g~Stored", -- State
                            cp=colors[1], -- Colour Primary
                            cs=colors[2], -- Colour Secondary
                            pc=extra_colors[1], -- Pearlescent Colour
                            wc=extra_colors[2], -- Wheel Colour
                            pi=GetVehicleNumberPlateTextIndex(veh), -- Colour of license plate
                            nc={neoncolor[1],neoncolor[2],neoncolor[3]}, -- Neon Colours
                            wt=GetVehicleWindowTint(veh), -- Window Tint
                            wht=GetVehicleWheelType(veh), -- Wheel type
                            m0=GetVehicleMod(veh, 0), -- Vehicle Mod 0
                            m1=GetVehicleMod(veh, 1), -- Vehicle Mod 1
                            m2=GetVehicleMod(veh, 2), -- Vehicle Mod 2
                            m3=GetVehicleMod(veh, 3), -- Vehicle Mod 3
                            m4=GetVehicleMod(veh, 4), -- Vehicle Mod 4
                            m5=GetVehicleMod(veh, 5), -- Vehicle Mod 5
                            m6=GetVehicleMod(veh, 6), -- Vehicle Mod 6
                            m7=GetVehicleMod(veh, 7), -- Vehicle Mod 7
                            m8=GetVehicleMod(veh, 8), -- Vehicle Mod 8
                            m9=GetVehicleMod(veh, 9), -- Vehicle Mod 9
                            m10=GetVehicleMod(veh, 10), -- Vehicle Mod 10
                            m11=GetVehicleMod(veh, 11), -- Vehicle Mod 11
                            m12=GetVehicleMod(veh, 12), -- Vehicle Mod 12
                            m13=GetVehicleMod(veh, 13), -- Vehicle Mod 13
                            m14=GetVehicleMod(veh, 14), -- Vehicle Mod 14
                            m15=GetVehicleMod(veh, 15), -- Vehicle Mod 15
                            m16=GetVehicleMod(veh, 16), -- Vehicle Mod 16
                            t=turbo, -- Turbo
                            xl=xenon, -- Xenon Lights
                            ts=tiresmoke, -- Tyre Smoke
                            m23=GetVehicleMod(veh, 23), -- Vehicle Mod 23
                            m24=GetVehicleMod(veh, 24), -- Vehicle Mod 24
                            n0=neon0, -- Neon 0
                            n1=neon1, -- Neon 1
                            n2=neon2, -- Neon 2
                            n3=neon3, -- Neon 3
                            bp=bulletproof, -- Bulletproof tyres
                            sc={smokecolor[1],smokecolor[2],smokecolor[3]}, -- Tyre smoke colour
                            cw=variation, -- Custom Wheels
                        }
                        TriggerServerEvent("garage:stored", data)
                        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
                        exports.pNotify:SendNotification({text = "Vehicle stored", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                        garage_menu = false
                        stored = true
                    else
                        garage_menu = false
                        stored = true
                        exports.pNotify:SendNotification({text = "This garage is full!", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                    end
                end
            end
            if not stored then
                exports.pNotify:SendNotification({text = "This is not your vehicle!", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
                garage_menu = false
            end
        else
            exports.pNotify:SendNotification({text = "No veh!", type = "success", queue = "left", timeout = 3000, layout = "centerRight"})
            garage_menu = false
        end
    end)
end

function SpawnVehicle(data)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        local isAreaCrowded = GetClosestVehicle(currentgarage.x, currentgarage.y, currentgarage.z, 3.000, 0, 70)
        if DoesEntityExist(isAreaCrowded) then
            exports.pNotify:SendNotification({text = "The area is crowded", type = "error", queue = "left", timeout = 3000, layout = "centerRight"})
        else
            RequestModel(data.m)
            while not HasModelLoaded(data.m) do
                Citizen.Wait(0)
            end
            veh = CreateVehicle(data.m, currentgarage.x, currentgarage.y, currentgarage.z, currentgarage.heading, true, false)
            table.insert(out, veh)
            SetVehicleNumberPlateText(veh, data.p)
            SetVehicleOnGroundProperly(veh)
            SetVehicleHasBeenOwnedByPlayer(veh,true)
            local id = NetworkGetNetworkIdFromEntity(veh)
            SetNetworkIdCanMigrate(id, true)
            SetNetworkIdExistsOnAllMachines(id, true)
            SetVehicleColours(veh, data.cp, data.cs)
            SetVehicleExtraColours(veh, tonumber(data.pc), tonumber(data.wc))
            SetVehicleNumberPlateTextIndex(veh,plateindex)
            SetVehicleNeonLightsColour(veh,tonumber(data.nc[1]),tonumber(data.nc[2]),tonumber(data.nc[3]))
            SetVehicleTyreSmokeColor(veh,tonumber(data.sc[1]),tonumber(data.sc[2]),tonumber(data.sc[3]))
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 0, tonumber(data.m0))
            SetVehicleMod(veh, 1, tonumber(data.m1))
            SetVehicleMod(veh, 2, tonumber(data.m2))
            SetVehicleMod(veh, 3, tonumber(data.m3))
            SetVehicleMod(veh, 4, tonumber(data.m4))
            SetVehicleMod(veh, 5, tonumber(data.m5))
            SetVehicleMod(veh, 6, tonumber(data.m6))
            SetVehicleMod(veh, 7, tonumber(data.m7))
            SetVehicleMod(veh, 8, tonumber(data.m8))
            SetVehicleMod(veh, 9, tonumber(data.m9))
            SetVehicleMod(veh, 10, tonumber(data.m10))
            SetVehicleMod(veh, 11, tonumber(data.m11))
            SetVehicleMod(veh, 12, tonumber(data.m12))
            SetVehicleMod(veh, 13, tonumber(data.m13))
            SetVehicleMod(veh, 14, tonumber(data.m14))
            SetVehicleMod(veh, 15, tonumber(data.m15))
            SetVehicleMod(veh, 16, tonumber(data.m16))
            if data.t == "on" then
                ToggleVehicleMod(veh, 18, true)
            else
                ToggleVehicleMod(veh, 18, false)
            end
            if data.ts == "on" then
                ToggleVehicleMod(veh, 20, true)
            else
                    ToggleVehicleMod(veh, 20, false)
            end
            if data.xl == "on" then
                ToggleVehicleMod(veh, 22, true)
            else
                ToggleVehicleMod(veh, 22, false)
            end
            SetVehicleWheelType(veh, tonumber(data.wht))
            SetVehicleMod(veh, 23, tonumber(data.m23))
            SetVehicleMod(veh, 24, tonumber(data.m24))
            if data.cw == "on" then
                SetVehicleMod(veh, 23, GetVehicleMod(veh, 23), true)-- Vehicle Mod 23
                SetVehicleMod(veh, 24, GetVehicleMod(veh, 24), true)-- Vehicle Mod 24
            end
            if data.n0 == "on" then
                SetVehicleNeonLightEnabled(veh,0, true)
            else
                SetVehicleNeonLightEnabled(veh,0, false)
            end
            if data.n1 == "on" then
                SetVehicleNeonLightEnabled(veh,1, true)
            else
                SetVehicleNeonLightEnabled(veh,1, false)
            end
            if data.n2 == "on" then
                SetVehicleNeonLightEnabled(veh,2, true)
            else
                SetVehicleNeonLightEnabled(veh,2, false)
            end
            if data.n3 == "on" then
                SetVehicleNeonLightEnabled(veh,3, true)
            else
                SetVehicleNeonLightEnabled(veh,3, false)
            end
            if data.bp == "on" then
                SetVehicleTyresCanBurst(veh, false)
            else
                SetVehicleTyresCanBurst(veh, true)
            end
            SetVehicleWindowTint(veh,tonumber(data.wt))
            TaskWarpPedIntoVehicle(GetPlayerPed(-1),veh,-1)
            SetEntityInvincible(veh, false)
            data.s = "~r~Missing" -- Vehicle State
            local instance = veh -- Current vehicle instance
            TriggerServerEvent("garage:out", data, instance)
        end
    end)
end

function SpawnReplacement(data)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        RequestModel(data.m)
        while not HasModelLoaded(data.m) do
           Citizen.Wait(0)
        end
        veh = CreateVehicle(data.m, replacementgarage.x, replacementgarage.y, replacementgarage.z, replacementgarage.heading, true, false)
        table.insert(out, veh)
        SetVehicleNumberPlateText(veh, data.p)
        SetVehicleOnGroundProperly(veh)
        SetVehicleHasBeenOwnedByPlayer(veh,true)
        local id = NetworkGetNetworkIdFromEntity(veh)
        SetNetworkIdCanMigrate(id, true)
        SetNetworkIdExistsOnAllMachines(id, true)
        SetVehicleColours(veh, data.cp, data.cs)
        SetVehicleExtraColours(veh, tonumber(data.pc), tonumber(data.wc))
        SetVehicleNumberPlateTextIndex(veh,plateindex)
        SetVehicleNeonLightsColour(veh,tonumber(data.nc[1]),tonumber(data.nc[2]),tonumber(data.nc[3]))
        SetVehicleTyreSmokeColor(veh,tonumber(data.sc[1]),tonumber(data.sc[2]),tonumber(data.sc[3]))
        SetVehicleModKit(veh,0)
        SetVehicleMod(veh, 0, tonumber(data.m0))
        SetVehicleMod(veh, 1, tonumber(data.m1))
        SetVehicleMod(veh, 2, tonumber(data.m2))
        SetVehicleMod(veh, 3, tonumber(data.m3))
        SetVehicleMod(veh, 4, tonumber(data.m4))
        SetVehicleMod(veh, 5, tonumber(data.m5))
        SetVehicleMod(veh, 6, tonumber(data.m6))
        SetVehicleMod(veh, 7, tonumber(data.m7))
        SetVehicleMod(veh, 8, tonumber(data.m8))
        SetVehicleMod(veh, 9, tonumber(data.m9))
        SetVehicleMod(veh, 10, tonumber(data.m10))
        SetVehicleMod(veh, 11, tonumber(data.m11))
        SetVehicleMod(veh, 12, tonumber(data.m12))
        SetVehicleMod(veh, 13, tonumber(data.m13))
        SetVehicleMod(veh, 14, tonumber(data.m14))
        SetVehicleMod(veh, 15, tonumber(data.m15))
        SetVehicleMod(veh, 16, tonumber(data.m16))
        if data.t == "on" then
            ToggleVehicleMod(veh, 18, true)
        else
            ToggleVehicleMod(veh, 18, false)
        end
        if data.ts == "on" then
            ToggleVehicleMod(veh, 20, true)
        else
            ToggleVehicleMod(veh, 20, false)
        end
        if data.xl == "on" then
            ToggleVehicleMod(veh, 22, true)
        else
            ToggleVehicleMod(veh, 22, false)
        end
        SetVehicleWheelType(veh, tonumber(data.wht))
        SetVehicleMod(veh, 23, tonumber(data.m23))
        SetVehicleMod(veh, 24, tonumber(data.m24))
        if data.cw == "on" then
            SetVehicleMod(veh, 23, GetVehicleMod(veh, 23), true)-- Vehicle Mod 23
            SetVehicleMod(veh, 24, GetVehicleMod(veh, 24), true)-- Vehicle Mod 24
        end
        if data.n0 == "on" then
            SetVehicleNeonLightEnabled(veh,0, true)
        else
            SetVehicleNeonLightEnabled(veh,0, false)
        end
        if data.n1 == "on" then
            SetVehicleNeonLightEnabled(veh,1, true)
        else
            SetVehicleNeonLightEnabled(veh,1, false)
        end
        if data.n2 == "on" then
            SetVehicleNeonLightEnabled(veh,2, true)
        else
            SetVehicleNeonLightEnabled(veh,2, false)
        end
        if data.n3 == "on" then
            SetVehicleNeonLightEnabled(veh,3, true)
        else
            SetVehicleNeonLightEnabled(veh,3, false)
        end
        if data.bp == "on" then
            SetVehicleTyresCanBurst(veh, false)
        else
            SetVehicleTyresCanBurst(veh, true)
        end
        SetVehicleWindowTint(veh,tonumber(data.wt))
        TaskWarpPedIntoVehicle(GetPlayerPed(-1),veh,-1)
        SetEntityInvincible(veh, false)
        garage_menu = false
        data.s = "~r~Missing" -- Vehicle State
        local instance = veh -- Current vehicle instance
        TriggerServerEvent("garage:out", data, instance)
    end)
end
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
--==============================================================================================================================--
--                                                       Basic Functions                                                        --
--==============================================================================================================================--
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

function reload()
    TriggerServerEvent("garage:reload")
end

reload()