---------------------------------------------------------------------------
-- -- -- PRE UPDATES
---------------------------------------------------------------------------
krastorio.stage = "data-updates"
---------------------------------------------------------------------------
-- -- -- CONTENTS UPDATES (data updates)
---------------------------------------------------------------------------
-- -- Modifing vanilla game objects
require(kr_prototypes_path .. "vanilla-changes/mandatory-vanilla-updates")
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data update stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts.data-updates."
require(scripts_path .. "Flow Control")
---------------------------------------------------------------------------
