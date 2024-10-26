#> pk_waystones:settings/tp_cooldown/set
# @input
#   $cooldown (int): amount of time in ticks to wait for before the player is able to tp with a waystone. 0 to disable the setting.
# Example: 
#   function pk_waystones:settings/tp_cooldown/set {cooldown:200} 

# Store parameter
$data modify storage pk:common temp.cooldown set value $(cooldown)

# Set score
$scoreboard players set $pk.waystones.settings.tp_cooldown pk.value $(cooldown)

# Warn player
execute if score $pk.waystones.settings.tp_cooldown pk.value matches 1.. run tellraw @s [{"text":"TP cooldown","color":"yellow"},{"text":" has been set to ","color":"gray"},{"nbt":"temp.cooldown","storage":"pk:common","color":"yellow"},{"text":" tick(s)","color":"gray"}]
execute unless score $pk.waystones.settings.tp_cooldown pk.value matches 1.. run tellraw @s [{"text":"TP cooldown","color":"yellow"},{"text":" has been disabled","color":"gray"}]