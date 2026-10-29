local items = {
    [2475] = {value = 6000},   -- warrior helmet
    [2536] = {value = 8000},   -- medusa shield (NPC paga 8k, seu script era 9k)
    [2432] = {value = 10000},  -- fire axe
    [2514] = {value = 150000}, -- mastermind shield (NPC paga 150k, seu script era 50k)
    [2472] = {value = 200000}, -- magic plate armor
    [2462] = {value = 4000},   -- devil helmet 
    [2413] = {value = 70},     -- broadsword (NPC paga 70, seu script era 480)
    [2414] = {value = 10000},  -- dragon lance
    [2392] = {value = 3000},   -- fire sword
    [2498] = {value = 40000},  -- royal helmet 
    [2476] = {value = 5000},   -- knight armor
    [2195] = {value = 40000},  -- boots of haste
    [2396] = {value = 4000},   -- ice rapier
    [2528] = {value = 4000},   -- tower shield
    [7402] = {value = 20000},  -- dragon slayer (NPC paga 20k, seu script era 15k)
    [2492] = {value = 60000},  -- dragon scale mail (NPC paga 60k, seu script era 40k)
    [2520] = {value = 50000},  -- demon shield (NPC paga 40k, seu script era 30k)
    [2470] = {value = 80000},  -- golden legs
    [2488] = {value = 15000},  -- crown legs
    [2645] = {value = 40000},  -- steel boots (NPC paga 40k, seu script era 15k)
}

local EXHAUSTION_TIME = 2 -- segundos
local STORAGE_EXHAUST = 124514

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    -- Mostrar lista ao usar a wand nela mesma
    if target.itemid == item.itemid then
        local str = "Lista de Itens Vendáveis:\n-----------------------------\n"

        for itemId, info in pairs(items) do
            local itemType = ItemType(itemId)
            if itemType then
                local itemName = itemType:getName():gsub("^%l", string.upper)
                str = str .. itemName .. ": " .. info.value .. " gold\n"
            end
        end

        player:showTextDialog(6533, str)
        return true
    end

    -- Se não usar em item
    if not target or target.itemid == 0 then
        player:sendCancelMessage("Use a wand em um item.")
        return true
    end

    local itemInfo = items[target.itemid]

    -- Item não está na lista
    if not itemInfo then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Este item não pode ser vendido.")
        toPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Sistema de exaustão (CORRIGIDO)
    local last = player:getStorageValue(STORAGE_EXHAUST)
    if last == nil or last < 0 then
        last = 0
    end

    local now = os.time()

    if (now - last) < EXHAUSTION_TIME then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde antes de vender outro item.")
        return true
    end

    -- Quantidade no inventário (não vende equipado)
    local count = player:getItemCount(target.itemid)

    if count <= 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Você não possui esse item no inventário.")
        return true
    end

    local itemType = ItemType(target.itemid)
    local itemName = itemType:getName()
    local pluralName = itemType:getPluralName() or (itemName .. "s")

    local totalValue = itemInfo.value * count

    -- Remove itens e adiciona no banco
    player:removeItem(target.itemid, count)
    player:setBankBalance(player:getBankBalance() + totalValue)

    player:sendTextMessage(
        MESSAGE_STATUS_CONSOLE_ORANGE,
        "Voce vendeu " .. count .. " " ..
        (count == 1 and itemName or pluralName) ..
        " por " .. totalValue .. " gold."
    )

    -- efeito visual
    toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)

    -- salva tempo da última venda
    player:setStorageValue(STORAGE_EXHAUST, now)

    return true
end