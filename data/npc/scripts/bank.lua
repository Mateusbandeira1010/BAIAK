local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local moneyTo = {}
local playerTo = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function isValidMoney(money)
    return type(money) == "number" and money > 0 and money < 999999999
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    msg = msg:lower()

    -- BALANCE
    if msgcontains(msg, "balance") then
        npcHandler:say("Seu saldo é " .. player:getBankBalance() .. " gold.", cid)
        talkState[cid] = 0

    -- DEPOSIT ALL
    elseif msgcontains(msg, "deposit all") then
        moneyTo[cid] = player:getMoney()

        if moneyTo[cid] <= 0 then
            npcHandler:say("Você não tem dinheiro.", cid)
            talkState[cid] = 0
        else
            npcHandler:say("Deseja depositar " .. moneyTo[cid] .. " gold?", cid)
            talkState[cid] = 2
        end

    -- DEPOSIT
    elseif msgcontains(msg, "deposit") then
        npcHandler:say("Quanto deseja depositar?", cid)
        talkState[cid] = 1

    elseif talkState[cid] == 1 then
        moneyTo[cid] = tonumber(msg)

        if isValidMoney(moneyTo[cid]) then
            npcHandler:say("Deseja depositar " .. moneyTo[cid] .. " gold?", cid)
            talkState[cid] = 2
        else
            npcHandler:say("Valor inválido.", cid)
            talkState[cid] = 0
        end

    elseif talkState[cid] == 2 then
        if msgcontains(msg, "yes") then
            if player:getMoney() >= moneyTo[cid] then
                player:removeMoney(moneyTo[cid])
                player:setBankBalance(player:getBankBalance() + moneyTo[cid])

                npcHandler:say("Depósito realizado. Saldo atual: " .. player:getBankBalance() .. ".", cid)
            else
                npcHandler:say("Você não tem esse dinheiro.", cid)
            end
        else
            npcHandler:say("Ok.", cid)
        end
        talkState[cid] = 0

    -- WITHDRAW
    elseif msgcontains(msg, "withdraw") then
        npcHandler:say("Quanto deseja sacar?", cid)
        talkState[cid] = 6

    elseif talkState[cid] == 6 then
        moneyTo[cid] = tonumber(msg)

        if isValidMoney(moneyTo[cid]) then
            npcHandler:say("Deseja sacar " .. moneyTo[cid] .. " gold?", cid)
            talkState[cid] = 7
        else
            npcHandler:say("Valor inválido.", cid)
            talkState[cid] = 0
        end

    elseif talkState[cid] == 7 then
        if msgcontains(msg, "yes") then
            if player:getBankBalance() >= moneyTo[cid] then
                player:setBankBalance(player:getBankBalance() - moneyTo[cid])
                player:addMoney(moneyTo[cid])

                npcHandler:say("Saque realizado.", cid)
            else
                npcHandler:say("Saldo insuficiente.", cid)
            end
        else
            npcHandler:say("Ok.", cid)
        end
        talkState[cid] = 0

    -- TRANSFER
    elseif msgcontains(msg, "transfer") then
        npcHandler:say("Quanto deseja transferir?", cid)
        talkState[cid] = 11

    elseif talkState[cid] == 11 then
        moneyTo[cid] = tonumber(msg)

        if isValidMoney(moneyTo[cid]) then
            npcHandler:say("Para quem?", cid)
            talkState[cid] = 12
        else
            npcHandler:say("Valor inválido.", cid)
            talkState[cid] = 0
        end

    elseif talkState[cid] == 12 then
        local target = Player(msg)

        if not target then
            npcHandler:say("Jogador não encontrado.", cid)
            talkState[cid] = 0
            return true
        end

        playerTo[cid] = target
        npcHandler:say("Deseja transferir " .. moneyTo[cid] .. " gold para " .. target:getName() .. "?", cid)
        talkState[cid] = 13

    elseif talkState[cid] == 13 then
        if msgcontains(msg, "yes") then
            local target = playerTo[cid]

            if player:getBankBalance() >= moneyTo[cid] then
                player:setBankBalance(player:getBankBalance() - moneyTo[cid])
                target:setBankBalance(target:getBankBalance() + moneyTo[cid])

                npcHandler:say("Transferência realizada.", cid)
                target:sendTextMessage(MESSAGE_INFO_DESCR, "Você recebeu " .. moneyTo[cid] .. " gold de " .. player:getName() .. ".")
            else
                npcHandler:say("Saldo insuficiente.", cid)
            end
        else
            npcHandler:say("Ok.", cid)
        end
        talkState[cid] = 0
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())