-- encoding: latin1
function onLogin(player)
    -- SERVER OPEN/CLOSE
    local isServerOpen = SERVER_OPEN
    if not isServerOpen and player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, SERVER_CLOSED_MESSAGE or "Servidor fechado.")
        player:remove()
        return true
    end

    local serverName = configManager.getString(configKeys.SERVER_NAME) or "Baiak Pesado"
    local loginStr = ""

    -- PRIMEIRO LOGIN
    if player:getLastLoginSaved() <= 0 then
        loginStr = "Bem-vindo ao " .. serverName .. "! Aproveite sua jornada."
    else
        -- LOGIN NORMAL
        local lastVisit = os.date("%d/%m/%Y %X", player:getLastLoginSaved())
        loginStr = "Sua ultima visita foi em: " .. lastVisit
    end

    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)



-- Check Castle 24H Membership on Login
    local currentOwner = CASTLE24H:getGuildIdFromCastle()
    local playerGuild = player:getGuild()
    local playerPos = player:getPosition()
    
    -- Defina aqui a posicao de saida (Templo)
    local exitPosition = Position(152, 55, 7) 

    -- AREA 1 (Corredor das Estatuas - Imagem 1)
    local isInArea1 = playerPos:isInRange(Position(23, 40, 7), Position(30, 45, 7))
    
    -- AREA 2 (Sala Principal do Trono - Imagem 2)
    local isInArea2 = playerPos:isInRange(Position(17, 3, 7), Position(31, 11, 7))

    -- Se estiver em QUALQUER uma das duas areas
    if isInArea1 or isInArea2 then
        if currentOwner > 0 then
            if not playerGuild or playerGuild:getId() ~= currentOwner then
                player:teleportTo(exitPosition)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Castle 24H] Voce foi removido do castelo pois ele pertence a outra guild.")
            end
        end
    end

	-- CORRECAO DO BUG DAS MAGIAS
	player:removeCondition(CONDITION_HASTE)
	player:removeCondition(CONDITION_MANASHIELD)

	-- Events
	local eventStorage = player:getStorageValue(STORAGEVALUE_EVENTS)
	if eventStorage and eventStorage >= 1 then
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(STORAGEVALUE_EVENTS, 0)
	end

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()

	if player:isPremium() then
		local value = player:getStorageValue(PlayerStorageKeys.promotion)
		if value and value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Events
	-- Check Castle 48H Membership on Login
    local castle48Owner = Castle48H:getOwnerGuildId()
    local playerPos48 = player:getPosition()
    local isInCastle48 = playerPos48:isInRange(Position(7, 628, 7), Position(19, 648, 7))
    if isInCastle48 then
        if castle48Owner and castle48Owner > 0 then
            if not playerGuild or playerGuild:getId() ~= castle48Owner then
                player:teleportTo(exitPosition)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Castle 48H] Voce foi removido do castelo pois ele pertence a outra guild.")
            end
        else
            player:teleportTo(exitPosition)
        end
    end
    player:registerEvent("PlayerDeath")
    player:registerEvent("TaskKill")
	player:registerEvent("DropLoot")
	player:registerEvent('FragSystem')
	player:registerEvent("DodgeCritHealth")
	player:registerEvent("DodgeCritMana")
	player:updateStamina()
	player:registerEvent("Events")
    player:registerEvent("CastleLogout")
    player:registerEvent("Castle48HLogout")
    player:registerEvent("PushPZBlock")
	
	return true
end