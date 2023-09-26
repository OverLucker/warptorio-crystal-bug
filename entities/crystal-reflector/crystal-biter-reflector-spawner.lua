local sounds = require("__base__.prototypes.entity.sounds")
local original_spawner = data.raw["unit-spawner"]["biter-spawner"]


local tint1 = {
    r = 0 / 256,
    g = 169 / 256,
    b = 191 / 256,
    a = 1
}

local spawner = {
    type = "unit-spawner",
    name = "crystal-biter-reflector-spawner",
    order = "s-c-a",
    icon = table.deepcopy(original_spawner["icon"]),
    icon_size = table.deepcopy(original_spawner["icon_size"]),
    flags = table.deepcopy(original_spawner["flags"]),
    map_color= tint1,
    max_health = table.deepcopy(original_spawner["max_health"]),
    subgroup = "enemies",
    resistances = {
        {
            type = "physical",
            decrease = 2,
            percent = 15 
        },
        {
            type = "explosion",
            decrease = 5,
            percent = 15
        },
        {
            type = "fire",
            decrease = 3,
            percent = 60
        },
        {
            type = "laser",
            decrease = 2,
            percent = 90
        }
    },
    working_sound = table.deepcopy(original_spawner["working_sound"]),
    dying_sound = table.deepcopy(original_spawner["dying_sound"]),

    healing_per_tick = 0.02,
    collision_box = table.deepcopy(original_spawner["collision_box"]),
    map_generator_bounding_box = table.deepcopy(original_spawner["map_generator_bounding_box"]),
    selection_box = table.deepcopy(original_spawner["selection_box"]),

    damaged_trigger_effect = table.deepcopy(original_spawner["damaged_trigger_effect"]),

    pollution_absorption_absolute = 20,
    pollution_absorption_proportional = 0.01,

    corpse = table.deepcopy(original_spawner["corpse"]),
    dying_explosion = table.deepcopy(original_spawner["dying_explosion"]),

    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,

    animations = table.deepcopy(original_spawner["animations"]),
    integration = table.deepcopy(original_spawner["integration"]),

    result_units = {
        {
            'small-crystal-biter-reflector',
            {
                {0, 0.3},
                {0.6, 0}
            }
        }
    },

    spawning_cooldown = {360, 150},
    spawning_radius = 10, 
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = table.deepcopy(original_spawner["autoplace"]),
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration = table.deepcopy(original_spawner["spawn_decoration"])
}

spawner.animations[1].layers[2].tint = tint1
spawner.animations[1].layers[2].hr_version.tint = tint1

spawner.animations[2].layers[2].tint = tint1
spawner.animations[2].layers[2].hr_version.tint = tint1

spawner.animations[3].layers[2].tint = tint1
spawner.animations[3].layers[2].hr_version.tint = tint1

spawner.animations[4].layers[2].tint = tint1
spawner.animations[4].layers[2].hr_version.tint = tint1

spawner.autoplace.order = "b[enemy]-b[crystal]"

return spawner
