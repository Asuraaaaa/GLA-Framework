

--Puts hat on
TriggerEvent('serenity-core:addCommand', 'hat', function(source, args, user)
	TriggerClientEvent('haton', source, {})
end, {help = "Put on your hat"})

--Takes hat off
TriggerEvent('serenity-core:addCommand', 'hatoff', function(source, args, user)
	TriggerClientEvent('hatrem', source, {})
end, {help = "Take off your hat"})
--Sunglasses on
TriggerEvent('serenity-core:addCommand', 'sg', function(source, args, user)
	TriggerClientEvent('sung', source, {})
end, {help = "Put on your sunglasses"})
--Sunglasses off
TriggerEvent('serenity-core:addCommand', 'sgoff', function(source, args, user)
	TriggerClientEvent('sunoff', source, {})
end, {help = "Take off your sunglasses"})

AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.lower( msg )
    
    if ( msg == "/r" ) then 
    
        CancelEvent() 

        TriggerClientEvent( 'Radio', source )
    end
end )