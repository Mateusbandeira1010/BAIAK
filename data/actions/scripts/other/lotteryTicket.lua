local presents = {
    [10503] = {
        common = {2160, 9693},
        medium = {11255, 7440},
        rare = {8853, 7866, 7861, 7858, 7958}
    }
}

function getRandomReward(list)
    return list[math.random(#list)]
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local config = presents[item.itemid]
    if not config then
        return true
    end

    local chance = math.random(100)
    local reward

    --  RARIDADE
    if chance <= 5 then
        reward = getRandomReward(config.rare)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "RARE ITEM!")
        Game.broadcastMessage(player:getName() .. " got a RARE item from lottery!")
        
    elseif chance <= 30 then
        reward = getRandomReward(config.medium)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You got a good item!")

    else
        reward = getRandomReward(config.common)
    end

    -- adicionar item
    player:addItem(reward, 1)

    -- remover ticket
    item:remove(1)

    -- efeito visual
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)

    return true
end