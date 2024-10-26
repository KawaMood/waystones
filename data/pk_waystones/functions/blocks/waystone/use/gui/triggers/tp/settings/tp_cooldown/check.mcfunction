#> function pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/tp_cooldown/check

# Prepare args
execute store result storage pk:common temp.args.seconds int 0.05 run scoreboard players get @s pk.waystones.tp_cooldown

#@return Stop if the player cooldown is still > 1
execute if entity @s[scores={pk.waystones.tp_cooldown=1..}] run return run function pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/tp_cooldown/cancel with storage pk:common temp.args

# Reset timer
scoreboard players operation @s pk.waystones.tp_cooldown = $pk.waystones.settings.tp_cooldown pk.value