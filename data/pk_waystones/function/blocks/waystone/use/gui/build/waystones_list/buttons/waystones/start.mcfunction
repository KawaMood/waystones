#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/start
# @context user at the waystone container location (aligned xyz)
# @requires
#   storage pk:common temp.visible_waystones: a list of all waystones that can be seen by the player

# Prepare item slot
scoreboard players set $slot pk.temp 0

# Prepare "for" loop starting and ending index
execute store result score $length pk.temp run data get storage pk:common temp.visible_waystones
scoreboard players operation $i pk.temp = $gui.page pk.temp
scoreboard players operation $i pk.temp *= $18 pk.value
scoreboard players operation $i_max pk.temp = $i pk.temp
scoreboard players remove $i pk.temp 18
execute if score $i_max pk.temp > $length pk.temp run scoreboard players operation $i_max pk.temp = $length pk.temp
scoreboard players remove $i_max pk.temp 1

# Store displayed amount of waystones (for toolbar's dynamical gui_page_waystones_count filler)
scoreboard players operation $gui.page.waystones.count pk.temp = $i_max pk.temp
scoreboard players operation $gui.page.waystones.count pk.temp -= $i pk.temp
scoreboard players add $gui.page.waystones.count pk.temp 1

# Recursively set waystone item
scoreboard players set $in_water pk.temp 0
execute if block ~ ~-1 ~ barrier[waterlogged=true] run scoreboard players set $in_water pk.temp 1
setblock ~ ~-1 ~ oak_sign
execute store result storage pk:common temp.args.i int 1 run scoreboard players get $i pk.temp
function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/recursive with storage pk:common temp.args
setblock ~ ~-1 ~ barrier
execute if score $in_water pk.temp matches 1 run setblock ~ ~-1 ~ barrier[waterlogged=true]