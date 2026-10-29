local config = {
    [1] = { -- Sorcerer
        items = {
            {2534, 1},
            {7426, 1},
            {8871, 1},
            {2323, 1},
            {7896, 1},
            {2195, 1},
            {2173, 1},
            {2124, 1}
        },
        container = {
            {2120, 1},
            {5710, 1},
            {2160, 15},
            {7620, 1},
            {2789, 50},
            {7618, 1},
            {7590, 1},
        }
    },

    [2] = { -- Druid
        items = {
            {2534, 1},
            {7426, 1},
            {8871, 1},
            {2323, 1},
            {7896, 1},
            {2195, 1},
            {2173, 1},
            {2124, 1}
        },
        container = {
            {2120, 1},
            {5710, 1},
            {2160, 15},
            {7620, 1},
            {2789, 50},
            {7618, 1},
            {7590, 1},
        }
    },

    [3] = { -- Paladin
        items = {
            {7366, 1},
            {2519, 1},
            {7368, 1},
            {2195, 1},
            {2488, 1},
            {2487, 1},
            {2491, 1},
            {2173, 1},
            {2124, 1}
        },
        container = {
            {2120, 1},
            {5710, 1},
            {2160, 15},
            {7620, 1},
            {2789, 50},
            {7618, 1},
            {8472, 1},
        }
    },

    [4] = { -- Knight
        items = {
            {8924, 1},
            {2519, 1},
            {2195, 1},
            {2488, 1},
            {2487, 1},
            {2491, 1},
            {2173, 1},
            {2124, 1}
        },
        container = {
            {2120, 1},
            {5710, 1},
            {2160, 15},
            {7620, 1},
            {2789, 50},
            {7618, 1},
            {8473, 1},
        }
    }
}

function onLogin(player)
    local vocation = player:getVocation():getId()
    local cfg = config[vocation]

    if not cfg then
        return true
    end

    -- só no primeiro login
    if player:getLastLoginSaved() ~= 0 then
        return true
    end

    -- 🔥 EQUIPAR ITENS CORRETAMENTE
    for i = 1, #cfg.items do
        local item = Game.createItem(cfg.items[i][1], cfg.items[i][2])
        if item then
            player:addItemEx(item, true, cfg.items[i][3])
        end
    end

    -- 🎒 BACKPACK
    local backpack = player:addItem(1988)
    if not backpack then
        return true
    end

    -- 📦 ITENS DENTRO DA BP
    for i = 1, #cfg.container do
        backpack:addItem(cfg.container[i][1], cfg.container[i][2])
    end

    return true
end