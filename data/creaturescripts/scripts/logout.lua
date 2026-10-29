function onLogout(player)
        print("[TESTE LOGOUT] PlayerLogout executado para " .. player:getName())
	local playerId = player:getId()
	nextUseStaminaTime[playerId] = nil
        player:removeCondition(CONDITION_INVISIBLE)
	return true
end
