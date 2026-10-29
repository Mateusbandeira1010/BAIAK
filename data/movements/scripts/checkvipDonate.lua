function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local config = {
        msgDenied = "Voc\xEA n\xE3o tem VIP DONATE. Compre no nosso site ou realize a quest de 2 dias de vip.",
        msgWelcome = "Seja bem-vindo \xE0 area VIP DONATE!"
    }

    local pos = Position(152, 55, 7)

    local vipTime = player:getStorageValue(23510)

    -- TRATAMENTO DE ERRO
    if not vipTime or vipTime == -1 then
        vipTime = 0
    end

    if vipTime <= os.time() then
        player:teleportTo(pos)
        player:popupFYI(config.msgDenied)
        pos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
        return true
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
    return true
end