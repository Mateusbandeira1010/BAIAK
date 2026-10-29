function onPush(player, target)
    if player:getAccountType() > ACCOUNT_TYPE_SENIORTUTOR then
        return true
    end
    if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) or target:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("Voc\xEA n\xE3o pode empurrar players em protection zone.")
        return false
    end
    return true
end