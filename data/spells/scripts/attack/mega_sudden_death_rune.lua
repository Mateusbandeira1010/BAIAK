local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

local function callback(player, level, magicLevel)
	-- Dano "Mega" - aproximadamente o dobro do Sudden Death normal
local min = (level / 1) + (magicLevel * 35) + 1000
local max = (level / 1) + (magicLevel * 50) + 2000
	return -min, -max
end

combat:setCallback(CallBackParam.LEVELMAGICVALUE, callback)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
