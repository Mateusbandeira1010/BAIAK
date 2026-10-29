local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE) -- Dano de holy

-- Área de 5x5 ao redor do ponto de impacto
local area = createCombatArea{
    {0, 0, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 1, 0}
}
combat:setArea(area)

-- Fórmula para calcular o dano baseado no level e na skill
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level / 5) + (skill * attack * 0.2) + 10
    local max = (level / 5) + (skill * attack * 0.4) + 20
    return -min, -max
end

combat:setCallback(CallBackParam.SKILLVALUE, onGetFormulaValues)

-- Função para aplicar dano em uma área 5x5 com efeito visual
local function applyDamageInArea(playerId, targetPos)
    local player = Player(playerId)
    if not player then return end

    local areaPositions = {
        {x = targetPos.x - 2, y = targetPos.y - 2, z = targetPos.z},
        {x = targetPos.x - 2, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x - 2, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x - 2, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x - 2, y = targetPos.y + 2, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y - 2, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y + 2, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y - 2, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y + 2, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y - 2, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y + 2, z = targetPos.z},
        {x = targetPos.x + 2, y = targetPos.y - 2, z = targetPos.z},
        {x = targetPos.x + 2, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x + 2, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x + 2, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x + 2, y = targetPos.y + 2, z = targetPos.z},
    }

    for _, position in pairs(areaPositions) do
        doAreaCombatHealth(playerId, COMBAT_HOLYDAMAGE, position, 0, -800, -50, CONST_ME_ENERGYHIT)
    end
end

-- Função para lançar a spear
function onUseWeapon(player, variant)
    local target = player:getTarget()
    if target then
        local targetPos = target:getPosition()

        -- Lança a spear com a animação original
        player:getPosition():sendDistanceEffect(targetPos, CONST_ANI_FLASHARROW) 

        -- Realiza o combate no alvo
        combat:execute(player, variant)

        -- Aplica dano em área rapidamente
        local interval = 50 -- Intervalo de 50 milissegundos
        local repetitions = 2.0 -- Aplica o dano 2 vezes
        for i = 1, repetitions do
            addEvent(applyDamageInArea, i * interval, player:getId(), targetPos)
        end

        return true
    end
    return false
end