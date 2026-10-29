local config = {
    storageVIP3 = 30000, -- mesma storage usada no bau VIP3
    actionId = 15967,    -- actionid do tile VIP3
    teleportBack = Position(152, 55, 7),
    msgDenied = "Esta area e exclusiva para VIP3."
}

function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP3)

    -- Se não for VIP3
    if vipStatus ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end