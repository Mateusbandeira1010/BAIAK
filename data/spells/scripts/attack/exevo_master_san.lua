local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local function callback(player, level, magicLevel)
    local min = (level / 17) + (magicLevel * 21)
    local max = (level / 20) + (magicLevel * 25)
    return -min, -max
end

combat:setCallback(CallBackParam.LEVELMAGICVALUE, callback)

local combatArea = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
    {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

combat:setArea(createCombatArea(combatArea))

function onCastSpell(creature, variant)
    if (creature:getStorageValue(44856) or -1) < 10 then
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        creature:sendTextMessage(
            MESSAGE_STATUS_SMALL,
            "Voce nao possui essa magia pois nao fez a quest das novas magias 500+!"
        )
        return false
    end

    return combat:execute(creature, variant)
end
