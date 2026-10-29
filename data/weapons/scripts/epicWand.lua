function onUseWeapon(cid, var)
    local target = getCreatureTarget(cid)
    if target == 0 then
        return true
    end

    local min, max = 1750, 2500

    local fromPos = getThingPos(cid)
    local toPos = getThingPos(target)

    doSendDistanceShoot(fromPos, toPos, 30)

    addEvent(doSendMagicEffect, 21, toPos, 21)

    addEvent(function()
        if not isCreature(target) then return end
        local currentPos = getThingPos(target)
        doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, currentPos, 0, -min, -max, CONST_ME_HITAREA)
    end, 100)

    return true
end