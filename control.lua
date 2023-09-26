local capacitor_capacity = {}
local reflector_beam = {}

local function capacitor_damaged(event)
    local key = event.entity.unit_number
    local source = event.entity
    if capacitor_capacity[key] then
        capacitor_capacity[key] = capacitor_capacity[key] + event.final_damage_amount
    else
        capacitor_capacity[key] = event.final_damage_amount
    end
end

local function capacitor_died(event)
    local source = event.entity
    local damage_collected = capacitor_capacity[source.unit_number]
    if damage_collected then
        local surface = source.surface
        local target = source.surface.find_nearest_enemy_entity_with_owner{
            position = source.position, 
            max_distance=100,
            force = source.force
        }
        if target then
            target.damage(
                damage_collected,
                source.force,
                'laser',
                source
            )
        end
    end
end

local function reflector_damaged(event)
    local source = event.entity
    local surface = source.surface
    local key = event.entity.unit_number

    if event.cause and event.cause.name == "small-crystal-biter-reflector" then
        return
    end

    local target = source.surface.find_nearest_enemy_entity_with_owner{
        position = source.position, 
        max_distance=10,
        force = source.force
    }
    if target then
        local final_damage = math.min(0.6 * event.final_damage_amount, source.health)
        target.damage(
            final_damage, 
            event.entity.force, 
            event.damage_type.name, 
            event.entity
        )
        if target.valid then
            if reflector_beam[key] and reflector_beam[key].valid then
                reflector_beam[key].set_beam_target(target)
            else
                reflector_beam[key] = surface.create_entity{
                    name = "crystal-biter-reflector-beam", 
                    source = source,
                    position = source.position,
                    target = target, 
                    force = game.forces['enemy']
                }
            end
        end
    else
        if reflector_beam[key] and reflector_beam[key].valid then
            reflector_beam[key].destroy()
            table.remove(reflector_beam, key)
        end
    end
end

local function reflector_died(event)
    local key = event.entity.unit_number
    if reflector_beam[key] and reflector_beam[key].valid then
        reflector_beam[key].destroy()
        table.remove(reflector_beam, key)
    end
end

local function on_entity_damaged(event)
    if event.entity.name == "small-crystal-biter-reflector" then
        reflector_damaged(event)
    end
    if event.entity.name == "small-crystal-biter-capacitor" then
        capacitor_damaged(event)
    end
end

local function on_entity_died(event)
    if event.entity.name == "small-crystal-biter-reflector" then
        reflector_died(event)
    end
    if event.entity.name == "small-crystal-biter-capacitor" then
        capacitor_died(event)
    end
end

script.on_event(
    defines.events.on_entity_damaged,
    on_entity_damaged,
    {
        {
            filter = "type",
            type = 'unit',
            mode = "and"
        },
        {
            filter = "damage-type",
            type = "laser",
            mode = "and"
        },
        {
            filter = "name",
            name = "small-crystal-biter-reflector",
            mode = "and"
        },
        {
            filter = "name",
            name = "small-crystal-biter-capacitor",
            mode = "or"
        },
    }
)

script.on_event(
    defines.events.on_entity_died,
    on_entity_died,
    {
        {
            filter = "type",
            type = 'unit',
            mode = "and"
        },
        {
            filter = "name",
            name = "small-crystal-biter-reflector",
            mode = "and"
        },
        {
            filter = "name",
            name = "small-crystal-biter-capacitor",
            mode = "or"
        },
    }
)
