local config = {
    storageVIP = 13545,
    daysToAdd = 30,
    costInCrystal = 100,
    itemID = 2160,
    msgSuccess = "Voce comprou 30 dias de VIP por 1kk!",
    msgNoMoney = "Voce nao tem 100 Crystal Coins (1kk).",
    msgAlreadyVip = "Voce ja possui VIP ativo."
}

function onSay(player, words, param)

    local currentVipTime = player:getStorageValue(config.storageVIP)

    -- Blindagem contra NIL
    if not currentVipTime or currentVipTime < 0 then
        currentVipTime = 0
    end

    -- Se já tiver VIP
    if currentVipTime > os.time() then
        local daysLeft = math.ceil((currentVipTime - os.time()) / 86400)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            config.msgAlreadyVip .. " Dias restantes: " .. daysLeft)
        return false
    end

    -- Remove crystals com verificação segura
    if not player:removeItem(config.itemID, config.costInCrystal) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgNoMoney)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local timeToAdd = config.daysToAdd * 86400
    local newVipTime = os.time() + timeToAdd

    player:setStorageValue(config.storageVIP, newVipTime)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.msgSuccess)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    return false
end