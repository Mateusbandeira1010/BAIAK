function onSay(player, words, param)
    local spells = {}
    local playerSpells = player:getInstantSpells()

    if not playerSpells or #playerSpells == 0 then
        player:sendCancelMessage("You don't have any spells.")
        return false
    end

    -- Filtra e organiza as magias
    for _, spell in ipairs(playerSpells) do
        if spell.level > 0 then
            local spellData = {
                level = spell.level,
                words = spell.words,
                mana = spell.manapercent > 0 and (spell.manapercent .. "%") or spell.mana
            }
            table.insert(spells, spellData)
        end
    end

    -- Ordena por nível
    table.sort(spells, function(a, b) return a.level < b.level end)

    local text = "  ---------- Spell List -----------\n\n"
    local prevLevel = -1

    for _, spell in ipairs(spells) do
        if prevLevel ~= spell.level then
            text = text .. "\n[Level " .. spell.level .. "]\n"
            prevLevel = spell.level
        end
        text = text .. " > " .. spell.words .. " - " .. spell.mana .. "\n"
    end

    -- 2175 é o ID do item que aparece na janela (Spellbook)
    player:showTextDialog(2175, text)
    return false
end