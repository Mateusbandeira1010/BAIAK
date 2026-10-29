local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local function callback(player, skill, attack, factor)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
        local min = ((distanceSkill + 40) / 6) + (player:getLevel() / 7)
        local max = (distanceSkill + 45) + (player:getLevel() / 8)
	return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, callback)

function onCastSpell(creature, variant) return combat:execute(creature, variant) end
