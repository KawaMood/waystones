#> pk_waystones:packages/get_distance/manhattan

scoreboard players set $packages.get_distance.stop pk.temp 1
execute store result score $distance pk.temp run data get storage pk:common temp.args.x
execute store result score $dy pk.temp run data get storage pk:common temp.args.y
scoreboard players operation $distance pk.temp += $dy pk.temp
execute store result score $dz pk.temp run data get storage pk:common temp.args.z
scoreboard players operation $distance pk.temp += $dz pk.temp