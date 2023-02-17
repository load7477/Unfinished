-- Ryder
fx_version 'adamant'

game 'gta5'


ui_page "nui/index.html"

files {
    "nui/index.html",
    "nui/style.css",
    "nui/app.js",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
	'@vrp/lib/utils.lua', 
	"config.lua",
	'server.lua'
}

client_scripts {
	"config.lua",
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'client.lua'
}
