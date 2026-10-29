function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local days = 30
    local storage = 23510

    local current = tonumber(player:getStorageValue(storage)) or 0

    if current < os.time() then
        current = os.time()
    end

    local newTime = current + (days * 24 * 60 * 60)

    player:setStorageValue(storage, newTime)

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc\xEA recebeu "..days.." dias de VIP!")

    item:remove(1)
    return true
end