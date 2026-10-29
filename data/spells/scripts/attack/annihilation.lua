local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local function callback(player, skill, attack, factor)
	local skillTotal = skill + attack * 3
        local levelTotal = player:getLevel() / 6
        local min = (skillTotal * 1.2) + levelTotal
        local max = (skillTotal * 4) + levelTotal
	return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, callback)

function onCastSpell(creature, variant) return combat:execute(creature, variant) end
