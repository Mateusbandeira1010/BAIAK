-- data/movements/scripts/castle24h_warning.lua

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Verifica guild
    local guild = player:getGuild()
    if not guild then
        player:teleportTo(fromPosition, true)
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            CASTLE24H.castleName .. " " .. CASTLE24H.messageNoGuild
        )
        return false
    end

    -- Dono atual
    local currentOwner = CASTLE24H:getGuildIdFromCastle() or 0

    -- Se não for dono
    if guild:getId() ~= currentOwner then

        -- 🔥 CORREÇÃO PRINCIPAL
        local spam = player:getStorageValue(PlayerStorageKeys.castle24hSpam)

        -- Proteção contra nil e -1
        if not spam or spam < 0 then
            spam = 0
        end

        -- Controle de tempo
        if spam < os.time() then
            Game.broadcastMessage(
                CASTLE24H.castleName ..
                " O castelo esta sendo invadido por " ..
                player:getName() ..
                " (" .. guild:getName() .. ")!",
                MESSAGE_STATUS_WARNING
            )

            player:setStorageValue(
                PlayerStorageKeys.castle24hSpam,
                os.time() + (CASTLE24H.warningTime or 10)
            )
        end
    end

    return true
end