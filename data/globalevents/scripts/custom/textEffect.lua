function onThink(interval)
    local effects = {
        -- Portais Principais
        {position = Position(1140, 1051, 7), text = "DEUS\xC9FIEL", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1134, 1041, 7), text = "AREA DNT", effect = 30, color = TEXTCOLOR_ORANGE},
        {position = Position(1122, 1044, 7), text = "VIP1", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1124, 1044, 7), text = "VIP2", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1126, 1044, 7), text = "VIP3", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1150, 1051, 7), text = "ROLETA", effect = 18, color = TEXTCOLOR_YELLOW},
        {position = Position(1141, 1048, 7), text = "CASSINO", effect = 18, color = TEXTCOLOR_RED},
        {position = Position(168, 58, 7), text = "PVP'S", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1138, 1048, 7), text = "TELEPORTS", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1135, 1048, 7), text = "QUESTS", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1136, 1048, 7), text = "EXCLUSIVE", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(149, 62, 7), text = "VIP 2", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1131, 1054, 7), text = "DEMONIC HUNT", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(153, 52, 7), text = "PVP'WARS", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1143, 1048, 7), text = "NPCS", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1139, 1048, 7), text = "TASK", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(165, 58, 7), text = "FREE ITEMS", effect = 18, color = TEXTCOLOR_YELLOW},
        {position = Position(1134, 1053, 7), text = "CASTLE 48hrs", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1145, 1053, 7), text = "CASTLE 24hrs", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(162, 52, 7), text = "EVENTS", effect = 18, color = TEXTCOLOR_YELLOW},
        {position = Position(1127, 1049, 7), text = "COLISEUM", effect = 18, color = TEXTCOLOR_RED},
        {position = Position(1137, 1048, 7), text = "TREINER", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1142, 1048, 7), text = "BOSSES", effect = 18, color = TEXTCOLOR_RED},
        {position = Position(1129, 1044, 7), text = "BOSS", effect = 18, color = TEXTCOLOR_RED},
        {position = Position(1131, 1044, 7), text = "PUSH ALL", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1140, 1048, 7), text = "HOUSES", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1137, 1042, 7), text = "MORGUM", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1139, 1042, 7), text = "SKYLER", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1141, 1042, 7), text = "ROOKGAARD", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1143, 1042, 7), text = "ISSAVI", effect = 18, color = TEXTCOLOR_ORANGE},
        {position = Position(1133, 1044, 7), text = "QUESTDAY", effect = 18, color = TEXTCOLOR_ORANGE},




        -- Portais VIPs (cada um com cor diferente)
       --  {position = Position(754, 28, 7), text = "VIP 1", effect = 30, color = TEXTCOLOR_BLUE},
       --  {position = Position(759, 28, 7), text = "VIP 2", effect = 30, color = TEXTCOLOR_GREEN},
       --  {position = Position(764, 28, 7), text = "VIP 3", effect = 30, color = TEXTCOLOR_TEAL},
        -- {position = Position(769, 28, 7), text = "VIP 4", effect = 30, color = TEXTCOLOR_PURPLE},
        -- {position = Position(758, 32, 7), text = "VIP 5", effect = 30, color = TEXTCOLOR_ORANGE},
        -- {position = Position(763, 32, 7), text = "VIP 6", effect = 30, color = TEXTCOLOR_RED},
        -- {position = Position(768, 32, 7), text = "VIP 7", effect = 30, color = TEXTCOLOR_YELLOW},
        -- {position = Position(774, 30, 7), text = "VIP 8", effect = 30, color = TEXTCOLOR_LIGHTBLUE}
    }

    for i = 1, #effects do
        local settings = effects[i]
        -- Verifica se tem players perto da posição (raio de 7 sqms)
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        
        if #spectators > 0 then
            -- Exibe o efeito visual no portal
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
            
            Game.sendAnimatedText(settings.text, settings.position, settings.color or TEXTCOLOR_LIGHTBLUE)
        end
    end
    return true
end