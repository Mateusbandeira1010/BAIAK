local config = {
    storageVIP6 = 60000,
    actionId = 7525,  -- escolha o ActionID do tile VIP6
    teleportBack = Position(152, 55, 7),
    msgDenied = "Esta area e exclusiva para VIP6."
}

function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    if player:getStorageValue(config.storageVIP6) ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end