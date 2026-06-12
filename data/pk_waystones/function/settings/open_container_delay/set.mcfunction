#> pk_waystones:settings/limit_per_player/set
# @input
#   value: value in ticks
# Example: 
#   function pk_waystones:settings/open_container_delay/set {value:2}

# Normalize value
data remove storage pk:common temp.value
$data modify storage pk:common temp.value $(value)
execute store result score $settings.open_container_delay pk.temp run data get storage pk:common temp.value
execute if score $settings.open_container_delay pk.temp matches ..-1 run scoreboard players set $settings.open_container_delay pk.temp 0
execute store result storage pk:waystones settings.open_container_delay int 1 run scoreboard players get $settings.open_container_delay pk.temp

# Logs
tellraw @s [{text:"Open container delay is set to ",color:"gray"},{score:{name:"$settings.open_container_delay",objective:"pk.temp"},color:"yellow"},{text:" tick(s)",color:"gray"}]