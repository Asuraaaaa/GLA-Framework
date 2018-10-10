local objects_locations = {-- {name="prop_const_fence01b_cr", x = -1002.2600, y = -477.3500, z = 50.02758, head = 3015.0, invisible = false},
}

local Appartement = {
    [1] = {
        ["AppartementPrix"] = 1500,
        --[[====================]] --
        ["positionFromX"] = -1012.3,
        ["positionFromY"] = -480.647,
        ["positionFromZ"] = 39.9707,
        ["positionFromH"] = 0.00,
        --[[====================]] --
        ["positionToX"] = -1003.08,
        ["positionToY"] = -477.784,
        ["positionToZ"] = 50.0271,
        ["positionToH"] = 0.00,
        --[[====================]] --
        ["positionChestX"] = -1010.32,
        ["positionChestY"] = -476.19,
        ["positionChestZ"] = 50.0263,
        --[[====================]] --
        ["ArgentSaleMax"] = 1000,
        ["ArgentPropreMax"] = 1000,
        --[[====================]] --
        ["name"] = 'Office - Cinematic Studio'
    },
    ---------------------------------------------------------
    [2] = {
        ["AppartementPrix"] = 100,
        --[[====================]] --
        ["positionFromX"] = -916.973,
        ["positionFromY"] = -450.784,
        ["positionFromZ"] = 39.5999,
        ["positionFromH"] = 0.00,
        --[[====================]] --
        ["positionToX"] = -905.484,
        ["positionToY"] = -457.662,
        ["positionToZ"] = 126.534,
        ["positionToH"] = 0.00,
        --[[====================]] --
        ["positionChestX"] = -900.075,
        ["positionChestY"] = -450.736,
        ["positionChestZ"] = 126.543,
        --[[====================]] --
        ["positionVetementX"] = -888.499,
        ["positionVetementY"] = -444.386,
        ["positionVetementZ"] = 120.338,
        --[[====================]] --
        ["ArgentSaleMax"] = 1000,
        ["ArgentPropreMax"] = 1000,
        --[[====================]] --
        ["name"] = 'Apartment - Weazel Plaza'
    },
    [3] = {
        ["AppartementPrix"] = 250,
        --[[====================]] --
        ["positionFromX"] = -175.367,
        ["positionFromY"] = 502.234,
        ["positionFromZ"] = 137.425,
        ["positionFromH"] = 0.00,
        --[[====================]] --
        ["positionToX"] = -174.124,
        ["positionToY"] = 497.591,
        ["positionToZ"] = 137.667,
        ["positionToH"] = 0.00,
        --[[====================]] --
        ["positionChestX"] = -174.354,
        ["positionChestY"] = 493.923,
        ["positionChestZ"] = 130.044,
        --[[====================]] --
        ["positionVetementX"] = -167.525,
        ["positionVetementY"] = 487.802,
        ["positionVetementZ"] = 133.844,
        --[[====================]] --
        ["ArgentSaleMax"] = 1000,
        ["ArgentPropreMax"] = 1000,
        --[[====================]] --
        ["name"] = 'Vila of rich'
    },
}
-------------------------------------
local TEXT = {
    PressGoTo = 'Press the ~r~E~w~ button to open the menu : ',
    PressGetOut = 'Press the ~r~E~w~ button to exit : ',
    PressCoffre = 'Press the ~r~E~w~ button to open your safe',
    PressVetement = 'Press the ~r~E~w~ button to open your dressing room',
    Buy = 'Buy this property        ~y~',
    -------------------------------------------------------
    Sonner = 'Owner ~r~: ~g~',
    YouHomeVisite = 'Visit',
    GoHome = 'Go home',
    VentreMaison = 'Sell your property ~r~:~y~ ',
    --------------------------------------------------------
    -- COFFRE

    DeposerArgent = 'Deposit ~g~\'money',
    PropreDepos = 'You have just deposited\'money in your safe ~b~:~g~ ',
    RetireArgent = 'Removed ~g~\'clean money : ',
    PropreRetire = 'You have just removed\'money from your safe ~b~:~g~',
    DesposerArgentSale = '~o~Deposited ~r~\'dirty money',
    SaleDepos = 'You have just deposited\'~r~ dirty money ~w~ in your safe ~b~:~r~ ',
    RetireArgentSale = '~o~Withdrew ~r~\'dirty money : ',
    SaleRetire = 'You have just removed\'~r~ dirty money ~w~ from your safe ~b~:~r~ ',
    ErreurCoffre = '~o~Oops ~w~ It looks like\'there is a small problem in the amount of money\' you want to withdraw / Deposit ~r~!',
    -------------------------------------------------------
    SortirAppartement = 'Leave the apartment',
    Visite = 'Visit apartment',
    CloseMenu = '~r~Close menu',
    CoffreNoDispo = '~r~You do not have the keys !',
    -------------------------------------------------------
    BuyNotificationPicture = 'CHAR_EPSILON',
    NotificationTitle = 'Real Estate Agent',
    BuyBienvenueMessage = 'Welcome to your new property',
    BuyNoMoney = 'You\' dont have enough \'money',
    VendreMessage = 'You sold your property',
    --------------------------------------------------------
    RecupTenuOld = '~g~Recover your clothes',
    TenuSexySpecial = 'special outfit ~r~+18',
    TenuClasse01 = 'Chic outfit',
    TenuDeNuit = 'Night outfit',
    TenuNoir = 'Neutral black outfit',
}
-------------------------------------
local options = {
    x = 0.12,
    y = 0.2,
    width = 0.23,
    height = 0.04,
    scale = 0.4,
    font = 1,
    menu_title = "Apartment",
    menu_subtitle = "Categories",
    -- WHITE NICE COLOR
    --[[
   color_r = 255,
   color_g = 255,
   color_b = 255,
   ]] --
    -- BLUE NICE COLOR
    --[[
   color_r = 57,
   color_g = 43,
   color_b = 192,
    ]] --

    -- GREEN NICE COLOR
    color_r = 57,
    color_g = 192,
    color_b = 43,


    -- RED NICE COLOR
    --[[
    color_r = 192,
    color_g = 57,
    color_b = 43,
    ]] --
}
-------------------------------------
local isBuy = 0
local money = 0
local dirtymoney = 0
-------------------------------------
Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing
function Drawing.draw3DText(x, y, z, textInput, fontId, scaleX, scaleY, r, g, b, a)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

function freeze(freeze)
    local player = PlayerId()
    local ped = GetPlayerPed(player)
    if not freeze then
        if not IsPedInAnyVehicle(ped) then
        end
        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    end
    print("Freeze status : " .. tostring(freeze))
end

------ PROPS POUR LES APPARTEMENT SI IL Y A DES BUG TEXTURE
function LoadLocalObjects()
    if not loaded then
        for i, object in ipairs(objects_locations) do
            Citizen.Wait(1)
            objects[i] = CreateObject(object.name, object.x, object.y, object.z - 1.1, false, false)
            objectspawned = objects[i]
            --PlaceObjectOnGroundProperly( objects[i] )

            SetEntityDynamic(objects[i], true)
            SetEntityInvincible(objects[i], true)
            SetEntityCanBeDamaged(objects[i], false)
            SetEntityHealth(objects[i], 1000)
            SetEntityHasGravity(objects[i], true)
            local id = NetworkGetNetworkIdFromEntity(objects[i])
            SetEntityAsMissionEntity(objects[i], true, true)
            SetEntityLoadCollisionFlag(objects[i], false)
            SetEntityRecordsCollisions(objects[i], false)
            SetEntityProofs(objects[i], false, false, false, false, false, false, false, false)

            FreezeEntityPosition(objects[i], true)

            SetEntityHeading(objects[i], object.head)
            print(object.head)

            if object.invisible then
                SetEntityVisible(objects[i], false, 0)
            end
            --objects[i] = {object.name, object.x, object.y, object.z-1.1, objct.d}
        end
        loaded = true
    else
        for i, objct in ipairs(objects) do
            Citizen.Wait(1)
            --GetObjectOffsetFromCoords(objct.x, objct.y, objct.z, objct.d, 0, 0, 0)
            DeleteObject(objects[i])
        end
        loaded = false
    end
end

AddEventHandler("playerSpawned", function()
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
    if not loaded then
        LoadLocalObjects()
        print("object " .. tostring(loaded))
    end
end)
------ PROPS POUR LES APPARTEMENT SI IL Y A DES BUG TEXTURE


RegisterNetEvent("apart:getCash")
AddEventHandler("apart:getCash", function(moneyparm, dirtymoneyparm)
    money = moneyparm
    dirtymoney = dirtymoneyparm
end)


function DringMenuApartement()
    options.menu_subtitle = 'Welcome'
    ClearMenu()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ, true) < 1.599 then
            TriggerServerEvent("itexzoz:GetAppart", Appartement[i].name)
            Wait(250)
            if isBuy == 1 then
                -- Maison non disponible a l'achat Menu
                Menu.addButton(TEXT.Sonner .. TriggerServerEvent('etuldan:getFullNameFromId', "steam:11000010a5ab15f", function(name) name "" end) .. "", "Sonner", nil)

            elseif isBuy == 2 then
                -- Votre maison Menu
                Menu.addButton(TEXT.YouHomeVisite, "GoApartement", nil)
                Menu.addButton(TEXT.VentreMaison .. Appartement[i].AppartementPrix / 2 .. "$", "Vendre", nil)
            else
                -- Maison disponible a la vente
                Menu.addButton(TEXT.Buy .. Appartement[i].AppartementPrix .. "$", "Acheter", nil)
                Menu.addButton(TEXT.Visite, "GoApartement", nil)
            end
            Menu.addButton(TEXT.CloseMenu, "CloseMenu", nil)
        end
    end
end



function InHomeMenuApartement()
    options.menu_subtitle = "Apartement"
    ClearMenu()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ, true) < 1.599 then
            TriggerServerEvent("itexzoz:GetAppart", Appartement[i].name)
            Wait(250)
            if isBuy == 2 then
                -- c'est ton appartement
                Menu.addButton(TEXT.SortirAppartement, "GetOutApartement", nil)
            -- a developpé
                Menu.addButton("Give the keys to a person", "GetOutApartement", nil)
                Menu.addButton("Get keys back from person", "GetOutApartement", nil)
            else
                -- en visite de l'appartement
                Menu.addButton(TEXT.SortirAppartement, "GetOutApartement", nil)
            end
            Menu.addButton(TEXT.CloseMenu, "CloseMenu", nil)
        end
    end
end

function CoffreHome()
    options.menu_subtitle = "Safe"
    ClearMenu()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ, true) < 1.599 then
            TriggerServerEvent("itexzoz:GetAppart", Appartement[i].name)
            Wait(250)
            if isBuy == 2 then
                --Coffre menu pour le propio
                TriggerServerEvent("apart:getCash", Appartement[i].name)
                print("Clean money : " .. money)
                print("Dirty money :" .. dirtymoney)
                Menu.addButton(TEXT.DeposerArgent, "DeposerArgent", Appartement[i].name)
                Menu.addButton(TEXT.RetireArgent .. money .. "$", "RetireArgent", Appartement[i].name)
                Menu.addButton(TEXT.DesposerArgentSale, "DesposerArgentSale", Appartement[i].name)
                Menu.addButton(TEXT.RetireArgentSale .. dirtymoney .. "$", "RetireArgentSale", Appartement[i].name)
            else
                --Coffre non dispo car en visite ou pas achéte
                Menu.addButton(TEXT.CoffreNoDispo, "CloseMenu", nil)
            end
            Menu.addButton(TEXT.CloseMenu, "CloseMenu", nil)
        end
    end
end

 function OpenDresing()
     options.menu_subtitle = "Dressing"
     ClearMenu()
     for i = 1, #Appartement do
         if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ, true) < 1.599 then
             TriggerServerEvent("itexzoz:GetAppart", Appartement[i].name)
             Wait(250)
             if isBuy == 2 then
                 Menu.addButton(TEXT.TenuClasse01, "TenuEvenementBienVetu", nil)
                 Menu.addButton(TEXT.TenuNoir, "TenuNoirSympa", nil)
                 Menu.addButton(TEXT.TenuDeNuit, "TenuDeNuit", nil)
                 Menu.addButton(TEXT.TenuSexySpecial, "TenuSpecialSexy", nil)
                 Menu.addButton(TEXT.RecupTenuOld, "TenuDeBase", nil)
             else
                 Menu.addButton(TEXT.CoffreNoDispo, "CloseMenu", nil)
             end
             Menu.addButton(TEXT.CloseMenu, "CloseMenu", nil)
         end
     end
 end

--[[================================================================]]--
--[[================================================================]]--
--[[=============================DRESSING===========================]]--
local hashSkin = GetHashKey("mp_m_freemode_01")
--[[================================================================]]--
--[[================================================================]]--
function TenuEvenementBienVetu()
    Citizen.CreateThread(function()
        if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
            SetPedComponentVariation(GetPlayerPed(-1), 3, 33, 0, 0)--Gants(top/arm)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 10, 0, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 16, 6, 0)--Chaussure


            SetPedComponentVariation(GetPlayerPed(-1), 11, 10, 0, 0)--Veste(jacket)

            SetPedComponentVariation(GetPlayerPed(-1), 8, 10, 0, 2)-- (shirt)

            SetPedPropIndex(GetPlayerPed(-1), 1, 18, 8, 1)--Lunette
        else
            SetPedComponentVariation(GetPlayerPed(-1), 3, 34, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 52, 2, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 62, 20, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 38, 0, 2)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 58, 0, 0)-- Veste (jacket)

            SetPedPropIndex(GetPlayerPed(-1), 1, 19, 4, 2) -- lunette femme
        end
    end)
    CloseMenu()
end

function TenuDeNuit()
    Citizen.CreateThread(function()
        if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
         --HOMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 61, 1, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 34, 0, 0)-- Veste (jacket)
        else
         --FEMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 2, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 62, 2, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 6, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 38, 3, 0)-- Veste (jacket)
        end
    end)
    CloseMenu()
end

function TenuSpecialSexy()
    Citizen.CreateThread(function()
        if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
            --HOMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 61, 5, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 0)-- Veste (jacket)
        else
            --FEMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 4, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 63, 5, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 41, 5, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 3, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 111, 5, 0)-- Veste (jacket)
        end
    end)
    CloseMenu()
end

function TenuNoirSympa()
    Citizen.CreateThread(function()
        if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
            --HOMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 1, 1, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 3, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)-- Veste (jacket)
        else
            --FEMME
            SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)--Gants (tops)

            SetPedComponentVariation(GetPlayerPed(-1), 4, 30, 0, 0)--Jean

            SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure

            SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)-- (shirt)

            SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)-- Veste (jacket)
        end
    end)
    CloseMenu()
end

function TenuDeBase()
    TriggerServerEvent("skin_customization:SpawnPlayer")
    SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 1, 2)
    CloseMenu()
end
--[[====================================================]] --
--[[============FUNCTION APPARTEMENT MENU===============]] --
--[[====================================================]] --
function DeposerArgent(apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("itexzoz:DeposerArgentPropre", txt, apart)
            CloseMenu()
        end
    end
end

function RetireArgent(apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("itexzoz:TakeArgentPropre", txt, apart)
            CloseMenu()
        end
    end
end

function DesposerArgentSale(apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("itexzoz:DeposerArgentSale", txt, apart)
            CloseMenu()
        end
    end
end

function RetireArgentSale(apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("itexzoz:TakeArgentSale", txt, apart)
            CloseMenu()
        end
    end
end

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
function GoApartement()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ, true) < 1.599 then
            DoScreenFadeOut(1000)
            Citizen.Wait(2000)
            SetEntityCoords(GetPlayerPed(-1), Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ - 1)
            SetEntityHeading(GetPlayerPed(-1), Appartement[i].positionToH)
            Citizen.Wait(2500)
            Menu.hidden = true
            freeze(false)
            DoScreenFadeIn(1000)
        end
    end
end

function GetOutApartement()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ, true) < 1.599 then
            DoScreenFadeOut(1000)
            Citizen.Wait(2000)
            SetEntityCoords(GetPlayerPed(-1), Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ - 1)
            SetEntityHeading(GetPlayerPed(-1), Appartement[i].positionFromH)
            Citizen.Wait(2500)
            Menu.hidden = true
            freeze(false)
            DoScreenFadeIn(1000)
        end
    end
end

function Vendre()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ, true) < 1.599 then
            TriggerServerEvent("itexzoz:Vendre", Appartement[i].name, Appartement[i].AppartementPrix)
            CloseMenu()
        end
    end
end

function Acheter()
    for i = 1, #Appartement do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ, true) < 1.599 then
            TriggerServerEvent("itexzoz:BuyAppart", Appartement[i].name, Appartement[i].AppartementPrix)
            CloseMenu()
        end
    end
end

function Sonner()
    print('soon')
end

function CloseMenu()
    Menu.hidden = true
    freeze(false)
end


--[[====================================================]] --
--[[====================================================]] --
--[[====================================================]] --
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterNetEvent('sendHelp')
AddEventHandler('sendHelp', function(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end)

RegisterNetEvent("utils:notify")
AddEventHandler("utils:notify", function(text, icon, sender)
    Citizen.CreateThread(function()
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        if (icon and sender) then
            SetNotificationMessage(icon, icon, true, 1, sender, false);
        end
        DrawNotification(false, true);
    end)
end)
--[[====================================================]] --
--[[====================================================]] --
--[[====================================================]] --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        for i = 1, #Appartement do
            -- TP AU LEUIX X
            if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ) < 150.0) then
                DrawMarker(1, Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255, 255, 0, 0, 0, 0)
                if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ) < 5.0) then
                    Drawing.draw3DText(Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ - 1.100, Appartement[i].name, 7, 0.2, 0.1, 255, 255, 255, 215)
                    if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionFromX, Appartement[i].positionFromY, Appartement[i].positionFromZ) < 2.0) then
                        ClearPrints()
                        SetTextEntry_2("STRING")
                        AddTextComponentString(TEXT.PressGoTo .. ' ' .. Appartement[i].name)
                        DrawSubtitleTimed(2000, 1)
                        if IsControlJustPressed(1, 38) then
                            DringMenuApartement()
                            freeze(true)
                            Menu.hidden = not Menu.hidden
                        end
                        Menu.renderGUI(options)
                    end
                end
            end
            -- SORTIRE DU LEUIX X
            if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ) < 150.0) then
                DrawMarker(1, Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255, 255, 0, 0, 0, 0)
                if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ) < 5.0) then
                    Drawing.draw3DText(Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ - 1.100, Appartement[i].name, 7, 0.2, 0.1, 255, 255, 255, 215)
                    if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionToX, Appartement[i].positionToY, Appartement[i].positionToZ) < 2.0) then
                        ClearPrints()
                        SetTextEntry_2("STRING")
                        AddTextComponentString(TEXT.PressGetOut .. ' ' .. Appartement[i].name)
                        DrawSubtitleTimed(2000, 1)
                        if IsControlJustPressed(1, 38) then
                            InHomeMenuApartement()
                            freeze(true)
                            Menu.hidden = not Menu.hidden
                        end
                        Menu.renderGUI(options)
                    end
                end
            end
            -- COFFRE APPARTEMENT
            if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ) < 150.0) then
                DrawMarker(1, Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255, 255, 0, 0, 0, 0)
                if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ) < 5.0) then
                    Drawing.draw3DText(Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ - 1.100, Appartement[i].name, 7, 0.2, 0.1, 255, 255, 255, 215)
                    if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionChestX, Appartement[i].positionChestY, Appartement[i].positionChestZ) < 2.0) then
                        ClearPrints()
                        SetTextEntry_2("STRING")
                        AddTextComponentString(TEXT.PressCoffre .. ' ' .. Appartement[i].name)
                        DrawSubtitleTimed(2000, 1)
                        if IsControlJustPressed(1, 38) then
                            CoffreHome()
                            freeze(true)
                            Menu.hidden = not Menu.hidden
                        end
                        Menu.renderGUI(options)
                    end
                end
            end
            -- COFFRE APPARTEMENT
            if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ) < 150.0) then
                DrawMarker(1, Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ - 1.0, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255, 255, 0, 0, 0, 0)
                if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ) < 5.0) then
                    Drawing.draw3DText(Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ - 1.100, Appartement[i].name, 7, 0.2, 0.1, 255, 255, 255, 215)
                    if (Vdist(pos.x, pos.y, pos.z, Appartement[i].positionVetementX, Appartement[i].positionVetementY, Appartement[i].positionVetementZ) < 2.0) then
                        ClearPrints()
                        SetTextEntry_2("STRING")
                        AddTextComponentString(TEXT.PressVetement .. ' ' .. Appartement[i].name)
                        DrawSubtitleTimed(2000, 1)
                        if IsControlJustPressed(1, 38) then
                            OpenDresing()
                            freeze(true)
                            Menu.hidden = not Menu.hidden
                        end
                        Menu.renderGUI(options)
                    end
                end
            end
        end
    end
end)
--[[=======================================]] --
--[[=======================================]] --
--[[=======================================]] --
RegisterNetEvent("apart:isBuy")
AddEventHandler("apart:isBuy", function()
    isBuy = 1
end)
RegisterNetEvent("apart:isNotBuy")
AddEventHandler("apart:isNotBuy", function()
    isBuy = 0
end)
RegisterNetEvent("apart:isMine")
AddEventHandler("apart:isMine", function()
    isBuy = 2
end)

--[[=========================================================]] --
--[[==============NOTIFICATION SERVEUR LIST==================]] --
--[[=========================================================]] --
RegisterNetEvent("itexzoz:NotificationBuy")
AddEventHandler("itexzoz:NotificationBuy", function()
    TriggerEvent('utils:notify', TEXT.BuyBienvenueMessage, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

RegisterNetEvent("itexzoz:NotificationNoMoney")
AddEventHandler("itexzoz:NotificationNoMoney", function()
    TriggerEvent('utils:notify', TEXT.BuyNoMoney, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

RegisterNetEvent("itexzoz:NotificationVendre")
AddEventHandler("itexzoz:NotificationVendre", function()
    TriggerEvent('utils:notify', TEXT.VendreMessage, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

--COFFRE NOTIFICATION START
RegisterNetEvent("itexzoz:NotificationPropreDepos")
AddEventHandler("itexzoz:NotificationPropreDepos", function(COUNT)
    TriggerEvent('utils:notify', TEXT.PropreDepos .. '' .. COUNT, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

RegisterNetEvent("itexzoz:NotificationPropreRetire")
AddEventHandler("itexzoz:NotificationPropreRetire", function(COUNT)
    TriggerEvent('utils:notify', TEXT.PropreRetire .. '' .. COUNT, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

RegisterNetEvent("itexzoz:NotificationSaleRetire")
AddEventHandler("itexzoz:NotificationSaleRetire", function(COUNT)
    TriggerEvent('utils:notify', TEXT.SaleRetire .. '' .. COUNT, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)


RegisterNetEvent("itexzoz:NotificationSaleDepos")
AddEventHandler("itexzoz:NotificationSaleDepos", function(COUNT)
    TriggerEvent('utils:notify', TEXT.SaleDepos .. '' .. COUNT, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)

RegisterNetEvent("itexzoz:NotificationErreurCoffre")
AddEventHandler("itexzoz:NotificationErreurCoffre", function()
    TriggerEvent('utils:notify', TEXT.ErreurCoffre, TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)
--COFFRE NOTIFICATION END

RegisterNetEvent("itexzoz:Notification0")
AddEventHandler("itexzoz:Notification0", function()
    TriggerEvent('utils:notify', "No notifications for the moment, the operation performs", TEXT.BuyNotificationPicture, TEXT.NotificationTitle)
end)


