local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local shopModule = ShopModule:new()

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

-- adiciona shop ao npc
npcHandler:addModule(shopModule)

-- DODGE 200kk
shopModule:addBuyableItem({'dodge'}, 12614, 200000000, 1, 'Dodge')

-- CRITICAL 250kk
shopModule:addBuyableItem({'critical'}, 12435, 250000000, 1, 'Critical')

--STAMINA POTION
shopModule:addBuyableItem({'Stamina Potion'}, 2346, 30000000, 1, 'Stamina Potion')

npcHandler:addModule(FocusModule:new())