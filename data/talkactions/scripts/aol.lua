local price = 10000
local aolId = 2173

function onSay(player, words, param)
    -- Verifica se o player existe
    if not player then
        return false
    end

    -- Tenta remover o dinheiro
    if player:removeMoney(price) then
        player:addItem(aolId, 1)
        
        -- Efeitos e mensagens
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        player:say("Amulet of Loss!", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce comprou um Amulet of Loss por 10k.")
    else
        -- Caso não tenha dinheiro
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("Voce nao tem dinheiro suficiente (10k).")
    end

    return false
end