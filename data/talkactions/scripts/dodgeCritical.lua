function onSay(player, words, param)
    local storageDodge = 12614
    local storageCrit = 12435

    if words == "!dodge" then
        local value = player:getStorageValue(storageDodge)
        local skill = (not value or value < 0) and 0 or value
        local message = "--- DODGE SYSTEM ---\n\nNivel: [" .. skill .. "/100]\nChance: " .. (skill * 0.3) .. "%\n\nO Dodge permite que voce desvie de ataques completamente."
        
        player:popupFYI(message) -- Janela segura que não crasha o cliente

    elseif words == "!critical" then
        local value = player:getStorageValue(storageCrit)
        local skill = (not value or value < 0) and 0 or value
        local message = "--- CRITICAL SYSTEM ---\n\nNivel: [" .. skill .. "/100]\nChance: " .. (skill * 0.3) .. "%\n\nO Critical aumenta o seu dano final."
        
        player:popupFYI(message)
    end
    
    return false
end