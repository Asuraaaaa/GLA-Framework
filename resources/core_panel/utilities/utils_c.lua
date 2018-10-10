local extrablips = {
    {name="State Prison", sprite=285, x=1679.049, y=2513.711, z=45.565},
}

function addBlip(item)
	item.blip = AddBlipForCoord(item.x, item.y, item.z)
	SetBlipSprite(item.blip, item.sprite)
	SetBlipColour(item.blip, item.colour)
	SetBlipAsShortRange(item.blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(item.name)
	EndTextCommandSetBlipName(item.blip)
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

Citizen.CreateThread(function()
	for i = 1, 12 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
    for _, item in pairs(extrablips) do
    	addBlip(item)
    end
	while true do
		Citizen.Wait(0)
		if not IsEntityDead(GetPlayerPed(-1)) then
	        if player_menu then
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif carshop_menu then
	        	player_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif garage_menu then
	        	player_menu = false
	            carshop_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif gun_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            item_menu = false
	            license_menu = false          
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif item_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            license_menu = false	            
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif license_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false            
	            sellgun_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
		    elseif sellgun_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false
	            carrental_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif carrental_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false     
	            sellgun_menu = false
	            clothing_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif clothing_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false            
	            sellgun_menu = false
	            carrental_menu = false
	            tow_menu = false
	            Menu.DisplayCurMenu()
	        elseif tow_menu then
	        	player_menu = false
	            carshop_menu = false
	            garage_menu = false
	            gun_menu = false
	            item_menu = false
	            license_menu = false        
	            sellgun_menu = false
	            clothing_menu = false
	            carrental_menu = false
	            Menu.DisplayCurMenu()
	        end
	    else
	        player_menu = false
	        carshop_menu = false
	        garage_menu = false
	        gun_menu = false
	        item_menu = false
	        license_menu = false   
	        sellgun_menu = false
	        carrental_menu = false
	        clothing_menu = false
	        tow_menu = false    	
	    end
	end
end)