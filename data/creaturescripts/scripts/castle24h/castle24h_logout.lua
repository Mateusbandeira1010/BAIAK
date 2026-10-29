function onLogout(player)
    local pos = player:getPosition()
    if pos.x >= 0 and pos.x <= 77 and
       pos.y >= 5 and pos.y <= 104 and
       pos.z >= 4 and pos.z <= 7 then
        player:sendCancelMessage("Voc\xEA n\xE3o pode deslogar dentro do Castle.")
        return false
    end
    return true
end