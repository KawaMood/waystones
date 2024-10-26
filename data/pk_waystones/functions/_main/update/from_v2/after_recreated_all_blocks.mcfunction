#> pk_waystones:_main/update/from_v2/after_recreated_all_blocks

# Update players in database
function pk_waystones:tools/debug/update_players/start {source:"pk:waystones database.players", fallback: "function pk_waystones:_main/update/from_v2/stop"}