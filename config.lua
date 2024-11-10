Config = {}

Config.Ui = 'radial' -- 'radial' (ox_lib radial menu) -- 'text' (ox_lib textui)

Config.item = 'bread'

Config.Enter = {

    Entry = {
        coords = vec3(1915.3044, 582.6716, 176.3674),
    },

    IPL = {
        coords = vec3(265.9986, -1007.3528, -101.0041),
    },

    NPC = {
        coords = vec4(265.0760, -1001.3335, -100.0087, 180.1469),
        model = 'a_m_m_prolhost_01',
    },

    Target = {
        coords = vec3(265.0760, -1001.3335, -99.0087),
    }
} 



Config.Blackmarket = {

    Menu = {
        title = 'Black Market',

        Kategorier = {
            {
                title = 'Våben',
                description = 'Køb forskellige våben og ammunition',
                icon = 'fa-solid fa-person-rifle',
                iconColor = 'lightblue',
                subMenu = 'Våben',
            },
            {
                title = 'Attachments',
                description = 'Køb forskellige attachments',
                icon = 'fa-solid fa-link',
                iconColor = 'lightblue',
                subMenu = 'Attachments',
            },
            {
                title = 'Tilbehør',
                description = 'Elektronisk udstyr til forskellige formål',
                icon = 'fa-solid fa-laptop-code',
                iconColor = 'lightblue',
                subMenu = 'Tilbehør',
            },
        },

        SubMenus = {
            ['Våben'] = {
                {
                    title = 'Pistol',
                    description = 'Standard 9mm pistol',
                    icon = 'fa-solid fa-gun',
                    item = 'weapon_pistol',
                    price = 15000,
                    count = 1,
                },
                {
                    title = 'SMG',
                    description = 'Kompakt automatvåben',
                    icon = 'fa-solid fa-gun',
                    item = 'weapon_smg',
                    price = 25000,
                    count = 1,
                },
                {
                    title = 'Pistol Ammunition',
                    description = '9mm ammunition (50 skud)',
                    icon = 'fa-solid fa-bullets',
                    item = 'ammo_pistol',
                    price = 2500,
                    count = 50,
                },
            },
            ['Attachments'] = {
                {
                    title = 'Hacking Laptop',
                    description = 'Modificeret laptop til hacking',
                    icon = 'fa-solid fa-laptop',
                    item = 'hackinglaptop',
                    price = 12000,
                    count = 1,
                },
                {
                    title = 'USB Dongle',
                    description = 'Krypteret USB-nøgle',
                    icon = 'fa-solid fa-usb',
                    item = 'usb_hack',
                    price = 4500,
                    count = 1,
                },
            },
            ['equipment'] = {
                {
                    title = 'Termisk Ladning',
                    description = 'Eksplosiv til bankbokse',
                    icon = 'fa-solid fa-bomb',
                    item = 'thermal_charge',
                    price = 20000,
                    count = 1,
                },
                {
                    title = 'Lockpick Sæt',
                    description = 'Professionelt dirk sæt',
                    icon = 'fa-solid fa-lock',
                    item = 'lockpick',
                    price = 3000,
                    count = 1,
                },
            },
        }
    }

}