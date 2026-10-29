function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local sto = player:getStorageValue(722362)

    if sto and sto > os.time() then
        player:sendCancelMessage("Voc\195\170 j\195\161 est\195\161 recebendo o dobro de xp.")
        return true
    end

    item:remove(1)

    player:setStorageValue(722362, os.time() + 3600 * 2)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc\195\170 recebeu 2x exp por 2 horas.")
    fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)

    addEvent(function()
        local p = Player(player:getName())
        if p then
            p:setStorageValue(722362, -1)
            p:sendTextMessage(MESSAGE_INFO_DESCR, "O efeito acabou e voc\195\170 voltou a receber exp normalmente.")
        end
    end, 120 * 60 * 1000)

    return true
end