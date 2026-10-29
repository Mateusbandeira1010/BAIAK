local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local condition = Condition(CONDITION_CURSED)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
combat:addCondition(condition)

local function callback(player, level, magicLevel)
local min = level + (magicLevel * 5) + 4
local max = level + (magicLevel * 12) + 9
	return -min, -max
end

combat:setCallback(CallBackParam.LEVELMAGICVALUE, callback)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
