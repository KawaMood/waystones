#> pk_waystones:_main/update/from_v2/start

# Check if an update is in progress
execute if score $update pk.value matches 1 run tellraw @s {"text": "Error: Another update is already in progress.","color": "red"}
execute if score $update pk.value matches 1 run return fail

# Mark updater
tag @s add pk.update_from_v2

# Starting the process
tellraw @s [{"text": "Starting to update all features from ","color": "gray"},{"text": "KawaMood's Waystones (V.2)","color": "aqua","bold": true},{"text": "...","color": "gray"}]
scoreboard players set $update pk.value 1
data remove storage pk:common update

# Update stored blocks in database
#   Waystones
function pk_waystones:_main/update/from_v2/blocks/start {source:"pk.waystones:data Blocks.Waystones",block_id:"waystone"}

# Recreate all blocks
function pk_waystones:tools/debug/recreate_all_blocks/start {source:"pk:waystones database.waystones", block_id:"waystone", fallback: "function pk_waystones:_main/update/from_v2/after_recreated_all_blocks"}