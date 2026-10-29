function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return false end

    if item.actionid == 2019 then
        local safePos = fromPosition
        local ownerId = Castle48H:getOwnerGuildId() or 0
        local guild = player:getGuild()

        if not guild then
            player:sendCancelMessage(Castle48H.messageNoGuild)
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        if ownerId <= 0 then
            player:sendCancelMessage("O Castle 48H nao possui guild dominante no momento.")
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        if guild:getId() ~= ownerId then
            player:sendCancelMessage("Apenas a guild dominante pode acessar as hunts do Castle 48H.")
            player:teleportTo(safePos)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Bem-vindo as hunts do Castle 48H!")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    end

    return true
end