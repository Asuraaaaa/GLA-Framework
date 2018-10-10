--[[------------------------------------------------------------------------
    Remove Reticle on ADS (Third Person)
------------------------------------------------------------------------]]--

isCop = false

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and isCop ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
     HideHudComponentThisFrame( 14 )

        Citizen.Wait( 0 )
    end 
end )