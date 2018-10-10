local admins = {
	'steam:11000011aae6b93' -- serenity
}

AddEventHandler('f:loaded', function(source, user)
	local identifier = user.getIdentifier()
	for k,v in pairs(admins) do
		if user.getIdentifier() == v then
			TriggerClientEvent('Anticheat:isAdmin', source)
			break
		end
	end
end)

