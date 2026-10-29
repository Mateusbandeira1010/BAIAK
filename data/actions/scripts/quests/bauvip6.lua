local config = {
    chestUid = 50004,        -- UniqueID do baú VIP6
    storageVIP6 = 60000,     -- storage exclusiva VIP6
    msgReceive = "Parabens! Agora voce e um VIP6!",
    msgAlready = "Voce ja e VIP6."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if item.uid ~= config.chestUid then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP6) or -1

    if vipStatus ~= 1 then
        player:setStorageValue(config.storageVIP6, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
    end

    return true
end