function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local storage = 12435
    local maxLevel = 100
    
    -- Pega o valor atual da storage
    local value = player:getStorageValue(storage)
    local currentLevel = (not value or value < 0) and 0 or value
    
    if currentLevel < maxLevel then
        -- Tenta remover o item
        if item:remove(1) then
            player:setStorageValue(storage, currentLevel + 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED) -- Efeito visual vermelho
            player:sendCancelMessage("Critical skill aumentada para [" .. (currentLevel + 1) .. "/" .. maxLevel .. "].")
        end
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce atingiu o nivel maximo de Critical.")
        return false
    end
    return true
end