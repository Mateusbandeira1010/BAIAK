local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem(nil, 9693, 50) -- Addon Doll
shopModule:addBuyableItem(nil, 12435, 30) -- Critical Stone
shopModule:addBuyableItem(nil, 12614, 30) -- Dodge Stone
shopModule:addBuyableItem(nil, 7443, 15) -- Event Exp Potion
shopModule:addBuyableItem(nil, 12640, 30) -- Reflect Feather
shopModule:addBuyableItem(nil, 2346, 25) -- Stamina Refil


npcHandler:addModule(FocusModule:new())
