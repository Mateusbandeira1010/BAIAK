local DAMAGE_FORMULA = {-0.3, 0, -0.5, 0}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 53)

local AREA_FROZEN_HUR = {
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 1, 3, 1, 0, 0, 0}
}
combat:setArea(createCombatArea(AREA_FROZEN_HUR))

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, DAMAGE_FORMULA[1], DAMAGE_FORMULA[2], DAMAGE_FORMULA[3], DAMAGE_FORMULA[4])

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end