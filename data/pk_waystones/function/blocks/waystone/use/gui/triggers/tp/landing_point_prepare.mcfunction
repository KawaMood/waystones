#> pk_waystones:blocks/waystone/use/gui/triggers/tp/landing_point_prepare
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.targeted_waystone: data of the waystone the player clicked from the GUI

# Store coordinates with a scale of 10
execute store result score $x pk.temp run data get storage pk:common temp.targeted_waystone.location.x 10
execute store result score $y pk.temp run data get storage pk:common temp.targeted_waystone.location.y 10
execute store result score $z pk.temp run data get storage pk:common temp.targeted_waystone.location.z 10

# Center coordinates
scoreboard players add $x pk.temp 5
scoreboard players add $y pk.temp 5
scoreboard players add $z pk.temp 5

# Prepare offset (on X or Z axis)
scoreboard players set $offset pk.temp 10
execute if predicate pk_waystones:gameplay/has_vehicle_or_companion run scoreboard players add $offset pk.temp 10
execute unless data storage pk:common temp.targeted_waystone.facing run scoreboard players operation $z pk.temp -= $offset pk.temp
execute if data storage pk:common temp.targeted_waystone{facing:"west"} run scoreboard players operation $x pk.temp -= $offset pk.temp
execute if data storage pk:common temp.targeted_waystone{facing:"east"} run scoreboard players operation $x pk.temp += $offset pk.temp
execute if data storage pk:common temp.targeted_waystone{facing:"north"} run scoreboard players operation $z pk.temp -= $offset pk.temp
execute if data storage pk:common temp.targeted_waystone{facing:"south"} run scoreboard players operation $z pk.temp += $offset pk.temp

# Store the landing point coordinates and dimension in storage
data modify storage pk:common temp.landing_point.dimension set from storage pk:common temp.targeted_waystone.location.dimension
execute store result storage pk:common temp.landing_point.x double 0.1 run scoreboard players get $x pk.temp
execute store result storage pk:common temp.landing_point.y double 0.1 run scoreboard players get $y pk.temp
execute store result storage pk:common temp.landing_point.z double 0.1 run scoreboard players get $z pk.temp