function onLogout(player)
    local pos = player:getPosition()
    if pos.x >= 23 and pos.x <= 170 and
       pos.y >= 624 and pos.y <= 727 and
       pos.z == 7 then
        player:sendCancelMessage("Voc\xEA n\xE3o pode deslogar dentro do Castle 48H.")
        return false
    end
    return true
end