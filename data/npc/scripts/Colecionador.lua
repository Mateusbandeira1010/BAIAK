local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}

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

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if not player then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local message = msg:lower()

    if message:find("ossos") or message:find("bones") or message:find("bone") then
        npcHandler:say(
            "Voce realmente deseja trocar seus preciosos bones por uma recompensa? Diga {yes}.",
            cid
        )

        talkState[talkUser] = 1

    elseif message == "yes" and talkState[talkUser] == 1 then
        local boneItemId = 5925
        local boneAmount = 30
        local surpriseBagId = 6571

        if player:getItemCount(boneItemId) >= boneAmount then
            if player:removeItem(boneItemId, boneAmount) then

                -- Entrega somente 1 Surprise Bag.
                -- A recompensa de 15 a 35 pepitas
                -- acontece quando o jogador usa a bag.
                player:addItem(surpriseBagId, 1)

                npcHandler:say(
                    "Aqui esta sua Surprise Bag. Boa sorte!",
                    cid
                )
            else
                npcHandler:say(
                    "Desculpe, mas voce nao conseguiu entregar os 30 bones.",
                    cid
                )
            end
        else
            npcHandler:say(
                "Desculpe, mas voce nao tem 30 bones.",
                cid
            )
        end

        talkState[talkUser] = 0

    elseif message == "no" and talkState[talkUser] == 1 then
        talkState[talkUser] = 0
        npcHandler:say("Ok then.", cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
