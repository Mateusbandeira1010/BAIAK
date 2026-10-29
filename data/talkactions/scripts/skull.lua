function onSay(cid, words, param)
    local player = Player(cid)
    if not player then
        return false
    end

    local cost = 20000000 --20kk
    local skull = player:getSkull()

    -- Verifica se o player está sem skull
    if skull == SKULL_NONE then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao tem skull para remover.")
        return true
    end

    -- Verifica se o player tem o dinheiro
    if not player:removeMoney(cost) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisa de 1kk para remover a skull.")
        return true
    end

    -- Remove a Skull visualmente
    player:setSkull(SKULL_NONE)

    -- CORREÇÃO DO ERRO: Tenta setSkullTime, se não existir tenta setSkullEnd
    if player.setSkullTime then
        player:setSkullTime(0)
    elseif player.setSkullEnd then
        player:setSkullEnd(0)
    end
    
    -- Força a limpeza na Database para garantir que não volte ao relogar
    db.query("UPDATE `players` SET `skull` = 0, `skulltime` = 0 WHERE `id` = " .. player:getGuid())

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Sua skull foi removida com sucesso!")
    
    return true
end