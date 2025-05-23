$execute unless data storage pk:waystones database.waystones[{id:$(id)}] run return run tellraw @s {text:"Found no waystone matching id \"$(id)\" to forget about",color:"red"}

$execute store result score $forget.discovered pk.temp run data remove storage pk:waystones database.waystones[{id:$(id)}].discovered_by[{uuid:$(uuid)}]
$execute store result score $forget.private pk.temp run data remove storage pk:waystones database.waystones[{id:$(id)}].shared_with[{uuid:$(uuid)}]

$execute unless score $forget.discovered pk.temp matches 1 unless score $forget.private pk.temp matches 1 run return run tellraw @s {text:"Found no waystone matching id \"$(id)\" to forget about",color:"red"}

$tellraw @s {text:"Forgot the waystone matching id \"$(id)\" successfully",color:"yellow"}