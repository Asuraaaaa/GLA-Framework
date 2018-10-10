


local hwaycop = GetHashKey("s_m_y_hwaycop_01") --Add on ped
local cop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local fsheriff = GetHashKey("s_f_y_sheriff_01")
local fcop = GetHashKey("s_f_y_cop_01")
local ranger = GetHashKey("s_m_y_ranger_01")

--Hat functionality

  RegisterNetEvent( 'haton' )
AddEventHandler( 'haton', function()
	if(GetEntityModel(GetPlayerPed(-1)) == hwaycop) then --This is an add on ped the hwaycop skin does not come with a hat by default
		SetPedPropIndex(GetPlayerPed(-1), 0, 01, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == cop) then
		SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == fsheriff) then
		SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == fcop) then
		SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == ranger) then
		SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)

	end
end)

  RegisterNetEvent( 'hatrem' )
AddEventHandler( 'hatrem', function()
	ClearPedProp(GetPlayerPed(-1), 0)
end)

--Sunglasses functionality

  RegisterNetEvent( 'sunoff' )
AddEventHandler( 'sunoff', function()
	ClearPedProp(GetPlayerPed(-1), 1)
end)


  RegisterNetEvent( 'sung' )
AddEventHandler( 'sung', function()
	if(GetEntityModel(GetPlayerPed(-1)) == hwaycop) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 0, 1, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == cop) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == fsheriff) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == fcop) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
	elseif(GetEntityModel(GetPlayerPed(-1)) == ranger) then
		SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)

	end
end)

RegisterNetEvent('Radio')
AddEventHandler('Radio', function()

local ped = GetPlayerPed( -1 )
    
if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "random@arrests" )
	   while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(ped)
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
				else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
            end 
        end )
    end 
end )

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)