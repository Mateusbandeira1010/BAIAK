local exhaustion = {}

function onSay(player, words, param)
    local guid = player:getGuid()

    if exhaustion[guid] and os.time() < exhaustion[guid] then
        player:sendCancelMessage("Aguarde alguns segundos.")
        return false
    end
    exhaustion[guid] = os.time() + 5

    local timeNow = os.time()
    local dayLimit   = timeNow - 86400
    local weekLimit  = timeNow - (7 * 86400)
    local monthLimit = timeNow - (30 * 86400)

    local contents = {day = {}, week = {}, month = {}}

    -- Query correta para o seu banco TFS 1.7
    local query = string.format([[
        SELECT pd.time, pd.level, p.name
        FROM player_deaths pd
        LEFT JOIN players p ON pd.player_id = p.id
        WHERE pd.killed_by = %s
          AND pd.unjustified = 1
          AND pd.time >= %d
        ORDER BY pd.time DESC
    ]], db.escapeString(player:getName()), monthLimit)

    local resultId = db.storeQuery(query)

    if resultId ~= false then
        repeat
            local fragDate  = result.getNumber(resultId, "time")
            local fragLevel = result.getNumber(resultId, "level")
            local fragName  = result.getString(resultId, "name")

            local content = {name = fragName, level = fragLevel, date = fragDate}

            if fragDate >= dayLimit then
                table.insert(contents.day, content)
            elseif fragDate >= weekLimit then
                table.insert(contents.week, content)
            else
                table.insert(contents.month, content)
            end
        until not result.next(resultId)
        result.free(resultId)
    end

    local size = {
        day   = #contents.day,
        week  = #contents.week,
        month = #contents.month
    }

    local msg = "--- HISTORICO DE FRAGS ---\n\n"

    msg = msg .. "Hoje: " .. size.day .. " frag(s)\n"
    if size.day > 0 then
        for _, c in ipairs(contents.day) do
            msg = msg .. "  * " .. c.name .. " (lvl " .. c.level .. ") - " .. os.date("%d/%m %H:%M", c.date) .. "\n"
        end
        msg = msg .. "\n"
    end

    msg = msg .. "Esta Semana: " .. (size.day + size.week) .. " frag(s)\n"
    if size.week > 0 then
        for _, c in ipairs(contents.week) do
            msg = msg .. "  * " .. c.name .. " (lvl " .. c.level .. ") - " .. os.date("%d/%m %H:%M", c.date) .. "\n"
        end
        msg = msg .. "\n"
    end

    msg = msg .. "Este Mes: " .. (size.day + size.week + size.month) .. " frag(s)\n"
    if size.month > 0 then
        for _, c in ipairs(contents.month) do
            msg = msg .. "  * " .. c.name .. " (lvl " .. c.level .. ") - " .. os.date("%d/%m %H:%M", c.date) .. "\n"
        end
        msg = msg .. "\n"
    end

    local skull = player:getSkull()
    if skull == SKULL_RED then
        msg = msg .. "Status: RED SKULL ATIVA"
    elseif skull == SKULL_BLACK then
        msg = msg .. "Status: BLACK SKULL ATIVA"
    else
        msg = msg .. "Status: Sem Skull de Frag"
    end

    player:showTextDialog(2175, msg)
    return false
end