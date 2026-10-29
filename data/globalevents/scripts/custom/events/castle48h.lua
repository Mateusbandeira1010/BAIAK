function onTime(interval)
    local hour = tonumber(os.date("%H"))
    if hour == Castle48H.openHour then
        Castle48H:open()
    elseif hour == Castle48H.closeHour then
        Castle48H:close()
    end
    return true
end
