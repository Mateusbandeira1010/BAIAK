local posInicio = {x = 728, y = 310, z = 7}
local posFim = {x = 752, y = 334, z = 7}
local posExitTime = Position(769, 325, 7)

local ResetArea = nil

local function verificaPlayers()
    for x = posInicio.x, posFim.x do
        for y = posInicio.y, posFim.y do
            local tile = Tile(Position(x, y, posInicio.z))
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature:isPlayer() then
                    return true
                end
            end
        end
    end
    return false
end

local function verificaBoss()
    for x = posInicio.x, posFim.x do
        for y = posInicio.y, posFim.y do
            local tile = Tile(Position(x, y, posInicio.z))
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature:isMonster() then
                    creature:remove()
                end
            end
        end
    end
end

local function removePlayersTime()
    for x = posInicio.x, posFim.x do
        for y = posInicio.y, posFim.y do
            local tile = Tile(Position(x, y, posInicio.z))
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature:isPlayer() then
                    creature:teleportTo(posExitTime)
                end
            end
        end
    end
    posExitTime:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

function onUse(cid, item, frompos, item2, topos)

    local player = Player(cid)
    if not player then return true end

    if item.actionid == 5160 then

        local config = {
            [1] = {pos = Position(767, 314, 7)},
            [2] = {pos = Position(767, 315, 7)},
            [3] = {pos = Position(767, 316, 7)},
            [4] = {pos = Position(767, 317, 7)},
            [5] = {pos = Position(767, 318, 7)},
        }

        local stoExhaust = 5160441
        local storageTime = 5160440
        local bossPos = Position(740, 321, 7)
        local teleportInPos = Position(739, 312, 7)

        local stoVal = player:getStorageValue(stoExhaust)
        if stoVal and stoVal > os.time() then
            player:sendCancelMessage("You have to wait " .. stoVal - os.time() .. " seconds to try again.")
            return true
        end

        if verificaPlayers() then
            player:sendCancelMessage("There are other players inside the room at the moment.")
            Position(topos.x, topos.y, topos.z):sendMagicEffect(CONST_ME_POFF)
            player:setStorageValue(stoExhaust, os.time() + 5)
            return true
        end

        local playerChecked = false
        local teleportToRoom = false

        for i, v in pairs(config) do
            local tile = Tile(v.pos)
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature:isPlayer() then
                    local p = Player(creature:getId())
                    if p then
                        local pSto = p:getStorageValue(storageTime)
                        if pSto and pSto > os.time() then
                            local time = (pSto - os.time()) / 60
                            local str = "minutes"
                            if time > 60 then
                                time = time / 60
                                str = "hours"
                            end
                            local name = (creature:getId() == player:getId()) and "You" or p:getName()
                            player:sendCancelMessage(name .. " need to wait more " .. math.floor(time + 0.5) .. " " .. str .. " to do again.")
                            Position(topos.x, topos.y, topos.z):sendMagicEffect(CONST_ME_POFF)
                            return true
                        end
                        if creature:getId() == player:getId() then
                            playerChecked = true
                        end
                    end
                end
            end
        end

        if playerChecked then
            for i, v in pairs(config) do
                local tile = Tile(v.pos)
                if tile then
                    local creature = tile:getTopCreature()
                    if creature and creature:isPlayer() then
                        local p = Player(creature:getId())
                        if p then
                            creature:getPosition():sendMagicEffect(CONST_ME_POFF)
                            p:teleportTo(teleportInPos)
                            p:setStorageValue(storageTime, os.time() + 72000)
                            teleportToRoom = true
                        end
                    end
                end
            end

            if teleportToRoom then
                if ResetArea then
                    stopEvent(ResetArea)
                    ResetArea = nil
                end
                verificaBoss()
                bossPos:sendMagicEffect(CONST_ME_TELEPORT)
                Game.createMonster("Boss Dazed Leaf Golem", bossPos)
                ResetArea = addEvent(function()
                    removePlayersTime()
                    ResetArea = nil
                end, 20 * 60 * 1000)
            end
        else
            player:sendCancelMessage("You need to stand in the lever position.")
            Position(topos.x, topos.y, topos.z):sendMagicEffect(CONST_ME_POFF)
        end

        return true
    end

    return true
end