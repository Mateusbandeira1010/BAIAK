local config = {
    storage = 29001,
    allowedVocations = {1, 2, 3, 4, 5, 6, 7, 8}, -- todas as vocacoes
    chests = {
        [13001] = {
            items = {
                2526, -- Shield  — troque pelo id do seu servidor
                11303, -- Boots   — troque pelo id do seu servidor
            },
            name = "Shield e Boots"
        }
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
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
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc\xEA n\xE3o pode pegar estes itens.")
        return true
    end

    local questStatus = player:getStorageValue(config.storage)

    if questStatus ~= 1 then
        for i = 1, #chest.items do
            player:addItem(chest.items[i], 1)
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc\xEA achou o " .. chest.name .. ".")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:setStorageValue(config.storage, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc\xEA j\xE1 pegou seu Shield e Boots.")
    end

    return true
end
