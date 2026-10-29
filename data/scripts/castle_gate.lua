local castleGate = CreatureEvent("CastleGateDeath")

function castleGate.onDeath(creature, corpse, killer, mostDamageKiller)

    if creature:getName():lower() ~= "castle crystal" then
        return true
    end

    -- Salva a posição antes do monstro sumir
    local spawnPos = creature:getPosition()

    -- Dominação da guild
    local player = nil

    if killer then
        player = killer:getPlayer()
        if not player and killer:getMaster() then
            player = killer:getMaster():getPlayer()
        end
    end

    if player then
        local guild = player:getGuild()
        if guild then
            CASTLE24H:setOwnerGuild(guild:getId(), guild:getName())

            Game.broadcastMessage(
                "[Castle 24H] A guild " ..
                guild:getName() ..
                " dominou o castelo derrotando o Castle Crystal!",
                MESSAGE_STATUS_WARNING
            )

            spawnPos:sendMagicEffect(CONST_ME_HOLYAREA)
        end
    end

    -- Renascimento forçado: 5 segundos após a morte
    addEvent(function()
        -- Remove qualquer criatura que esteja na tile (não trava mais o spawn)
        local tile = Tile(spawnPos)
        if tile then
            for _, c in ipairs(tile:getCreatures()) do
                -- Empurra criaturas para uma tile adjacente
                local creatures = tile:getCreatures()
                for _, blocked in ipairs(creatures) do
                    local adjacentPos = {
                        Position(spawnPos.x + 1, spawnPos.y, spawnPos.z),
                        Position(spawnPos.x - 1, spawnPos.y, spawnPos.z),
                        Position(spawnPos.x, spawnPos.y + 1, spawnPos.z),
                        Position(spawnPos.x, spawnPos.y - 1, spawnPos.z),
                    }
                    for _, pos in ipairs(adjacentPos) do
                        local t = Tile(pos)
                        if t and not t:hasFlag(TILESTATE_BLOCKSOLID) then
                            blocked:teleportTo(pos, true)
                            break
                        end
                    end
                end
            end
        end

        -- Spawna o Castle Crystal de volta
        local newCrystal = Game.createMonster("Castle Crystal", spawnPos, false, true)
        if not newCrystal then
            -- Tenta de novo em mais 3 segundos se falhar
            addEvent(function()
                Game.createMonster("Castle Crystal", spawnPos, false, true)
            end, 3000)
        end
    end, 1000) -- 5000ms = 5 segundos

    return true
end

castleGate:register()