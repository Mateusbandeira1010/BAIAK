local config = {
    storageVIP8 = 80000, -- storage do VIP8
    actionId = 7527,     -- actionid do tile VIP8
    teleportBack = Position(152, 55, 7),
    msgDenied = "Esta area e exclusiva para VIP8."
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    if player:getStorageValue(config.storageVIP8) ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
    end

    return true
end