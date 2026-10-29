-- Core API functions implemented in Lua
dofile('data/lib/core/core.lua')

-- Compatibility library for our old Lua API
dofile('data/lib/compat/compat.lua')


-- Debugging helper function for Lua developers
dofile('data/lib/debugging/dump.lua')
dofile('data/lib/debugging/lua_version.lua')

-- Castle 24H
dofile('data/lib/events/castle.lua')
-- Castle 48H
dofile('data/lib/events/castle48h.lua')

-- Events
dofile('data/lib/events/battlefield.lua')

-- reward chest bosses
dofile('data/lib/custom/rewardchest_bosses.lua')

-- Server Open/Close
dofile('data/lib/serverstate.lua')
