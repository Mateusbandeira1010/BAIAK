local config = {
    uniqueid = 60000,

    vocations = {
        [1] = {storage = 44855, spell = "Eternal Master Flam"},
        [5] = {storage = 44855, spell = "Eternal Master Flam"},

        [2] = {storage = 44854, spell = "Eternal Master Frigo"},
        [6] = {storage = 44854, spell = "Eternal Master Frigo"},

        [3] = {storage = 44856, spell = "Eternal Master San"},
        [7] = {storage = 44856, spell = "Eternal Master San"},

        [4] = {storage = 44857, spell = "Eternal Master Gran"},
        [8] = {storage = 44857, spell = "Eternal Master Gran"}
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local vocation = config.vocations[player:getVocation():getId()]

    if not vocation then
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "Sua vocacao nao pode receber uma das novas magias."
        )
        return true
    end

    local questStatus = player:getStorageValue(vocation.storage)

    if questStatus ~= 10 then
        player:setStorageValue(vocation.storage, 10)

        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "Voce desbloqueou a magia " .. vocation.spell .. "!"
        )

        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "Voce ja desbloqueou a magia " .. vocation.spell .. "."
        )
    end

    return true
end
