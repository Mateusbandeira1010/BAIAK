local addondoll_id = 9693

local OUTFIT_LIST = {
    ["citizen"] = {128, 136},
    ["hunter"] = {129, 137},
    ["mage"] = {130, 138},
    ["knight"] = {131, 139},
    ["nobleman"] = {132, 140},
    ["summoner"] = {133, 141},
    ["warrior"] = {134, 142},
    ["barbarian"] = {143, 147},
    ["druid"] = {144, 148},
    ["wizard"] = {145, 149},
    ["oriental"] = {146, 150},
    ["pirate"] = {151, 155},
    ["assassin"] = {152, 156},
    ["beggar"] = {153, 157},
    ["shaman"] = {154, 158},
    ["norseman"] = {251, 252},
    ["nightmare"] = {268, 269},
    ["jester"] = {273, 270},
    ["brotherhood"] = {278, 279},
    ["demonhunter"] = {289, 288},
    ["yalaharian"] = {325, 324},
    ["warmaster"] = {335, 336},
}

function onSay(player, words, param)
    -- Limpa o parâmetro e transforma em minúsculo
    local name = param:lower():trim()
    local outfit = OUTFIT_LIST[name]

    -- Validação do nome do outfit
    if param == "" or not outfit then
        player:sendCancelMessage("Outfit invalido. Use: !addon mage")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Verifica se o player tem o Addon Doll
    if player:getItemCount(addondoll_id) < 1 then
        player:sendCancelMessage("Voce nao tem o addon doll!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Define o ID do outfit baseado no sexo do player para checagem
    local outfitCheck = player:getSex() == PLAYERSEX_FEMALE and outfit[2] or outfit[1]

    -- Verifica se já tem o Full Addon (Addon 3)
    if player:hasOutfit(outfitCheck, 3) then
        player:sendCancelMessage("Voce ja possui esse outfit completo.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Tenta remover o item antes de dar o addon
    if not player:removeItem(addondoll_id, 1) then
        player:sendCancelMessage("Erro ao remover o item.")
        return true
    end

    -- Entrega o Outfit e os Addons (3 = Full)
    -- Adicionamos nos dois IDs (Male/Female) por segurança caso o player mude de sexo
    player:addOutfit(outfit[1])
    player:addOutfit(outfit[2])
    player:addOutfitAddon(outfit[1], 3)
    player:addOutfitAddon(outfit[2], 3)

    -- Efeito visual e mensagem
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Seu full " .. name .. " addon foi adicionado!")
    
    return true
end