local config = {
    storage = 1701, -- seu storage do baú
    globalStorage = 5000, -- NOVO: controla se já pegou algum set
    allowedVocations = {1, 2}, -- Sorcerer e Druid
    chests = {
        [1701] = {items = {7939, 7899, 7894}, name = "Mage Set"}
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
    end

    -- 🔒 BLOQUEIO GLOBAL (não pode pegar outro set)
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
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Este bau e apenas para Mages.")
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

        -- marca os dois
        player:setStorageValue(config.storage, 1)
        player:setStorageValue(config.globalStorage, 1)

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O bau esta vazio.")
    end

    return true
end