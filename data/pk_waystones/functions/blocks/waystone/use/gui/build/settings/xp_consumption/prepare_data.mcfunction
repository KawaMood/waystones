#> pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data
# @context user at the waystone container location (aligned xyz)
# The player who opened the waystone container is marked with "pk.current.player"
# Storage:
#   pk:common temp.used_waystone: the current used waystone data

# Store waystone location if the mode of the settings is based on a distance calculation
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 0..1 run function pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/store_location

# Store the current user level
execute store result score $player.level pk.temp run xp query @a[tag=pk.current.player,distance=..20,limit=1] levels