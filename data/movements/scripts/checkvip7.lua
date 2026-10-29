local config = {
    storageVIP7 = 70000,
    actionId    = 7526,
    teleportBack = Position(152, 55, 7),
    msgDenied   = "Esta area e exclusiva para VIP7."
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    if player:getStorageValue(config.storageVIP7) ~= 1 then
        local originalPos = player:getPosition()
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        originalPos:sendMagicEffect(CONST_ME_POFF)
    end

    return true
end