-- data/movements/scripts/castle24h_restricted.lua
-- Tile restrito: apenas a guild dominante pode passar

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return false end

    local guild = player:getGuild()
    local currentOwner = CASTLE24H:getGuildIdFromCastle()

    if currentOwner > 0 and (not guild or guild:getId() ~= currentOwner) then
        player:teleportTo(fromPosition, true)
        player:sendCancelMessage(CASTLE24H.messageGuildNotDominant)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    player:sendCancelMessage(CASTLE24H.castleName .. " " .. CASTLE24H.messageWelcome)
    return true
end