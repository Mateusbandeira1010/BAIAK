local config = {
    storageVIP4 = 40000,           -- mesma storage do baú VIP4
    actionId = 5722,               -- ActionID do tile
    teleportBack = Position(152, 55, 7),
    msgDenied = "Esta area e exclusiva para VIP4."
}

function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP4) or -1

    -- Se não for VIP4
    if vipStatus ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end