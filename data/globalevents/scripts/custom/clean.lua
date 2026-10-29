function Player.warnClean(self, x)
    if x <= 0 then return end
    
    self:say("Limpeza TOTAL em ".. x .. " segundos", TALKTYPE_MONSTER_SAY, false, self)

    local playerName = self:getName()
    addEvent(function()
        local player = Player(playerName)
        if player then
            player:warnClean(x - 5)
        end
    end, 5000)
end

function onThink(interval)
    -- Início dos avisos (5 minutos antes do intervalo de 3h acabar)
    Game.broadcastMessage('ALERTA: Limpeza completa do mapa em 5 minutos. Todos os items sera removido!', MESSAGE_STATUS_WARNING)
    
    addEvent(Game.broadcastMessage, 60000, 'Limpeza do mapa em 4 minutos. Limparemos zonas seguras e inseguras.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 120000, 'Limpeza do mapa em 3 minutos.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 180000, 'Limpeza do mapa em 2 minutos. Pegue seus itens do chão agora!', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 240000, 'Limpeza do mapa em 1 minuto. ULTIMO AVISO.', MESSAGE_STATUS_WARNING)
    addEvent(Game.broadcastMessage, 270000, 'LIMPEZA GERAL EM 30 SEGUNDOS!', MESSAGE_STATUS_WARNING)
    
    -- Contagem regressiva visual nos jogadores
    addEvent(function()
        for _, player in ipairs(Game.getPlayers()) do
            player:warnClean(30)
        end
    end, 270000)

    -- Execução da Limpeza Global
    addEvent(function()
        cleanMap() -- Este comando limpa o mapa completo se o config.lua permitir
        Game.broadcastMessage('O mapa foi completamente limpo para otimizar o desempenho. Proxima limpeza em 3 horas.', MESSAGE_STATUS_WARNING)
    end, 300000)

    return true
end