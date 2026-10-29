function onThink(interval)
    -- Mensagem que será enviada
    local message = "Est\xE1 sem sa\xEDda fale !fly e retorne ao TEMPLO"
    
    -- Envia a mensagem para todos os jogadores online
    for _, player in pairs(Game.getPlayers()) do
        player:sendTextMessage(MESSAGE_STATUS_WARNING, message)
    end

    return true
end