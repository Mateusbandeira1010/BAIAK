local crystalPosition = Position(33, 52, 4)

local function spawnCrystal()
    local tile = Tile(crystalPosition)
    if tile then
        for _, creature in ipairs(tile:getCreatures()) do
            if creature:getName():lower() == "castle crystal" then
                return
            end
        end
    end

    local monster = Game.createMonster("Castle Crystal", crystalPosition, false, true)
    if not monster then
        addEvent(spawnCrystal, 3000)
    end
end

function onStartup()
    addEvent(spawnCrystal, 3000)
    return true
end