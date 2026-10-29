
local tasks = {
    [1] = {
        questStarted = 1713,
        questStorage = 677971,
        killsRequired = 100,
        raceName = "Donate Frost Dragon",
        rewards = {
            first = {enable = true, type = "exp", values = 400000},
            second = {enable = true, type = "money", values = 10000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [2] = {
        questStarted = 1714,
        questStorage = 677972,
        killsRequired = 100,
        raceName = "Triple Medusa",
        rewards = {
            first = {enable = true, type = "exp", values = 500000},
            second = {enable = true, type = "money", values = 80000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [3] = {
        questStarted = 1715,
        questStorage = 677973,
        killsRequired = 100,
        raceName = "Donate Grim Reaper",
        rewards = {
            first = {enable = true, type = "exp", values = 60000},
            second = {enable = true, type = "money", values = 20000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [4] = {
        questStarted = 1716,
        questStorage = 677974,
        killsRequired = 100,
        raceName = "Donate Demon",
        rewards = {
            first = {enable = true, type = "exp", values = 70000},
            second = {enable = true, type = "money", values = 30000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [5] = {
        questStarted = 1717,
        questStorage = 677975,
        killsRequired = 100,
        raceName = "Champion Warlock",
        rewards = {
            first = {enable = true, type = "exp", values = 80000},
            second = {enable = true, type = "money", values = 40000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [6] = {
        questStarted = 1718,
        questStorage = 677976,
        killsRequired = 100,
        raceName = "Draken Elite",
        rewards = {
            first = {enable = true, type = "exp", values = 90000},
            second = {enable = true, type = "money", values = 100000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [7] = {
        questStarted = 1719,
        questStorage = 677977,
        killsRequired = 100,
        raceName = "Terramite",
        rewards = {
            first = {enable = true, type = "exp", values = 1000000},
            second = {enable = true, type = "money", values = 130000000},
            third = {enable = false, type = nil, values = {}}
        }
    },

    [8] = {
        questStarted = 1720,
        questStorage = 677978,
        killsRequired = 100,
        raceName = "Devil Flamebeast",
        rewards = {
            first = {enable = true, type = "exp", values = 1100000},
            second = {enable = true, type = "money", values = 200000000},
            third = {enable = false, type = nil, values = {}}
        }
    }
}

-- Storage que controla o nível atual da task
local function getTaskStorageValue(cid, key)
    local value = getPlayerStorageValue(cid, key)
    if type(value) ~= "number" then
        return -1
    end
    return value
end

local storage = 74521

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}
local voc = {}

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
    npcHandler:onThink()
end

local function giveReward(cid, reward)
    if not reward or not reward.enable then
        return
    end

    if reward.type == "exp" then
        doPlayerAddExperience(cid, reward.values)

    elseif reward.type == "money" then
        doPlayerAddMoney(cid, reward.values)

    elseif reward.type == "item" then
        doPlayerAddItem(cid, reward.values[1], reward.values[2])

    elseif reward.type == "storage" then
        Player(cid):setStorageValue(reward.values[1], reward.values[2])

    elseif reward.type == "boss" then
        doTeleportThing(cid, reward.values)
    end
end

function creatureSayCallback(cid, type, msg)
-- =====================================================
-- BONUS DE DOACAO DAS TASKS
-- =====================================================

local function giveDonationBonus(cid, taskNumber)
    local player = Player(cid)
    if not player then
        return
    end

    -- PRIMEIRA TASK: 10kk + 1 stamina
    if taskNumber == 1 then
        player:addItem(2157, 10)
        player:addItem(2346, 1)

        selfSay("Bonus recebido: 10kk e 1 stamina!", cid)
        return
    end

    -- SEGUNDA TASK: 30kk + 1 stamina
    if taskNumber == 2 then
        player:addItem(2157, 30)
        player:addItem(2346, 1)

        selfSay("Bonus recebido: 30kk e 1 stamina!", cid)
        return
    end

    -- TASKS 3 A 8: RECOMPENSA ALEATORIA
    local reward = math.random(1, 4)

    if reward == 1 then
        player:addItem(12614, 1)
        selfSay("Bonus aleatorio recebido: Dodge!", cid)

    elseif reward == 2 then
        player:addItem(12435, 1)
        selfSay("Bonus aleatorio recebido: Critical!", cid)

    elseif reward == 3 then
        player:addItem(2346, 1)
        selfSay("Bonus aleatorio recebido: Stamina!", cid)

    else
        local amount = math.random(10, 30)
        player:addItem(2157, amount)

        selfSay(
            "Bonus aleatorio recebido: " .. amount .. "kk em pepitas!",
            cid
        )
    end
end

       if not npcHandler:isFocused(cid) then
        return false
    end

    local s = getTaskStorageValue(cid, storage)

    if s < 1 then
        s = 1
        Player(cid):setStorageValue(storage, s)
    end

    if msgcontains(msg, "task") then
        if tasks[s] then
            local task = tasks[s]

            if getTaskStorageValue(cid, task.questStarted) < 1 then
                Player(cid):setStorageValue(task.questStarted, 1)

                if getTaskStorageValue(cid, task.questStorage) < 0 then
                    Player(cid):setStorageValue(task.questStorage, 0)
                end

                selfSay(
                    "Voce iniciou a missao numero " .. s ..
                    ". Voce precisa matar " ..
                    task.killsRequired .. " " ..
                    task.raceName .. ".",
                    cid
                )
            else
                selfSay(
                    "Voce ja esta realizando a missao: " ..
                    task.raceName .. ".",
                    cid
                )
            end
        else
            selfSay("Parabens! Voce concluiu todas as missoes!", cid)
        end

    elseif msgcontains(msg, "report") then
        if tasks[s] then
            local task = tasks[s]

            if getTaskStorageValue(cid, task.questStarted) < 1 then
                selfSay("Voce ainda nao iniciou esta missao.", cid)
                return true
            end

            local kills = getTaskStorageValue(cid, task.questStorage)

            if kills < 0 then
                kills = 0
                Player(cid):setStorageValue(task.questStorage, 0)
            end

            if kills >= task.killsRequired then
                selfSay(
                    "Muito bem! Voce concluiu a missao numero " ..
                    s .. ". Parabens!",
                    cid
                )

                giveDonationBonus(cid, s)

                -- Marca a tarefa como concluida
                Player(cid):setStorageValue(task.questStarted, 2)

                -- Avanca para a proxima tarefa
                Player(cid):setStorageValue(storage, s + 1)

            else
                selfSay(
                    "Progresso: " .. kills .. " " ..
                    task.raceName .. " mortos. Voce precisa matar mais " ..
                    (task.killsRequired - kills) .. " monstros.",
                    cid
                )
            end
        else
            selfSay("Parabens! Voce concluiu todas as missoes!", cid)
        end
    end

    return true
end

npcHandler:setCallback(
    CALLBACK_MESSAGE_DEFAULT,
    creatureSayCallback
)

npcHandler:addModule(FocusModule:new())