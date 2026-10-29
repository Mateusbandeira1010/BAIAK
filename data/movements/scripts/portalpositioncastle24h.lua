local config = {
    actionId = 9000, -- actionid do portal
    positions = {
        Position(61, 85, 6),
        Position(34, 99, 5),
        Position(8, 85, 6)
    }
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if item.actionid ~= config.actionId then
        return true
    end

    -- escolhe posição aleatória
    local randomPos = config.positions[math.random(#config.positions)]

    player:teleportTo(randomPos)
    randomPos:sendMagicEffect(CONST_ME_TELEPORT)

    return true
end