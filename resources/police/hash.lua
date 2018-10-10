    objectlist = {}
function getNextObject()
    local playerped = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(playerped)
    local handle, object = FindFirstObject()
    local success
    local rped = nil
    local distanceFrom
    
    for i = 1, 1000 do
        
        success, object = FindNextObject(handle)
        local targetCoords = GetEntityCoords(object)
        local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if distance < 15.0 then
            table.insert(objectlist,object)
            FreezeEntityPosition(object, true)
        end
    end
    
    EndFindObject(handle)
    
    return object
    
end

RegisterNetEvent("FindObject")
AddEventHandler("FindObject",function()
        object = getNextObject()
        --TriggerEvent("pNotify:SendNotification","Object - " .. object .. " END - " ..  GetHashKey(GetPlayerPed(-1)) .. "")
    end)

function DrawText3DTest(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.4, 0.4)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
    while true do
        for i = 1, #objectlist do
            local objectCoordsDraw = GetEntityCoords( tonumber(objectlist[i]) )
            model = GetEntityModel(objectlist[i])
            DrawText3DTest(objectCoordsDraw.x, objectCoordsDraw.y, objectCoordsDraw.z, "HASH:" .. model .. "")
        end
        Citizen.Wait(0)
    end
end)