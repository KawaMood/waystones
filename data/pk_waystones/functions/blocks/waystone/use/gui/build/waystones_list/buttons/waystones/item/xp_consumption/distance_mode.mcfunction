#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/xp_consumption/distance_mode
# Calculate the levels to consume depending on the distance that separates waystones

# Get distance between the used waystone and the visible waystone
#   Prepare params
#   storage pk:common temp.used_waystone.pos is an int array containing coordinates of the used waystone
#      @within pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data
data modify storage pk:common temp.args.pos1 set from storage pk:common temp.used_waystone.pos
data modify storage pk:common temp.args.pos2 set value []
data modify storage pk:common temp.args.pos2 append from storage pk:common temp.visible_waystone.location.x
data modify storage pk:common temp.args.pos2 append from storage pk:common temp.visible_waystone.location.y
data modify storage pk:common temp.args.pos2 append from storage pk:common temp.visible_waystone.location.z
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 0 run data modify storage pk:common temp.args.mode set value "euclidian"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 1 run data modify storage pk:common temp.args.mode set value "manhattan"
#   Get distance
#   @writes $distance pk.temp
function pk_waystones:packages/get_distance/run

# Get the required levels
scoreboard players operation $xp_consumption.levels pk.temp = $distance pk.temp
scoreboard players operation $xp_consumption.levels pk.temp /= $pk.waystones.settings.xp_consumption.value pk.value