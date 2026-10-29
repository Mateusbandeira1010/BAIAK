local config = {
    storageVIP5 = 50000,          -- mesma storage do baú VIP5
    actionId = 7520,              -- ActionID do tile VIP5
    teleportBack = Position(152, 55, 7),
    msgDenied = "Esta area e exclusiva para VIP5."
}

function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP5) or -1

    -- Se não for VIP5
    if vipStatus ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end