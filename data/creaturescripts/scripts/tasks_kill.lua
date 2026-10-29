-- Contador das tasks do NPC tasksbk
-- TFS 1.7

local TASK_STORAGE = 74521

local tasks = {
    [1] = {questStarted = 1713, questStorage = 677971, killsRequired = 500, raceName = "Donate Frost Dragon"},
    [2] = {questStarted = 1714, questStorage = 677972, killsRequired = 200, raceName = "Triple Medusa"},
    [3] = {questStarted = 1715, questStorage = 677973, killsRequired = 1500, raceName = "Donate Grim Reaper"},
    [4] = {questStarted = 1716, questStorage = 677974, killsRequired = 2000, raceName = "Donate Demon"},
    [5] = {questStarted = 1717, questStorage = 677975, killsRequired = 2500, raceName = "Champion Warlock"},
    [6] = {questStarted = 1718, questStorage = 677976, killsRequired = 3000, raceName = "Draken Elite"},
    [7] = {questStarted = 1719, questStorage = 677977, killsRequired = 3500, raceName = "Terramite"},
    [8] = {questStarted = 1720, questStorage = 677978, killsRequired = 4000, raceName = "Devil Flamebeast"}
}

function onKill(player, target)
    if not player or not target or not target:isMonster() then
        return true
    end

    local taskId = player:getStorageValue(TASK_STORAGE)
    local task = tasks[taskId]

    if not task then
        return true
    end

    if player:getStorageValue(task.questStarted) ~= 1 then
        return true
    end

    if target:getName():lower() ~= task.raceName:lower() then
        return true
    end

    local kills = player:getStorageValue(task.questStorage)

    if kills < 0 then
        kills = 0
    end

    if kills >= task.killsRequired then
        return true
    end

    kills = kills + 1
    player:setStorageValue(task.questStorage, kills)

    player:sendTextMessage(
        MESSAGE_EVENT_DEFAULT,
        task.raceName .. ": " .. kills .. "/" .. task.killsRequired .. " mortos."
    )

    if kills >= task.killsRequired then
        player:sendTextMessage(
            MESSAGE_EVENT_DEFAULT,
            "Task concluida! Fale com o NPC e diga report para receber sua recompensa."
        )
    end

    return true
end
