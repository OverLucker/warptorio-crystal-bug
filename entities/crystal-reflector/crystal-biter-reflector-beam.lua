local sounds = require("__base__.prototypes.entity.sounds")
local original = data.raw["beam"]["laser-beam"]


local tint1 = {
    r = 0 / 256,
    g = 169 / 256,
    b = 191 / 256,
    a = 1
}

local beam = {
    type = "beam",
    name = "crystal-biter-reflector-beam",
    flags = table.deepcopy(original["flags"]),

    width = 0.5,

    damage_interval = 20,
    random_target_offset = true,
    action_triggered_automatically = false,

    action = table.deepcopy(original["action"]),
    head = table.deepcopy(original["head"]),
    tail = table.deepcopy(original["tail"]),
    body = table.deepcopy(original["body"]),

    light_animations = table.deepcopy(original["light_animations"]),
    ground_light_animations = table.deepcopy(original["ground_light_animations"]),
    working_sound = table.deepcopy(original["working_sound"])
}

return beam
