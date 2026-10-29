local config = {
    storageVIP2 = 20000,
    msgReceive = "Parabens! Agora voce e um VIP2!",
    msgAlready = "Voce ja e VIP2."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local vipStatus = player:getStorageValue(config.storageVIP2)

    -- Se nunca pegou (storage -1 ou diferente de 1)
    if vipStatus ~= 1 then
        player:setStorageValue(config.storageVIP2, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
    end

    return true
end