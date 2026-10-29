Castle48H = {
    castleName = "[Castle 48H]",
    open_storage = 100020,
    guild_storage = 100021,
    dateStorages = {100022, 100023, 100024},
    frompos = {x = 7, y = 628, z = 7},
    topos = {x = 19, y = 648, z = 7},
    leverPos = {x = 111, y = 672, z = 7},
    entrancePos = {x = 26, y = 640, z = 7},
    minLevel = 200,
    bonusXP = 25,
    openHour = 21,
    closeHour = 22,
    messageMinLevel = "Voce precisa ser nivel 200 ou superior para entrar no Castle 48H.",
    messageNoGuild = "Voce precisa estar em uma guild para entrar no Castle 48H.",
    messageCastleClosed = "O Castle 48H nao esta aberto para invasoes.",
    messageWelcome = "Bem-vindo ao Castle 48H! Domine a alavanca para conquistar o castelo!",
}

local function isPositionInRange(pos, fromPos, toPos)
    return pos.x >= fromPos.x and pos.x <= toPos.x and
           pos.y >= fromPos.y and pos.y <= toPos.y and
           pos.z == fromPos.z
end

function Castle48H:getPlayersInArea()
    local players_ = {}
    for _, pid in pairs(Game.getPlayers()) do
        if isPositionInRange(pid:getPosition(), self.frompos, self.topos) then
            table.insert(players_, pid)
        end
    end
    return #players_ > 0 and players_ or false
end

function Castle48H:isOpen()
    local hour = tonumber(os.date("%H"))
    local isTimeOpen = hour >= self.openHour and hour < self.closeHour
    return isTimeOpen or Game.getStorageValue(self.open_storage) == 1
end

function Castle48H:getOwnerGuildId()
    return Game.getStorageValue(self.guild_storage)
end

function Castle48H:isDominating(player)
    if not player or not player:isPlayer() then return false end
    local guild = player:getGuild()
    if not guild then return false end
    return guild:getId() == self:getOwnerGuildId()
end

function Castle48H:open()
    Game.setStorageValue(self.open_storage, 1)
    Game.setStorageValue(self.guild_storage, -1)
    Game.broadcastMessage(self.castleName .. " O castelo esta aberto para invasoes! Dominem a alavanca para conquistar!", MESSAGE_STATUS_WARNING)
end

function Castle48H:close()
    Game.setStorageValue(self.open_storage, -1)
    local players = self:getPlayersInArea()
    if players then
        for _, pid in pairs(players) do
            pid:teleportTo(Position(1000, 1000, 7))
            pid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        end
    end
    local guildId = self:getOwnerGuildId()
    local guildName = "Ninguem"
    if guildId and guildId > 0 then
        local resultId = db.storeQuery("SELECT `name` FROM `guilds` WHERE `id` = " .. guildId)
        if resultId then
            guildName = result.getString(resultId, "name")
            result.free(resultId)
        end
    end
    if guildId and guildId > 0 then
        Game.broadcastMessage(self.castleName .. " A batalha terminou! A guild " .. guildName .. " dominou o castelo e tem " .. self.bonusXP .. "% a mais de experiencia!", MESSAGE_STATUS_WARNING)
        -- Corrigido: salva no id = 2 (castle 48H / war)
        db.query("UPDATE `castle` SET `name` = " .. db.escapeString(guildName) .. ", `guild_id` = " .. guildId .. " WHERE `id` = 2")
    else
        Game.broadcastMessage(self.castleName .. " A batalha terminou e nenhuma guild dominou o castelo!", MESSAGE_STATUS_WARNING)
        -- Corrigido: limpa no id = 2 (castle 48H / war)
        db.query("UPDATE `castle` SET `name` = 'Ninguem', `guild_id` = 0 WHERE `id` = 2")
    end
end

function Castle48H:domain(player)
    if not player or not player:isPlayer() then return end
    local guild = player:getGuild()
    if guild then
        local guildId = guild:getId()
        Game.setStorageValue(self.guild_storage, guildId)
        Game.broadcastMessage(self.castleName .. " O jogador " .. player:getName() .. " da guild " .. guild:getName() .. " dominou o castelo! As outras guilds tem ate as 22:00 para tomar o dominio!", MESSAGE_STATUS_WARNING)
    end
end