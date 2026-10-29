local config = {
    itemId = 1988, -- ID da Backpack
    price = 20,    -- Preço em gold (coloque 0 para ser de graça)
    effect = CONST_ME_MAGIC_BLUE
}

function onSay(player, words, param)
    -- Verifica se tem dinheiro (caso o preço seja maior que 0)
    if config.price > 0 and not player:removeMoney(config.price) then
        player:sendCancelMessage("Voce precisa de " .. config.price .. " gold coins para comprar uma backpack.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Tenta adicionar o item
    local backpack = player:addItem(config.itemId, 1)
    
    if backpack then
        player:getPosition():sendMagicEffect(config.effect)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce comprou uma backpack.")
    else
        -- Caso o player esteja sem CAP ou inventário cheio, devolve o dinheiro
        if config.price > 0 then
            player:addMoney(config.price)
        end
        player:sendCancelMessage("Voce nao tem capacidade ou espaco no inventario.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end