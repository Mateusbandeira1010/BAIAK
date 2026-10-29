function onSay(player, words, param)
    saveServer()
    Game.broadcastMessage("Server foi salvo por " .. player:getName() .. ".", MESSAGE_STATUS_WARNING)
    return false
end