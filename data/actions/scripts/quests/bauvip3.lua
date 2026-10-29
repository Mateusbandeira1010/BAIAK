local config = {
    storageVIP3 = 30000, -- mude se quiser outro numero
    msgReceive = "Parabens! Agora voce e um VIP3!",
    msgAlready = "Voce ja e VIP3."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local vipStatus = player:getStorageValue(config.storageVIP3)

    if vipStatus ~= 1 then
        player:setStorageValue(config.storageVIP3, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
    end

    return true
end