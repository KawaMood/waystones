#> pk_waystones:settings/xp_consumption/get

# Get used distance mode
execute unless score $pk.waystones.settings.xp_consumption.mode pk.value matches 1.. run data modify storage pk:common temp.mode set value "euclidian"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 1 run data modify storage pk:common temp.mode set value "manhattan"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 2 run data modify storage pk:common temp.mode set value "fixed"

# Logs
#   Mode manatthan or euclidian
execute if score $pk.waystones.settings.xp_consumption.value pk.value matches 1.. if score $pk.waystones.settings.xp_consumption.mode pk.value matches 0..1 run tellraw @s [{"text":"Teleporting currently requires 1 level per ","color":"gray"},{"nbt":"temp.value","storage":"pk:common","color":"yellow"},{"text":" blocks, distance between two waystones being calculated with the \"","color":"gray"},{"nbt":"temp.mode","storage":"pk:common","color":"yellow"},{"text":"\" method","color":"gray"}]
#    Mode fixed
execute if score $pk.waystones.settings.xp_consumption.value pk.value matches 1.. if score $pk.waystones.settings.xp_consumption.mode pk.value matches 2 run tellraw @s [{"text":"Teleporting currently requires","color":"gray"},{"nbt":"temp.value","storage":"pk:common","color":"yellow"},{"text":" level(s) no matter the distance that separates both waystones","color":"gray"}]
#   Disable setting
execute unless score $pk.waystones.settings.xp_consumption.value pk.value matches 1.. run tellraw @s [{"text":"Level Consumption","color":"yellow"},{"text":" on teleportation is currently disabled","color":"gray"}]