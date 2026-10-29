local stamina_full = 42

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local maxStamina = stamina_full * 60

    if player:getStamina() >= maxStamina then
        player:sendCancelMessage("Sua stamina ja esta cheia.")
        return true
    end

    -- Define stamina full
    player:setStamina(maxStamina)

    -- Mensagem
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Sua Stamina esta FULL!")

    -- Efeito visual
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

    return true
end