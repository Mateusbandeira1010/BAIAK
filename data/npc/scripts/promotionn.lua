local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

end



local node1 = keywordHandler:addKeyword({'vip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso promove-lo para Primeira Promotion por 20k. Voce quer?'})
node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, promotion = 1, text = 'Agora voce tem a primeira promotion.'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Tudo bem, volte quando estiver pronto.', reset = true})




local node2 = keywordHandler:addKeyword({'promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso promove-lo para Promotion VIP por 500k. Voce quer?'})
node2:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 500000, level = 200, promotion = 2, text = 'Agora voce tem a VIP promotion.'})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Tudo bem, volte quando estiver pronto.', reset = true})

npcHandler:addModule(FocusModule:new())