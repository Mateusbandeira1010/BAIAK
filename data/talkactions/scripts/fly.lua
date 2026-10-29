function onSay(player, words, param)
    -- Eventos que impedem o uso do fly
    if player:getStorageValue(71) == 1 or player:getStorageValue(72) == 1
       or player:getStorageValue(82) == 1 or player:getStorageValue(83) == 1 then
        player:sendCancelMessage("You cannot use !fly during Capture the Flag event.")
        return true
    end

    if player:getStorageValue(1236664) == 1 then
        player:sendCancelMessage("You cannot use !fly during Acerte o Alvo event.")
        return true
    end

    local config = {
        pz = true,      -- players precisam estar em protection zone
        battle = true   -- players devem estar sem battle
    }

    local templePos = Position(160, 54, 7) -- posição do templo

    -- Verificar se o jogador está em PZ
    if config.pz and not player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You need to be in a protection zone to use !fly.")
        return true
    end

    -- Verificar se o jogador está em batalha
    if config.battle and player:getCondition(CONDITION_INFIGHT) then
        player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You need to be out of battle to use !fly.")
        return true
    end

    -- Checar cooldown
    local cooldownTime = 60 -- em segundos
    local lastFly = player:getStorageValue(25786)

    -- Corrige nil ou -1
    if lastFly == nil or lastFly == -1 then
        lastFly = 0
    end

    local currentTime = os.time()
    local timeDifference = currentTime - lastFly
    if timeDifference < cooldownTime then
        local remainingTime = cooldownTime - timeDifference
        player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You need to wait " .. remainingTime .. " seconds to use !fly again.")
        return true
    end

    -- Atualiza o storage do último uso
    player:setStorageValue(25786, os.time())

    -- Teleportar o jogador com efeito clássico de cruz dourada
    player:teleportTo(templePos)
    templePos:sendMagicEffect(CONST_ME_TELEPORT)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    -- Mensagem confirmando o teleport
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have been teleported to the temple!")

    return true
end