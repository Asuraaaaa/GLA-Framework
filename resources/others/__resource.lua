resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'buncha condensed shit'

ui_page 'banking/html/ui.html'

files {
	'banking/html/ui.html',
	'banking/html/pricedown.ttf',
	'banking/html/bank-icon.png',
	'banking/html/logo.png',
	'banking/html/cursor.png',
	'banking/html/styles.css',
	'banking/html/scripts.js',
	'banking/html/debounce.min.js',
	'sounds/chime.ogg',
	'banking/html/sounds/chime.ogg',
}

client_scripts {
    "gui.lua",
    "extras.lua",
	"laundering/client.lua",
	"paycheck/paycheck_cl.lua",
	"banking/client.lua",
	"helicam/heli_client.lua",
	"taxi/taxi_Menu.lua",
	"taxi/taxi_client.lua",
	"handsup/client.lua",
	"pointer/client.lua",
	"crouch/client.lua",
	"ragdoll/client.lua",
	"liv/GUI.lua",
	"liv/client.lua",
	"nodrop/client.lua",
	"crosshair/client.lua",
	"hat/client.lua",
	"JF_SeatShuffle/client.lua",
	"knockout/ko_client.lua",
	"showcoords/coords.net",
	"wheels/client.lua",
	"Single-Firing/FiringMode.net.dll",
	"blip/config.lua",
    "blip/client/main.lua",
    "interiors/client.lua",
    "KeepMyDoorOpen/client.lua",
    "arrestk/client.lua",
    "carwash/carwash_client.lua",
    "vem/client.lua",
    "vem/GUI.lua",
    "playerids/playerids.lua",
    "saw/cl_saw.lua",
    "copnotify/client.lua",

}

server_scripts {
	"laundering/server.lua",
	"paycheck/paycheck_sv.lua",
	"banking/server.lua",
	"helicam/heli_server.lua",
	'taxi/taxi_server.lua',
	'hat/server.lua',
	"arrestk/server.lua",
	"carwash/carwash_server.lua",
	"saw/sv_saw.lua",
	"copnotify/server.lua",
}

export "SendNotification"