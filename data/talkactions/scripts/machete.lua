local config = {
    itemId = 2420, 
    price = 500
}

function onSay(player, words, param)
    -- Verifica se tem o dinheiro
    if not player:removeMoney(config.price) then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("Voce precisa de " .. config.price .. " gold coins para comprar uma machete.")
        return false
    end

    -- Tenta adicionar o item
    local item = player:addItem(config.itemId, 1)
    if item then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce comprou uma machete.")
    else
        -- Caso o player esteja sem espaço/cap, devolve o dinheiro
        player:addMoney(config.price)
        player:sendCancelMessage("Voce nao tem capacidade ou espaco no inventario.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end