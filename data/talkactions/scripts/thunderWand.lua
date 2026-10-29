local STORAGEVALUE_THUNDER_WAND = 50000
local THUNDER_WAND_IDS = { [7424] = true, [2453] = true }

local info = [[Exchange elements using:
!staff holy
!staff ice
!staff fire
!staff energy
!staff earth
!staff death]]

function onSay(player, words, param)
    param = param:lower()

    if param == '' then
        player:showTextDialog(THUNDER_WAND_ID, info)
        return false
    end

    local elements = {
        holy = 1,
        ice = 2,
        fire = 3,
        energy = 4,
        earth = 5,
        death = 6
    }

    local index = elements[param]
    if not index then
        player:sendCancelMessage('Element not found.')
        return false
    end

    local left = player:getSlotItem(CONST_SLOT_LEFT)
    local right = player:getSlotItem(CONST_SLOT_RIGHT)

    local item = nil
    if left and THUNDER_WAND_IDS[left:getId()] then
        item = left
    elseif right and THUNDER_WAND_IDS[right:getId()] then
        item = right
    end

    if not item then
        player:sendCancelMessage('You are not using a Baiakinho.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if player:getStorageValue(STORAGEVALUE_THUNDER_WAND) == index then
        player:sendCancelMessage('Your Baiakinho is already using this element.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    player:setStorageValue(STORAGEVALUE_THUNDER_WAND, index)
    player:sendTextMessage(MESSAGE_INFO_DESCR, 'Element changed to: ' .. param)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

    return false
end