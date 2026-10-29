local config = {
    storageVIP8 = 80000,
    msgReceive = "Parabens! Agora voce possui acesso VIP8!",
    msgAlready = "Voce ja possui VIP8."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(config.storageVIP8) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
        return true
    end

    player:setStorageValue(config.storageVIP8, 1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

    item:remove(1)

    return true
end