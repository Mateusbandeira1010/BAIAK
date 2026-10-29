function onSay(player, words, param)
    player:save()
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu personagem foi salvo com sucesso!")
    return false
end