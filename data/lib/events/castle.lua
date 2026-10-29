CASTLE24H = {
    castleName = "[Castle 24H]",
    messageNoGuild = "You are not part of any guild.",
    messageNeedGuild = "You are not part of any guild.",
    messageNeedsGuild = "You are not part of any guild.",
    messageGuildDominant = "The castle already belongs to your guild.",
    messageGuildNotDominant = "The castle does not belong to your guild.",
    messageMinimumLevel = "You do not have sufficient level to invade the castle.",
    messageWelcome = "Welcome to your castle.",

    levelRequiredToDominate = true,
    level = 100,
    warningTime = 10,
    bonusXP = 20  -- 20% de bonus de XP para a guild dominante
}

function CASTLE24H:getGuildIdFromCastle()
    local ownerId = Game.getStorageValue(GlobalStorageKeys.castle24hOwner)
    if ownerId and ownerId > 0 then
        return ownerId
    end

    -- Corrigido: filtra pelo id = 1 (castle 24H)
    local resultId = db.storeQuery("SELECT `guild_id` FROM `castle` WHERE `id` = 1 LIMIT 1;")
    if (resultId ~= false) then
        local guildId = result.getDataInt(resultId, "guild_id")
        result.free(resultId)
        Game.setStorageValue(GlobalStorageKeys.castle24hOwner, guildId)
        return guildId
    end
    return 0
end

function CASTLE24H:setOwnerGuild(guildId, guildName)
    if guildId and guildId > 0 then
        -- Corrigido: salva apenas no id = 1 (castle 24H)
        db.query("UPDATE `castle` SET `name` = " .. db.escapeString(guildName) .. ", `guild_id` = " .. guildId .. " WHERE `id` = 1")
        Game.setStorageValue(GlobalStorageKeys.castle24hOwner, guildId)
    else
        -- Corrigido: limpa apenas no id = 1 (castle 24H)
        db.query("UPDATE `castle` SET `name` = 'Ninguem', `guild_id` = 0 WHERE `id` = 1")
        Game.setStorageValue(GlobalStorageKeys.castle24hOwner, -1)
    end
end