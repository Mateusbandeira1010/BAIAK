-- CONFIG
local PRICE = 2000
local INVISIBLE_SECONDS = 600
local MANASHIELD_SECONDS = 600
local SKILL_SECONDS = 600

local SKILL_UP = {
    fist = 20,
    club = 20,
    sword = 20,
    axe = 20,
    distance = 20,
    shield = 20,
    ml = 10
}

-- Invisible Condition
local conditionInvisible = Condition(CONDITION_INVISIBLE)
conditionInvisible:setParameter(CONDITION_PARAM_TICKS, INVISIBLE_SECONDS * 1000)

-- Mana Shield Condition
local conditionManaShield = Condition(CONDITION_MANASHIELD)
conditionManaShield:setParameter(CONDITION_PARAM_TICKS, MANASHIELD_SECONDS * 1000)

-- Melee Condition
local conditionMelee = Condition(CONDITION_ATTRIBUTES)
conditionMelee:setParameter(CONDITION_PARAM_TICKS, SKILL_SECONDS * 1000)
conditionMelee:setParameter(CONDITION_PARAM_SKILL_FIST, SKILL_UP.fist)
conditionMelee:setParameter(CONDITION_PARAM_SKILL_CLUB, SKILL_UP.club)
conditionMelee:setParameter(CONDITION_PARAM_SKILL_SWORD, SKILL_UP.sword)
conditionMelee:setParameter(CONDITION_PARAM_SKILL_AXE, SKILL_UP.axe)

-- Distance Condition
local conditionDistance = Condition(CONDITION_ATTRIBUTES)
conditionDistance:setParameter(CONDITION_PARAM_TICKS, SKILL_SECONDS * 1000)
conditionDistance:setParameter(CONDITION_PARAM_SKILL_DISTANCE, SKILL_UP.distance)

-- Shield Condition
local conditionShield = Condition(CONDITION_ATTRIBUTES)
conditionShield:setParameter(CONDITION_PARAM_TICKS, SKILL_SECONDS * 1000)
conditionShield:setParameter(CONDITION_PARAM_SKILL_SHIELD, SKILL_UP.shield)

-- Magic Level Condition
local conditionMagic = Condition(CONDITION_ATTRIBUTES)
conditionMagic:setParameter(CONDITION_PARAM_TICKS, SKILL_SECONDS * 1000)
conditionMagic:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, SKILL_UP.ml)

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function applyBuff(player, condition, effect, message)
    if not player:removeMoney(PRICE) then
        npcHandler:say("You need " .. PRICE .. " gold coins to buff yourself.", player:getId())
        return false
    end

    player:addCondition(condition)
    player:getPosition():sendMagicEffect(effect)
    npcHandler:say(message, player:getId())
    return true
end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    msg = msg:lower()

    if msg == "invisible" then
        npcHandler:say("Do you want to be invisible?", cid)
        npcHandler.topic[cid] = 1

    elseif msg == "magic shield" then
        npcHandler:say("Do you want magic shield effect?", cid)
        npcHandler.topic[cid] = 2

    elseif msg == "melee" then
        npcHandler:say("Do you want to upgrade your melee skills?", cid)
        npcHandler.topic[cid] = 3

    elseif msg == "distance" then
        npcHandler:say("Do you want to upgrade your distance skill?", cid)
        npcHandler.topic[cid] = 4

    elseif msg == "shield" then
        npcHandler:say("Do you want to upgrade your shield skill?", cid)
        npcHandler.topic[cid] = 5

    elseif msg == "magic" then
        npcHandler:say("Do you want to upgrade your magic level?", cid)
        npcHandler.topic[cid] = 6

    elseif msg == "yes" then

        if npcHandler.topic[cid] == 1 then
            applyBuff(player, conditionInvisible, CONST_ME_MAGIC_RED, "You are now invisible!")

        elseif npcHandler.topic[cid] == 2 then
            applyBuff(player, conditionManaShield, CONST_ME_MAGIC_BLUE, "Magic shield activated!")

        elseif npcHandler.topic[cid] == 3 then
            applyBuff(player, conditionMelee, CONST_ME_MAGIC_RED, "Your melee skills have been upgraded!")

        elseif npcHandler.topic[cid] == 4 then
            applyBuff(player, conditionDistance, CONST_ME_MAGIC_RED, "Your distance skill has been upgraded!")

        elseif npcHandler.topic[cid] == 5 then
            applyBuff(player, conditionShield, CONST_ME_MAGIC_RED, "Your shield skill has been upgraded!")

        elseif npcHandler.topic[cid] == 6 then
            -- vocation check
            local vocation = player:getVocation():getId()
            if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
                applyBuff(player, conditionMagic, CONST_ME_MAGIC_BLUE, "Your magic level has been upgraded!")
            else
                npcHandler:say("Only sorcerers and druids can upgrade magic level.", cid)
            end
        end

        npcHandler.topic[cid] = 0

    elseif msg == "no" then
        npcHandler:say("Alright then.", cid)
        npcHandler.topic[cid] = 0
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
