function onSay(player, words, param)
    -- Obtém a condição de combate (PZ Lock)
    local pzLock = player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

    -- Verifica se a condição existe
    if not pzLock then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce esta sem PZ.")
        return false
    end

    -- Obtém o tempo restante em milissegundos e converte para segundos
    local ticks = pzLock:getTicks()
    local remainingTime = math.ceil(ticks / 1000)

    -- Verifica se o tempo é válido (caso a condição esteja expirando no exato momento)
    if remainingTime <= 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu PZ acabou de sair.")
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 
            string.format("Voce ainda tem %d segundos de PZ.", remainingTime)
        )
    end

    return false
end