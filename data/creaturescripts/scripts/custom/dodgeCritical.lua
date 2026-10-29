function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not attacker or not creature or primaryType == COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- =========================
    -- 🛡️ DODGE (DEFESA)
    -- =========================
    if creature:isPlayer() then
        local dStorage = creature:getStorageValue(12614)
        local dSkill = (dStorage and dStorage > 0) and dStorage or 0

        if (dSkill * 3) >= math.random(0, 1000) then
            primaryDamage = 0
            secondaryDamage = 0
            creature:getPosition():sendMagicEffect(231)
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
    end

    -- =========================
    -- 💥 CRITICAL (ATAQUE)
    -- =========================
    if attacker:isPlayer() then
        local cStorage = attacker:getStorageValue(12435)
        local cSkill = (cStorage and cStorage > 0) and cStorage or 0

        if (cSkill * 3) >= math.random(0, 1000) then
            primaryDamage = primaryDamage * 2
            secondaryDamage = secondaryDamage * 2
            doSendMagicEffect(attacker:getPosition(), 173)

            -- CORREÇÃO: verifica se a criatura ainda existe antes de chamar say()
            if creature and creature:isCreature() then
                creature:say("-" .. primaryDamage, TALKTYPE_MONSTER_SAY, false, creature, creature:getPosition())
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not attacker or not creature then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- =========================
    -- 🛡️ DODGE (DEFESA NA MANA)
    -- =========================
    if creature:isPlayer() then
        local dStorage = creature:getStorageValue(12614)
        local dSkill = (dStorage and dStorage > 0) and dStorage or 0

        if (dSkill * 3) >= math.random(0, 1000) then
            primaryDamage = 0
            secondaryDamage = 0
            creature:getPosition():sendMagicEffect(231)
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
    end

    -- =========================
    -- 💥 CRITICAL (ATAQUE NA MANA)
    -- =========================
    if attacker:isPlayer() then
        local cStorage = attacker:getStorageValue(12435)
        local cSkill = (cStorage and cStorage > 0) and cStorage or 0

        if (cSkill * 3) >= math.random(0, 1000) then
            primaryDamage = primaryDamage * 2
            secondaryDamage = secondaryDamage * 2
            doSendMagicEffect(attacker:getPosition(), 173)

            -- CORREÇÃO: verifica se a criatura ainda existe antes de chamar say()
            if creature and creature:isCreature() then
                creature:say("-" .. primaryDamage, TALKTYPE_MONSTER_SAY, false, creature, creature:getPosition())
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end