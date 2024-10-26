#> pk_waystones:_main/tick
# Main tick

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Utilities:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Store the current gametime
execute store result score $gametime pk.value run time query gametime
# Allow players to change their own waystones-related settings
scoreboard players enable @a pk.waystones.hide_coordinates

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Settings:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Tp cooldown
scoreboard players remove @a[scores={pk.waystones.tp_cooldown=1..}] pk.waystones.tp_cooldown 1

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Events:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Player joined back
execute as @a[scores={pk.waystones.leave_game=1..}] at @s run function pk_waystones:events/player/joined_back/run

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Custom blocks:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Waystones
execute as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/main/tick

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Flags:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Player mined barrel
scoreboard players set @a[scores={pk.waystones.mined.barrel=1..}] pk.waystones.mined.barrel 0
# Player is in fight
scoreboard players remove @a[scores={pk.waystones.in_fight=1..}] pk.waystones.in_fight 1

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Safety:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute if score $pk.waystones.settings.tick_clear_gui_items pk.value matches 1.. run clear @a *[custom_data~{pk_data:{gui:1b,from:"waystones"}}]