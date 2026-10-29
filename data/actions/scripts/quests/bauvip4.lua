local config = {
    chestUid = 50002,        -- UniqueID do baú
    storageVIP4 = 40000,     -- storage VIP4 (não use igual VIP3)
    msgReceive = "Parabens! Agora voce e um VIP4!",
    msgAlready = "Voce ja e VIP4."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if item.uid ~= config.chestUid then
        return true
    end

    local vipStatus = player:getStorageValue(config.storageVIP4) or -1

    if vipStatus ~= 1 then
        player:setStorageValue(config.storageVIP4, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgReceive)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgAlready)
    end

    return true
end