#> pk_waystones:settings/limit_per_player/set
# @input
#   value: value in ticks
# Example: 
#   function pk_waystones:settings/open_container_delay/get

execute store result score $settings.open_container_delay pk.temp run data get storage pk:waystones settings.open_container_delay

tellraw @s [{text:"Open container delay is set to ",color:"gray"},{score:{name:"$settings.open_container_delay",objective:"pk.temp"},color:"yellow"},{text:" tick(s)",color:"gray"}]