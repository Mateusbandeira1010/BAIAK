local redSurpriseBag = Action()

function redSurpriseBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local goldNuggetId = 2157
    local goldNuggetAmount = math.random(15, 30)

    player:addItem(goldNuggetId, goldNuggetAmount)

    item:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    item:remove(1)

    return true
end

redSurpriseBag:id(6571)
redSurpriseBag:register()
