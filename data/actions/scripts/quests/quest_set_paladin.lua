local config = {
    storage = 1702,
    globalStorage = 5000, -- controla se já pegou algum set
    allowedVocations = {3}, -- Paladin
    chests = {
        [1702] = {items = {3971, 8880, 2507}, name = "Paladin Set"}
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
    end

    -- 🔒 BLOQUEIO GLOBAL
    if player:getStorageValue(config.globalStorage) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja escolheu um set.")
        return true
    end

    -- 🧠 VERIFICA VOCAÇÃO
    local vocation = player:getVocation():getId()
    local allowed = false

    for i = 1, #config.allowedVocations do
        if vocation == config.allowedVocations[i] then
            allowed = true
            break
        end
    end

    if not allowed then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Este bau e apenas para Paladins.")
        return true
    end

    local questStatus = player:getStorageValue(config.storage)

    if questStatus ~= 1 then
        for i = 1, #chest.items do
            player:addItem(chest.items[i], 1)
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
            "Voce achou o " .. chest.name .. ".")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

        -- marca que pegou
        player:setStorageValue(config.storage, 1)
        player:setStorageValue(config.globalStorage, 1)

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O bau esta vazio.")
    end

    return true
end