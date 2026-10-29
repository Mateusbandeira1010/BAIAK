function onUseWeapon(cid, var)
    local target = getCreatureTarget(cid)
    if target == 0 then
        return true
    end

    local min, max = 2500, 4000

    local fromPos = getThingPos(cid)
    local toPos = getThingPos(target)

    -- PROJÉTIL
    doSendDistanceShoot(fromPos, toPos, CONST_ANI_CAKE)

    -- IMPACTO
    addEvent(doSendMagicEffect, 50, toPos, CONST_ME_CAKE)

    -- DANO: usa posição atualizada do target no momento do dano
    addEvent(function()
        if not isCreature(target) then return end
        local currentPos = getThingPos(target)
        doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, currentPos, 0, -min, -max, CONST_ME_HITAREA)
    end, 100)

    return true
end