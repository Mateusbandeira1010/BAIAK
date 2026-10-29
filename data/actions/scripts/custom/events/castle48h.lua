function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.uid == 1999 then
        if not Castle48H:isOpen() then
            player:sendCancelMessage(Castle48H.messageCastleClosed)
            return true
        end

        local guild = player:getGuild()
        if not guild then
            player:sendCancelMessage(Castle48H.messageNoGuild)
            return true
        end

        if player:getLevel() < Castle48H.minLevel then
            player:sendCancelMessage(Castle48H.messageMinLevel)
            return true
        end

        if Castle48H:isDominating(player) then
            player:sendCancelMessage("Sua guild ja domina o castelo!")
            return true
        end

        Castle48H:domain(player)
        player:getPosition():sendMagicEffect(CONST_ME_CRAPS)
    end
    return true
end
