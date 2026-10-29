local config = {
    storageVIP = 13545,
    msgDenied = "Voc\xEA n\xE3o \xE9 vip, para adquirir sua vip fale !buyvip1.",
    msgWelcome = "Seja Bem-Vindo a Area VIP."
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local vipTime = player:getStorageValue(config.storageVIP)

    -- Blindagem contra NIL
    if not vipTime or vipTime < 0 then
        vipTime = 0
    end

    if vipTime <= os.time() then
        player:teleportTo(fromPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgDenied)
        fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgWelcome)
    return true
end