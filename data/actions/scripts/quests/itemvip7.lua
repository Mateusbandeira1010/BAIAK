local config = {
    storageVIP7 = 70000,
    msgReceive = "Parabens! Agora voce possui acesso VIP7!",
    msgAlready = "Voce ja possui VIP7."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(config.storageVIP7) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
        return true
    end

    player:setStorageValue(config.storageVIP7, 1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    item:remove(1)

    return true
end