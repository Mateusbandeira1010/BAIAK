local function addRewardLoot(player, bossName, tabela_reward)
    local money = math.random(10, 40)
    local msg = "The following items are available in your reward chest:"
    local chest = Game.createItem(REWARDCHEST_ALAVANCA.rewardBagId, 1)
    if not chest then return end

    chest:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Reward from boss: " .. bossName .. ".")

    if #tabela_reward > 0 then
        for _, loot in ipairs(tabela_reward) do
            local rand = math.random(100)
            if rand <= loot[3] then
                local count = math.random(1, loot[2])
                chest:addItem(loot[1], count)
                msg = msg .. " " .. (count > 1 and count or "") .. " " .. ItemType(loot[1]):getName() .. ","
            end
        end
        player:sendTextMessage(MESSAGE_INFO_DESCR, msg .. " and " .. money .. " platinum coins.")
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, msg .. " " .. money .. " platinum coins.")
    end

    chest:addItem(2152, money)

    local depotChest = player:getDepotChest(REWARDCHEST_ALAVANCA.town_id, true)
    if depotChest then
        depotChest:addItemEx(chest)
    else
        local bp = player:getSlotItem(CONST_SLOT_BACKPACK)
        if bp then
            bp:addItemEx(chest)
        end
    end

    local boss = REWARDCHEST_ALAVANCA.bosses[bossName]
    player:setStorageValue(boss.storage, 0)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
end

local function addLoot(tabela_loot, tabela_reward, all_loot)
    if #tabela_loot > 0 then
        if all_loot then
            for _, v in ipairs(tabela_loot) do
                table.insert(tabela_reward, v)
            end
        else
            table.insert(tabela_reward, tabela_loot[math.random(#tabela_loot)])
        end
    end
    return tabela_reward
end

local function rewardChestSystem(bossName)
    local boss = REWARDCHEST_ALAVANCA.bosses[bossName]
    if not boss then return end

    local players = {}

    for _, player in ipairs(Game.getPlayers()) do
        local val = player:getStorageValue(boss.storage)
        if val and val > 0 then
            table.insert(players, player)
        end
    end

    if #players == 0 then return end

    table.sort(players, function(a, b)
        return a:getStorageValue(boss.storage) > b:getStorageValue(boss.storage)
    end)

    local porcentagem = players[1]:getStorageValue(boss.storage)

    for i, player in ipairs(players) do
        local tabela_reward = {}
        local pontos = player:getStorageValue(boss.storage)

        if i == 1 then
            addLoot(boss.comum, tabela_reward, false)
            addLoot(boss.semi_raro, tabela_reward, false)
            addLoot(boss.raro, tabela_reward, false)
            addLoot(boss.sempre, tabela_reward, true)
        elseif pontos >= math.ceil(porcentagem * 0.8) then
            addLoot(boss.comum, tabela_reward, false)
            addLoot(boss.semi_raro, tabela_reward, false)
            addLoot(boss.raro, tabela_reward, false)
            addLoot(boss.muito_raro, tabela_reward, false)
        elseif pontos >= math.ceil(porcentagem * 0.6) then
            addLoot(boss.comum, tabela_reward, false)
            addLoot(boss.semi_raro, tabela_reward, false)
            addLoot(boss.raro, tabela_reward, false)
        elseif pontos >= math.ceil(porcentagem * 0.4) then
            addLoot(boss.comum, tabela_reward, false)
            addLoot(boss.semi_raro, tabela_reward, false)
        elseif pontos >= math.ceil(porcentagem * 0.1) then
            addLoot(boss.comum, tabela_reward, false)
        end

        addRewardLoot(player, bossName, tabela_reward)
    end
end

function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    local bossName = creature:getName():lower()
    local boss = REWARDCHEST_ALAVANCA.bosses[bossName]
    if boss then
        addEvent(rewardChestSystem, 1000, bossName)
    end
    return true
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if attacker and attacker:isPlayer() then
        local bossName = creature:getName():lower()
        local boss = REWARDCHEST_ALAVANCA.bosses[bossName]
        if boss then
            local current = attacker:getStorageValue(boss.storage)
            if type(current) ~= "number" then current = 0 end
            if current < 0 then current = 0 end
            local damage = math.ceil(primaryDamage / REWARDCHEST_ALAVANCA.formula.hit)
            attacker:setStorageValue(boss.storage, current + damage)
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end