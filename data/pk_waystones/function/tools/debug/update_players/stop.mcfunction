#> pk_waystones:tools/debug/update_players/stop

# Logs
tellraw @a[tag=pk.debug.update_players] [{text: "Updated all players successfully", color: "gray"}]

# Reset score
scoreboard players reset $debugging pk.value

# Unmark recreater
tag @a[tag=pk.debug.update_players] remove pk.debug.update_players

# Fallback
execute unless data storage pk:common debug.update_players{fallback:""} run function pk_waystones:tools/debug/recreate_all_blocks/stop_fallback with storage pk:common debug.update_players