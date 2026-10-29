local blessings = {1, 2, 3, 4, 5}
local cost = 80000

function onSay(player, words, param)
    if not player then
        return false
    end

    -- Verifica se o jogador já tem todas as blessings
    local hasAll = true
    for i = 1, #blessings do
        local b = player:hasBlessing(blessings[i])
        -- Tratamento de erro: se retornar nil ou false, ele entende que NÃO tem a bless
        if b == nil or b == false then
            hasAll = false
            break
        end
    end

    if hasAll then
        player:sendCancelMessage("Voce ja possui todas as bless!")
        return false
    end

    -- Verifica e remove o dinheiro
    if not player:removeMoney(cost) then
        player:sendCancelMessage("Voce precisa de 80k para a bless.")
        return false
    end

    -- Adiciona as blessings
    for i = 1, #blessings do
        player:addBlessing(blessings[i], 1)
    end

    -- Efeitos
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce recebeu todas as bless!")
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
    
    -- Usando player:say para evitar erro de função inexistente no Game.sendAnimatedText
    player:say("Blessed!", TALKTYPE_MONSTER_SAY)

    return false
end