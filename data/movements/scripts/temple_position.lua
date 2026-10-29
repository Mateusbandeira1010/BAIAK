-- Lista de posições exatas que você passou
local positions = {
    [1] = Position(1139, 1051, 7),
    [2] = Position(1134, 1050, 7),
    [3] = Position(1139, 1046, 7),
    [4] = Position(1146, 1048, 7),
    [5] = Position(1135, 1045, 7),
    [6] = Position(1144, 1046, 7),
    [7] = Position(1141, 1052, 7),
    [8] = Position(1141, 1050, 7),
    [9] = Position(1124, 1050, 7),
    [10] = Position(1146, 1046, 7)
}

local lista = {"Movie"}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    
    -- Segurança: se não for um player (ex: um monstro), não faz nada
    if not player then
        return false
    end
    
    -- Se o player estiver na lista VIP, ele pode ficar parado
    if isInArray(lista, player:getName()) then
        return true
    end

    -- Sorteia uma das 10 posições da tabela acima
    local randPos = positions[math.random(#positions)]
    
    if randPos then
        player:teleportTo(randPos)
        randPos:sendMagicEffect(CONST_ME_TELEPORT)
    end

    return true
end