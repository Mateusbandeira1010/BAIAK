function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local days = 2
    local storage = 23510

    local current = player:getStorageValue(storage)

    if not current or current == -1 or current < os.time() then
        current = os.time()
    end

    local newTime = current + (days * 24 * 60 * 60)

    player:setStorageValue(storage, newTime)

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc\xEA recebeu "..days.." dia(s) de VIP!")

    item:remove(1)
    return true
end