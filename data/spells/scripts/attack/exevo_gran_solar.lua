local DAMAGE_FORMULA = {-0.3, 0, -0.5, 0}

local function createDirectionalCombat()
    local c = Combat()
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
    c:setFormula(COMBAT_FORMULA_LEVELMAGIC, DAMAGE_FORMULA[1], DAMAGE_FORMULA[2], DAMAGE_FORMULA[3], DAMAGE_FORMULA[4])
    return c
end

function onCastSpell(creature, var)
    local pos = creature:getPosition()

    local directions = {
        {dx = 0,  dy = -1, max = 1},
        {dx = 0,  dy =  1, max = 1},
        {dx =  1, dy = 0,  max = 1},
        {dx = -1, dy = 0,  max = 1},
        {dx =  1, dy = -1, max = 2},
        {dx = -1, dy = -1, max = 2},
        {dx =  1, dy =  1, max = 2},
        {dx = -1, dy =  1, max = 2},
    }

    for _, dir in ipairs(directions) do
        for i = 1, dir.max do
            local target = Position(pos.x + (dir.dx * i), pos.y + (dir.dy * i), pos.z)

            pos:sendDistanceEffect(target, CONST_ANI_HOLY)

            local tile = Tile(target)          -- ✅ guarda em variável
            if tile then                       -- ✅ verifica se o tile existe
                local tileCreatures = tile:getCreatures()
                if tileCreatures then
                    for _, tileCreature in ipairs(tileCreatures) do
                        if tileCreature ~= creature then
                            local combat = createDirectionalCombat()
                            combat:execute(creature, Variant(tileCreature:getId()))
                        end
                    end
                end
            end
        end
    end

    return true
end