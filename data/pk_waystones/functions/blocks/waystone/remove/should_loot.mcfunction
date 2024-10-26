#> pk_waystones:blocks/waystone/remove/should_loot
# Check if the waystone existed enough time to be looted when removed 
# Used for protected-area plugins compatibility

# Store the created_at_gametime from the waystone data, or set it to 0 if the waystone was created before 3.2.3
scoreboard players set $created_at_gametime pk.temp 0
execute store result score $created_at_gametime pk.temp run data get storage pk:common temp.waystone.created_at_gametime 1
# Check if should loot
execute unless score $pk.waystones.settings.lootable_delay pk.value matches 0.. run scoreboard players set $pk.waystones.settings.lootable_delay pk.value 0
scoreboard players operation $age pk.temp = $gametime pk.value
scoreboard players operation $age pk.temp -= $created_at_gametime pk.temp
execute if score $pk.waystones.settings.lootable_delay pk.value > $age pk.temp run return 0

# @continue: Loot
data modify storage pk:common temp.args.variant set from storage pk:common temp.waystone.variant
function pk_waystones:blocks/waystone/remove/loot with storage pk:common temp.args