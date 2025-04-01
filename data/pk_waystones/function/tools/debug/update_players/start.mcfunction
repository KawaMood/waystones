#> pk_waystones:tools/debug/update_players/start
# @input
#   $source (string): storage path to the list of players name to update
#   $fallback (string): optional command to run at the end of the process. Set as empty string if no fallback is required

# Check if an update is in progress
execute if score $debugging pk.value matches 1 run tellraw @s {text: "Error: Another debug is already in progress.",color: "red"}
execute if score $debugging pk.value matches 1 run return fail

# @continue Prepare data
$data modify storage pk:common debug.update_players.params.source set value "$(source)"
$data modify storage pk:common debug.update_players.players set from storage $(source)
$data modify storage pk:common debug.update_players.fallback set value "$(fallback)"

# Set score
scoreboard players set $debugging pk.value 1

# Logs
tellraw @s [{text: "Starting to update all players ...", color:"gray"}]

# Mark debugger
tag @s add pk.debug.update_players

# Create item display player heads
data modify storage pk:common temp.destructive.players set from storage pk:common debug.update_players.players
execute if data storage pk:common temp.destructive.players[-1] run function pk_waystones:tools/debug/update_players/1

# Wait for them to resolve
schedule function pk_waystones:tools/debug/update_players/3 2s