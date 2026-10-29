-- data/movements/scripts/castle24h_dominate.lua
-- Tile de dominação: pisar aqui conquista o castelo
-- CORRIGIDO: usa setOwnerGuild() que garante WHERE id = 1 no UPDATE
-- NOVO: broadcast informa bônus de 20% XP para a guild conquistadora

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return false end

    local guild = player:getGuild()
    if not guild then return false end

    if CASTLE24H.levelRequiredToDominate and player:getLevel() < CASTLE24H.level then
        player:sendCancelMessage(CASTLE24H.messageMinimumLevel)
        return false
    end

    local guildId = guild:getId()
    local currentOwner = CASTLE24H:getGuildIdFromCastle()

    if guildId ~= currentOwner then
        -- Corrigido: usa setOwnerGuild que garante WHERE id = 1
        CASTLE24H:setOwnerGuild(guildId, guild:getName())
        Game.broadcastMessage(
            CASTLE24H.castleName .. " A guild " .. guild:getName() ..
            " dominou o castelo e recebeu " .. CASTLE24H.bonusXP ..
            "% a mais de experiencia!",
            MESSAGE_STATUS_WARNING
        )
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
    end
    return true
end