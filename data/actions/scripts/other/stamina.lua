local stamina_full = 42

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStamina() >= (stamina_full * 60) then
        player:sendCancelMessage("Sua stamina ja esta cheia.")
        return true
    end

    player:setStamina(stamina_full * 60)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Sua stamina foi regenerada!")
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
    item:remove(1)

    return true
end