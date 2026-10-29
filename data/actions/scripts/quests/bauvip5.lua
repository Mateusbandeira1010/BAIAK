local config = {
    chestUid = 50003,        -- UniqueID do baú
    storageVIP5 = 50000,     -- storage exclusiva VIP5
    msgReceive = "Parabens! Agora voce e um VIP5!",
    msgAlready = "Voce ja e VIP5."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if item.uid ~= config.chestUid then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP5) or -1

    if vipStatus ~= 1 then
        player:setStorageValue(config.storageVIP5, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
    end

    return true
end