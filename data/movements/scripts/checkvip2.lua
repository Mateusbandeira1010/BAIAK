local config = {
    storageVIP2 = 20000, -- mesma storage do baú
    actionId = 13540,    -- actionid do tile
    teleportBack = Position(152, 55, 7),
    msgDenied = "Est\xE1 \xE1rea \xE9 exclusiva para VIP2. Faca a quest VIP2."
}

function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP2)

    -- Se não for VIP2
    if vipStatus ~= 1 then
        player:teleportTo(config.teleportBack)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end