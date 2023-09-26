local sounds = require("__base__.prototypes.entity.sounds")


local tint1 = {
    r = 170 / 256,
    g = 169 / 256,
    b = 191 / 256,
    a = 1
}

local health = 500


local biter = {
    type = "unit",
    name = "small-crystal-biter-capacitor",
    order = "a-a-a",
    icon = table.deepcopy(data.raw["unit"]["small-biter"]["icon"]),
    icon_size = table.deepcopy(data.raw["unit"]["small-biter"]["icon_size"]),
    flags = {
        "placeable-player",
        "placeable-enemy",
        "placeable-off-grid",
        "breaths-air",
        "not-repairable"
    },
    evergy_capacity = 0,
    map_color= tint1,
    max_health = health,
    subgroup = "enemies",
    resistances = {
        {
            type = "physical",
            decrease = 1 ,
            percent = 10 
        },
        {
            type = "explosion",
            decrease = 2 ,
            percent = 10
        },
        {
            type = "fire",
            decrease = 2,
            percent = 10
        },
        {
            type = "laser",
            decrease = 2,
            percent = 10
        }
    },
    healing_per_tick = 0,
    run_animation = table.deepcopy(data.raw["unit"]["small-biter"]["run_animation"]),
    collision_box = table.deepcopy(data.raw["unit"]["small-biter"]["collision_box"]),

    selection_box = table.deepcopy(data.raw["unit"]["small-biter"]["selection_box"]),
    sticker_box = table.deepcopy(data.raw["unit"]["small-biter"]["sticker_box"]),
    distraction_cooldown = 300,
    min_pursue_time = 20 * 60,
    max_pursue_distance = 80,
    attack_parameters = table.deepcopy(data.raw["unit"]["small-biter"]["attack_parameters"]),
    vision_distance = 30,
    movement_speed = 0.14,
    distance_per_frame = 0.105,

    pollution_to_join_attack = 4,
    corpse = table.deepcopy(data.raw["unit"]["small-biter"]["corpse"]),
    dying_explosion = table.deepcopy(data.raw["unit"]["small-biter"]["dying_explosion"]),
    working_sound = sounds.biter_calls(0.4),
    dying_sound = sounds.biter_dying(0.9),
    ai_settings = biter_ai_settings,
    walking_sound = sounds.biter_walk_big(0.2),
    running_sound_animation_positions = {
        2
    },
    damaged_trigger_effect = table.deepcopy(data.raw["unit"]["small-biter"].damaged_trigger_effect),
}

biter.run_animation.layers[2].tint = tint1
biter.run_animation.layers[2].hr_version.tint = tint1
biter.run_animation.layers[3].tint = tint1
biter.run_animation.layers[3].hr_version.tint = tint1

biter.attack_parameters.animation.layers[2].tint = tint1
biter.attack_parameters.animation.layers[2].hr_version.tint = tint1
biter.attack_parameters.animation.layers[3].tint = tint1
biter.attack_parameters.animation.layers[3].hr_version.tint = tint1

return biter
