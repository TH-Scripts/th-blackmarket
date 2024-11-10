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
                description = 'Våben',
                icon = 'fa-solid fa-gun',
                subMenu = 'weapon',
            },
            {
                title = 'Kokain',
                description = 'Kokain',
                icon = 'fa-solid fa-gun',
                subMenu = 'cocaine',
            },
            {
                title = 'Drugs',
                description = 'Drugs',
                icon = 'fa-solid fa-gun',
                subMenu = 'drugs',
            },
        },

        SubMenus = {
            ['weapon'] = {
                {
                    title = 'Våben',
                    description = 'Våben',
                    icon = 'fa-solid fa-gun',
                    item = 'weapon_pistol',
                    price = 1000,
                    count = 1,
                }
            },
            ['cocaine'] = {
                {
                    title = 'Kokain',
                    description = 'Kokain',
                    icon = 'fa-solid fa-gun',
                    item = 'weapon_pistol',
                    price = 1000,
                }
            },
            ['drugs'] = {
                {
                    title = 'Drugs',
                    description = 'Drugs',
                    icon = 'fa-solid fa-gun',
                    item = 'weapon_pistol',
                    price = 1000,   
                }
            },
        }
    }

}