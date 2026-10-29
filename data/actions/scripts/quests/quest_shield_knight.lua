local config = {
    storage = 1717,
    globalStorage = 6007,
    allowedVocations = {4, 8}, -- Knight e Elite Knight
    chests = {
        [1717] = {items = {7460}, name = "Knight Shield"}
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
    end

    if player:getStorageValue(config.globalStorage) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja pegou seu shield.")
        return true
    end

    local vocation = player:getVocation():getId()
    local allowed = false

    for i = 1, #config.allowedVocations do
        if vocation == config.allowedVocations[i] then
            allowed = true
            break
        end
    end

    if not allowed then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Este bau e apenas para Knights.")
        return true
    end

    local questStatus = player:getStorageValue(config.storage)

    if questStatus ~= 1 then
        for i = 1, #chest.items do
            player:addItem(chest.items[i], 1)
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce achou o " .. chest.name .. ".")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

        player:setStorageValue(config.storage, 1)
        player:setStorageValue(config.globalStorage, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O bau esta vazio.")
    end

    return true
end