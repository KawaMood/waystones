# Hide waystones coordinates in the waystones GUI
#
# /trigger pk.waystones.trigger.hide_coordinates set <value>
#   Where <value> can be 1 to hide waystones coordinates or 2 to show them

execute unless score @s pk.waystones.trigger.hide_coordinates matches 1..2 run return run function pk_waystones:events/player/trigger/hide_coordinates/fail

execute if score @s pk.waystones.trigger.hide_coordinates matches 1 run scoreboard players set @s pk.waystones.player_setting.hide_coordinates 1
execute if score @s pk.waystones.trigger.hide_coordinates matches 2 run scoreboard players set @s pk.waystones.player_setting.hide_coordinates 0

execute if score @s pk.waystones.player_setting.hide_coordinates matches 0 run tellraw @s {text:"Waystones coordinates are now visible",color:"yellow"}
execute if score @s pk.waystones.player_setting.hide_coordinates matches 1 run tellraw @s {text:"Waystones coordinates are now hidden",color:"yellow"}

scoreboard players set @s pk.waystones.trigger.hide_coordinates 0