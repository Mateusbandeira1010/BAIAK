-- Função auxiliar para o contador visual sobre o player
local function warnSave(playerName, seconds)
    if seconds <= 0 then
        return
    end
    
    local player = Player(playerName)
    if player then
        -- Mensagem sobre a cabeça do jogador
        player:say("Server save in " .. seconds .. " seconds", TALKTYPE_MONSTER_SAY)
        
        -- Agenda o próximo aviso para daqui a 5 segundos
        addEvent(warnSave, 5000, playerName, seconds - 5)
    end
end

function onThink(interval)
    -- Avisos via Broadcast (Chat de aviso)
    Game.broadcastMessage('Server will save in 5 minutes.', MESSAGE_STATUS_WARNING)
    
    addEvent(Game.broadcastMessage, 60000, 'Server will save in 4 minutes.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 120000, 'Server will save in 3 minutes.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 180000, 'Server will save in 2 minutes.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 240000, 'Server will save in 1 minute.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 270000, 'Server will save in 30 seconds.', MESSAGE_STATUS_WARNING)

    -- Inicia o contador visual nos players faltando 30 segundos
    addEvent(function()
        for _, player in ipairs(Game.getPlayers()) do
            warnSave(player:getName(), 30)
        end
    end, 270000)

    -- Executa o Save do Servidor e mensagem final após 5 minutos
    addEvent(function()
        saveServer() -- Função interna do motor para salvar players e mapa
        Game.broadcastMessage('Server has been saved. Have a good game.', MESSAGE_STATUS_WARNING)
    end, 300000)

    return true
end