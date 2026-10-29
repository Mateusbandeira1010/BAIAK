local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


local travels = {
    {name = "dragon lair", level = 25, cost = 50, pos = {x=102, y=107, z=7}},
    {name = "hydra lair", level = 50, cost = 90, pos = {x=174, y=173, z=7}},
    {name = "warlock region", level = 65, cost = 200, pos = {x=50, y=100, z=7}},
    {name = "hell lair", level = 95, cost = 300, pos = {x=168, y=98, z=8}},
    {name = "frost land", level = 55, cost = 200, pos = {x=198, y=440, z=7}},
    {name = "tiquanda island", level = 30, cost = 170, pos = {x=131, y=173, z=7}},
    {name = "blood land", level = 100, cost = 300, pos = {x=303, y=191, z=7}},
    {name = "dark montain", level = 40, cost = 105, pos = {x=137, y=131, z=7}},
    {name = "hell gate", level = 160, cost = 450, pos = {x=321, y=66, z=11}},
    {name = "ice land", level = 70, cost = 220, pos = {x=847, y=570, z=7}},
    {name = "tower vigilante", level = 42, cost = 75, pos = {x=233, y=52, z=4}},
    {name = "temple of blood", level = 10, cost = 30, pos = {x=176, y=100, z=7}}
}

for i = 1, #travels do
    local t = travels[i]

    local node = keywordHandler:addKeyword({t.name}, StdModule.say, {
        npcHandler = npcHandler,
        onlyFocus = true,
        text = "Do you wish to travel to " .. t.name .. " for " .. t.cost .. " gold coins?"
    })

    node:addChildKeyword({'yes'}, StdModule.travel, {
        npcHandler = npcHandler,
        premium = true,
        level = t.level,
        cost = t.cost,
        destination = t.pos
    })

    node:addChildKeyword({'no'}, StdModule.say, {
        npcHandler = npcHandler,
        onlyFocus = true,
        reset = true,
        text = "Too expensive, eh?"
    })
end


local placeList = ""
for i = 1, #travels do
    placeList = placeList .. "{" .. travels[i].name .. "}"
    if i < #travels then
        placeList = placeList .. ", "
    end
end

keywordHandler:addKeyword({'places'}, StdModule.say, {
    npcHandler = npcHandler,
    onlyFocus = true,
    text = "I can take you to " .. placeList .. " for just a small fee."
})

-- Foco padrão (hi, bye)
npcHandler:addModule(FocusModule:new())