TriggerEvent('es:addCommand', 'saw', function(source, args, user)
        TriggerClientEvent("getSaw", source)
	
end)

--[[TriggerEvent('es:addCommand', 'stopsaw', function(source, args, user)
        TriggerClientEvent("cl_saw:stopsawparticles", source)
	
end)]]

--[[AddEventHandler("chatMessage", function(source, name, message)
	local cm = stringsplit(message, " ")

	if cm[1] == "/saw" then
		CancelEvent()
		TriggerClientEvent("getSaw", source)
	else
		if cm[2] == "/saw2" then
			ClearPedProp(GetPlayerPed(-1), prop_tool_consaw)
		    --ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)]]

RegisterServerEvent("sv_saw:startsawparticles")
AddEventHandler("sv_saw:startsawparticles", function(saw)
	TriggerClientEvent("cl_saw:startsawparticles", -1, saw)
end)

RegisterServerEvent("sv_saw:stopsawparticles")
AddEventHandler("sv_saw:stopsawparticles", function(saw)
	TriggerClientEvent("cl_saw:stopsawparticles", -1, saw)
end)

--[[ Other Functions ]]
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end