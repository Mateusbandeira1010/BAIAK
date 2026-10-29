local STORAGEVALUE_THUNDER_WAND = 50000

local elements = {
    {type = COMBAT_HOLYDAMAGE, distanceeffect = CONST_ANI_HOLY},
    {type = COMBAT_ICEDAMAGE, distanceeffect = CONST_ANI_ICE},
    {type = COMBAT_FIREDAMAGE, distanceeffect = CONST_ANI_FIRE},
    {type = COMBAT_ENERGYDAMAGE, distanceeffect = CONST_ANI_ENERGYBALL},
    {type = COMBAT_EARTHDAMAGE, distanceeffect = CONST_ANI_EARTH},
    {type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA, distanceeffect = CONST_ANI_SUDDENDEATH, condition = CONDITION_CURSED, targetcasterortopmost = true}
}

local combats = {}
for i = 1, #elements do
    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    combat:setParameter(COMBAT_PARAM_TYPE, elements[i].type)
    combat:setParameter(COMBAT_PARAM_EFFECT, elements[i].effect or CONST_ME_NONE)
    combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, elements[i].distanceeffect)
    combat:setFormula(COMBAT_FORMULA_DAMAGE, -640, 0, -800, 0)
    if elements[i].condition then
        local condition = Condition(elements[i].condition)
        condition:setParameter(CONDITION_PARAM_DELAYED, 1)
        combat:addCondition(condition)
    end
    table.insert(combats, combat)
end

function onUseWeapon(player, variant)
    local index = player:getStorageValue(STORAGEVALUE_THUNDER_WAND)

    if index == nil or index < 1 then
        index = 1
    end

    local combat = combats[index]
    if not combat then
        return false
    end

    return combat:execute(player, variant)
end