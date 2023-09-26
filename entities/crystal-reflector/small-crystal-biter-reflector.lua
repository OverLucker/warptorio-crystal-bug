
local sounds = require("__base__.prototypes.entity.sounds")
local original = data.raw["unit"]["small-biter"]


local tint1 = {
    r = 0 / 256,
    g = 169 / 256,
    b = 191 / 256,
    a = 1
}


local biter = {
    type = "unit",
    name = "small-crystal-biter-reflector",
    order = "b-c-a",
    icon = table.deepcopy(original["icon"]),
    icon_size = table.deepcopy(original["icon_size"]),
    flags = table.deepcopy(original["flags"]),
    map_color= tint1,
    max_health = table.deepcopy(original['health']),
    subgroup = "enemies",
    resistances = table.deepcopy(original["resistances"]),
    healing_per_tick = table.deepcopy(original["healing_per_tick"]),
    run_animation = table.deepcopy(original["run_animation"]),
    collision_box = table.deepcopy(original["collision_box"]),

    selection_box = table.deepcopy(original["selection_box"]),
    sticker_box = table.deepcopy(original["sticker_box"]),
    distraction_cooldown = table.deepcopy(original["distraction_cooldown"]),
    min_pursue_time = table.deepcopy(original["min_pursue_time"]),
    max_pursue_distance = table.deepcopy(original["max_pursue_distance"]),
    attack_parameters = table.deepcopy(original["attack_parameters"]),
    vision_distance = table.deepcopy(original["vision_distance"]),
    movement_speed = table.deepcopy(original["movement_speed"]),
    distance_per_frame = table.deepcopy(original["distance_per_frame"]),

    pollution_to_join_attack = table.deepcopy(original["pollution_to_join_attack"]),
    corpse = table.deepcopy(original["corpse"]),
    dying_explosion = table.deepcopy(original["dying_explosion"]),
    working_sound = sounds.biter_calls(0.4),
    dying_sound = sounds.biter_dying(0.9),
    ai_settings = biter_ai_settings,
    walking_sound = table.deepcopy(original["walking_sound"]),
    running_sound_animation_positions = {
        2
    },
    damaged_trigger_effect = table.deepcopy(original.damaged_trigger_effect)
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
