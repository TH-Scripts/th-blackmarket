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
                description = 'Forskellige tilbehør til forskellige formål',
                icon = 'fa-solid fa-circle-info',
                iconColor = 'lightblue',
                subMenu = 'Tilbehør',
            },
        },

        SubMenus = {
            ['Våben'] = {
                {
                    id = "1",
                    title = 'Pistol',
                    description = 'Standard 9mm pistol',
                    icon = 'fa-solid fa-gun',
                    iconColor = 'lightblue',
                    item = 'weapon_pistol',
                    price = 15000,
                },
                {
                    id = "2",
                    title = 'SMG',
                    description = 'Kompakt automatvåben',
                    icon = 'fa-solid fa-gun',
                    iconColor = 'lightblue',
                    item = 'weapon_smg',
                    price = 25000,
                },
                {
                    id = "3",
                    title = 'AK-47',
                    description = 'Fuldt automatiseret automatvåben',
                    icon = 'fa-solid fa-gun',
                    iconColor = 'lightblue',
                    item = 'ammo_rifle',
                    price = 2500,
                },
            },
            ['Attachments'] = {
                {   
                    id = "1",
                    title = 'Hacking Laptop',
                    description = 'Modificeret laptop til hacking',
                    icon = 'fa-solid fa-laptop',
                    iconColor = 'lightblue',
                    item = 'hackinglaptop',
                    price = 12000,
                },
                {
                    id = "2",
                    title = 'USB Dongle',
                    description = 'Krypteret USB-nøgle',
                    icon = 'fa-brands fa-usb',
                    iconColor = 'lightblue',
                    item = 'usb_hack',
                    price = 4500,
                },
            },
            ['Tilbehør'] = {
                {
                    id = "1",
                    title = 'Skudsikker vest',
                    description = 'En skudsikker vest til at beskytte dig',
                    icon = 'fa-solid fa-vest',
                    iconColor = 'lightblue',
                    item = 'bulletproof_vest',
                    price = 20000,
                },  
                {
                    id = "2",
                    title = 'Lockpick Sæt',
                    description = 'Professionelt dirk sæt',
                    icon = 'fa-solid fa-lock',
                    iconColor = 'lightblue',
                    item = 'lockpick',
                    price = 3000,
                },
            },
        }
    }

}