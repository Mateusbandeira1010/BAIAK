function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local storage = 12614
    local maxLevel = 100
    local value = player:getStorageValue(storage)
    local currentLevel = (not value or value < 0) and 0 or value
    
    if currentLevel < maxLevel then
        item:remove(1)
        player:getPosition():sendMagicEffect(114)
        player:setStorageValue(storage, currentLevel + 1)
         player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE) 
        player:sendCancelMessage("Dodge skill aumentada para [" .. (currentLevel + 1) .. "/" .. maxLevel .. "].")
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce atingiu o nivel maximo de Dodge.")
        return false
    end
    return true
end