ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getPlayerFromId(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifier(identifiers)
    return player
end

function getIdentifier(id)
    for _, v in ipairs(id) do
        return v
    end
end

AddEventHandler('playerConnecting', function(peerName, setKickReason)
    local numIds = GetNumPlayerIdentifiers(source)
	for i,allowedID in ipairs(cfg.AllowedIDs) do
        for i = 0, numIds-3 do
            if cfg.isOnMaintenance == true and getPlayerFromId(source) ~= allowedID then
                print('-----------------SERVER NOT READY YET-------------')
                print('Refusing connection to' .. peerName ..'           ')
                print('-----------------SERVER NOT READY YET-------------')
                
				setKickReason('The server is roleplaying that it isn\'t ready for your swag yet. Please try again in a few moments.')
				CancelEvent()
			end
		end
    end
end)
