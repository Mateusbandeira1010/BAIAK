local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local STORAGE = 999998
local PRICE = 100000
local ITEM_REQUIRED = 8931
local ITEM_COUNT = 1

local OUTFIT_MALE = 335
local OUTFIT_FEMALE = 336
local ADDON = 2

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    msg = msg:lower()

    if not npcHandler.topic[cid] then
        npcHandler.topic[cid] = 0
    end

    if msg == "addon" or msg == "addons" then

        if (player:getStorageValue(STORAGE) or -1) >= 2 then
            npcHandler:say("Você já possui esse addon.", cid)
            return true
        end

        npcHandler:say("Eu preciso de uma Baiak Sword e 100k. Você trouxe?", cid)
        npcHandler.topic[cid] = 1
        return true
    end

    if msg == "yes" and npcHandler.topic[cid] == 1 then

        if not player:removeItem(ITEM_REQUIRED, ITEM_COUNT) then
            npcHandler:say("Você não possui a Baiak Sword.", cid)
            npcHandler.topic[cid] = 0
            return true
        end

        if not player:removeMoney(PRICE) then
            npcHandler:say("Você não possui 100k.", cid)
            npcHandler.topic[cid] = 0
            return true
        end

        local outfit = player:getSex() == PLAYERSEX_FEMALE and OUTFIT_FEMALE or OUTFIT_MALE
        player:addOutfitAddon(outfit, ADDON)
        player:setStorageValue(STORAGE, 2)

        npcHandler:say("Parabéns! Você recebeu o Warmaster Addon 2.", cid)
        npcHandler.topic[cid] = 0
        return true
    end

    if msg == "no" and npcHandler.topic[cid] == 1 then
        npcHandler:say("Tudo bem então.", cid)
        npcHandler.topic[cid] = 0
        return true
    end

    return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
