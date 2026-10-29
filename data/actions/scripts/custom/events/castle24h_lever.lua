local corners = {
    {
        lever = Position(32, 41, 7),
        monster = Position(35, 40, 7)
    },
    {
        lever = Position(30, 31, 7),
        monster = Position(34, 34, 6)
    },
    {
        lever = Position(37, 31, 7),
        monster = Position(35, 34, 6)
    },
    {
        lever = Position(31, 31, 6),
        monster = Position(36, 34, 6)
    },
    {    
        lever = Position(31, 31, 5),
        monster = Position(34, 29, 6)
    },
    {    
        lever = Position(42, 47, 5),
        monster = Position(41, 52, 4)
    },
    {    
        lever = Position(24, 47, 5),
        monster = Position(25, 52, 4)
    }
    
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    -- Verifica se o jogador tem guilda
    local guild = player:getGuild()
    if not guild then
        player:sendCancelMessage(CASTLE24H.messageNoGuild)
        return true
    end

    -- Verifica se a guilda do jogador domina o castle
    local castleGuildId = CASTLE24H:getGuildIdFromCastle()
    if guild:getId() ~= castleGuildId then
        player:sendCancelMessage(CASTLE24H.messageGuildNotDominant)
        return true
    end

    -- Encontra qual canto corresponde a esta alavanca
    local corner = nil
    for _, c in ipairs(corners) do
        if fromPosition.x == c.lever.x and fromPosition.y == c.lever.y and fromPosition.z == c.lever.z then
            corner = c
            break
        end
    end

    if not corner then
        return true
    end

    -- Busca o monstro na posição do canto
    local tile = Tile(corner.monster)
    if not tile then
        player:sendCancelMessage("Nenhum guardiao encontrado neste canto.")
        return true
    end

    local creature = tile:getTopCreature()
    if creature and creature:isMonster() then
        creature:remove()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O guardiao do canto foi removido!")
    else
        player:sendCancelMessage("Nenhum guardiao encontrado neste canto.")
    end

    return true
end