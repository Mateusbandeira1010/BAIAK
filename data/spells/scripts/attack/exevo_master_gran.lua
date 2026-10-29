local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 27)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local combatArea = {
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 2, 1, 1, 1},
    {0, 1, 1, 1, 1, 1, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0}
}

combat:setArea(createCombatArea(combatArea))

local function callback(player, skill, attack, factor)
    local skillTotal = skill + attack * 3
    local levelTotal = player:getLevel() / 6

    local min = (skillTotal * 1.05) + levelTotal
    local max = (skillTotal * 3.85) + levelTotal

    return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, callback)

function onCastSpell(creature, variant)
    if (creature:getStorageValue(44857) or -1) < 10 then
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        creature:sendTextMessage(
            MESSAGE_STATUS_SMALL,
            "Voce nao possui essa magia pois nao fez a quest das novas magias 500+!"
        )
        return false
    end

    return combat:execute(creature, variant)
end
