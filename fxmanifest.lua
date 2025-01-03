fx_version "cerulean"
game "gta5"

author 'Gigavat'
description 'A burgershot job for ESX'
version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts { 
    'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/stations.lua',
    'client/handwash.lua',
    'client/trays.lua',
}

dependencies {
    '/assetpacks',
    'es_extended',
    'ox_lib',
    'ox_target'
}

data_file 'DLC_ITYP_REQUEST' 'stream/nels_food_props.ytyp'

escrow_ignore {
    'stream/**/*.ytd'
}

lua54 'yes'