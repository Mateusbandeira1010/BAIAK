function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return false end

    if item.actionid == 2018 then
        local safePos = fromPosition
        local hour = tonumber(os.date("%H"))
        local isBattleTime = hour >= Castle48H.openHour and hour < Castle48H.closeHour

        if not isBattleTime then
            player:sendCancelMessage(Castle48H.messageCastleClosed)
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        local guild = player:getGuild()
        if not guild then
            player:sendCancelMessage(Castle48H.messageNoGuild)
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        if player:getLevel() < Castle48H.minLevel then
            player:sendCancelMessage(Castle48H.messageMinLevel)
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, Castle48H.messageWelcome)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    end

    return true
end