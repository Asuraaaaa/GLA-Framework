RegisterServerEvent('thiefInProgress')
AddEventHandler('thiefInProgress', function(street1, street2, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("outlawNotify", -1, "Car Jacking, suspect is a "..sex.." last seen on "..street1.." and "..street2)
	else
		TriggerClientEvent("outlawNotify", -1, "Car Jacking, suspect driving a "..veh.." is a "..sex.." last seen on "..street1.." and "..street2)
	end
end)

RegisterServerEvent('thiefInProgressS1')
AddEventHandler('thiefInProgressS1', function(street1, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("outlawNotify", -1, "Stolen car by a "..sex.." last seen on "..street1)
	else
		TriggerClientEvent("outlawNotify", -1, "Stolen car the "..veh.." last seen speeding off with a "..sex.." around "..street1)
	end
end)

--RegisterServerEvent('meleeInProgress')
--AddEventHandler('meleeInProgress', function(street1, street2, sex)
--	TriggerClientEvent("outlawNotify", -1, "~r~Assault reported, ~w~be on the lookout for a "..sex.." between "..street1.." and "..street2)
--end)

--RegisterServerEvent('meleeInProgressS1')
--AddEventHandler('meleeInProgressS1', function(street1, sex)
--	TriggerClientEvent("outlawNotify", -1, "~r~Assault reported, ~w~be on the lookout for a "..sex.." around "..street1)
--end)


RegisterServerEvent('gunshotInProgress')
AddEventHandler('gunshotInProgress', function(street1, street2, sex)
	TriggerClientEvent("outlawNotify", -1, "Shots fired, by a "..sex.." between "..street1.." and "..street2)
end)

RegisterServerEvent('gunshotInProgressS1')
AddEventHandler('gunshotInProgressS1', function(street1, sex)
	TriggerClientEvent("outlawNotify", -1, "Shots fired, by a "..sex.."  last seen at "..street1)
end)

RegisterServerEvent('thiefInProgressPos')
AddEventHandler('thiefInProgressPos', function(tx, ty, tz)
	TriggerClientEvent('thiefPlace', -1, tx, ty, tz)
end)

RegisterServerEvent('gunshotInProgressPos')
AddEventHandler('gunshotInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('gunshotPlace', -1, gx, gy, gz)
end)

RegisterServerEvent('meleeInProgressPos')
AddEventHandler('meleeInProgressPos', function(mx, my, mz)
	TriggerClientEvent('meleePlace', -1, mx, my, mz)
end)