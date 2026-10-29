local castleArea = {
    fromPos = Position(17, 219, 7), -- canto superior esquerdo da área do castelo
    toPos   = Position(76, 282, 7)  -- canto inferior direito da área do castelo
}

-- Posição para onde o jogador é expulso (fora do castelo)
local kickPosition = Position(152, 55, 7)

function onThink(interval)
    local ownerId = CASTLE24H:getGuildIdFromCastle()

    -- Se não tem dono, não expulsa ninguém
    if not ownerId or ownerId <= 0 then
        return true
    end

    local playersInArea = Game.getSpectators(castleArea.fromPos, false, true,
        0, castleArea.toPos.x - castleArea.fromPos.x,
        0, castleArea.toPos.y - castleArea.fromPos.y
    )

    for _, creature in ipairs(playersInArea) do
        local player = creature:getPlayer()
        if player then
            local guild = player:getGuild()

            -- Expulsa se não tiver guild ou se a guild for diferente da dona
            if not guild or guild:getId() ~= ownerId then
                player:teleportTo(kickPosition, true)
                player:sendCancelMessage(CASTLE24H.messageGuildNotDominant)
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
        end
    end

    return true
end