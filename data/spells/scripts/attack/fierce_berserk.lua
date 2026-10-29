local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local function callback(player, skill, attack, factor)
        local skillTotal = skill + (attack * 2)
        local levelTotal = player:getLevel() / 5
        local min = (skillTotal * 1.1) + levelTotal
        local max = (skillTotal * 3) + levelTotal
        return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, callback)

function onCastSpell(creature, variant) return combat:execute(creature, variant) end
