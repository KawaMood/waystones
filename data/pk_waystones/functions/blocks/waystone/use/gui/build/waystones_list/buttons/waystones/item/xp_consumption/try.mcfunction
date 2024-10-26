#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/xp_consumption/try
# @context user at the waystone container location (aligned xyz)
# Storage:
#   pk:common temp.visible_waystone: the current visible waystone of the loop
#   pk:common temp.used_waystone: the currently used waystone
#   pk:common temp.gui.item: the current button item in creation to append to the waystone list
# Scores:
#   $waystone_user.level pk.temp: current user's levels
#      @within pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data

# If the waystone is free to use, cancel.
scoreboard players set $ignore pk.temp 0
execute if data storage pk:common temp.visible_waystone.ignore.settings{xp_consumption:1b} run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/xp_consumption/ignore
execute if score $ignore pk.temp matches 1 run return 0

# If the setting mode is "manhattan" or "euclidian"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 0..1 run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/xp_consumption/distance_mode
# If it is "fixed"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 2 run scoreboard players operation $xp_consumption.levels pk.temp = $pk.waystones.settings.xp_consumption.value pk.value

# Set required levels to item's data
execute store result storage pk:common temp.gui.item.components."minecraft:custom_data".pk_data.required_levels int 1 run scoreboard players get $xp_consumption.levels pk.temp

# Set required levels in lore
execute if score $xp_consumption.levels pk.temp <= $player.level pk.temp run data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Requires ","color":"green","italic":false},{"score":{"name":"$xp_consumption.levels","objective":"pk.temp"}},{"text":" level(s) for teleportation"}]'
execute if score $xp_consumption.levels pk.temp > $player.level pk.temp run data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Requires ","color":"red","italic":false},{"score":{"name":"$xp_consumption.levels","objective":"pk.temp"}},{"text":" level(s) for teleportation"}]'
data modify storage pk:common temp.gui.item.components."minecraft:lore" append from block ~ ~-1 ~ front_text.messages[0]