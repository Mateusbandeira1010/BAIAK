local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 27)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local function callback(player, skill, attack, factor)
        local skillTotal = skill + attack * 3
        local levelTotal = player:getLevel() / 6
        local min = (skillTotal * 1.2) + levelTotal
        local max = (skillTotal * 4) + levelTotal
        return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, callback)

function onCastSpell(creature, variant)
        return combat:execute(creature, variant)
end
