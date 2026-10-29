local config = {
    storage = 226300,
    chests = {
        [50005] = {itemId = 2263, name = "Mega SD"}
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
    end

    if player:getStorageValue(config.storage) ~= 1 then
        player:addItem(chest.itemId, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            "Voce achou uma Mega SD!")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:setStorageValue(config.storage, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O bau esta vazio.")
    end

    return true
end