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
	"paycheck/paycheck_cl.lua",
	"banking/client.lua",
	"taxi/taxi_Menu.lua",
	"taxi/taxi_client.lua",
	"liv/GUI.lua",
	"liv/client.lua",
	"wheels/client.lua",
	"blip/config.lua",
    "blip/client/main.lua",
    "vem/client.lua",
    "vem/GUI.lua",

}

server_scripts {
	"paycheck/paycheck_sv.lua",
	"banking/server.lua",
	'taxi/taxi_server.lua',
}

export "SendNotification"