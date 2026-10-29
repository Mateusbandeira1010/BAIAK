local config = {
    storage = 29003,
    chests = {
        [13003] = {
            name = "Armas"
        }
    },
    weapons = {
        -- Paladin e Royal Paladin
        [3] = { 7368 },         -- Assassin Star
        [7] = { 7368 },         -- Assassin Star

        -- Knight e Elite Knight (recebe as 3 armas)
        [4] = { 7417, 8926, 7451 },
        [8] = { 7417, 8926, 7451 },

        -- Druid e Elder Druid
        [2] = { 7424 },
        [6] = { 7424 },

        -- Sorcerer e Master Sorcerer
        [1] = { 7424 },
        [5] = { 7424 },
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local chest = config.chests[item.uid]
    if not chest then
        return false
    end

    local vocation = player:getVocation():getId()
    local weapons = config.weapons[vocation]

    if not weapons then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Este ba\xFA n\xE3o e para a sua vocacao.")
        return true
    end

    local questStatus = player:getStorageValue(config.storage)

    if questStatus ~= 1 then
        for i = 1, #weapons do
            player:addItem(weapons[i], 1)
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc\xEA achou as " .. chest.name .. ".")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:setStorageValue(config.storage, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc\xEA j\xE1 pegou suas armas.")
    end

    return true
end