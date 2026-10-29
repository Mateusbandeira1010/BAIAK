local DAMAGE_FORMULA = {-0.5, 0, -0.8, 0}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, DAMAGE_FORMULA[1], DAMAGE_FORMULA[2], DAMAGE_FORMULA[3], DAMAGE_FORMULA[4])

combat:setArea(createCombatArea({
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 1, 3, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1},  -- 3 = centro do player
    {0, 1, 1, 1, 1, 1, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0}
}))

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 2000)
condition:setFormula(-1, 80, -1, 80)
combat:addCondition(condition)

function onCastSpell(creature, var)
    return combat:execute(creature, var)
end