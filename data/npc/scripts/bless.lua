local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local PRICE = 10000 -- preço total das 5 bless

function creatureSayCallback(cid, type, msg)
    local player = Player(cid)

    if not npcHandler:isFocused(cid) then
        return false
    end

    if msgcontains(msg, "hi") then
        npcHandler:say("Deseja obter todas as suas bless por "..PRICE.." gold?", cid)
        npcHandler.topic[cid] = 1

    elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then

        if not player:removeTotalMoney(PRICE) then
            npcHandler:say("Voce nao possui dinheiro suficiente.", cid)
            npcHandler.topic[cid] = 0
            return true
        end

        for i = 1, 5 do
            player:addBlessing(i)
        end

        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
        npcHandler:say("Agora voce possui todas as blessings!", cid)

        npcHandler.topic[cid] = 0

    elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
        npcHandler:say("Tudo bem, volte quando quiser.", cid)
        npcHandler.topic[cid] = 0
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())