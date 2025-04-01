#> pk_waystones:settings/limit_per_player/set
# @input
#   count: count
# Example: 
#   function pk_waystones:settings/limit_per_player/set {count:1}

$scoreboard players set $pk.waystones.settings.limit_per_player pk.value $(count)

# Limited
execute if score $pk.waystones.settings.limit_per_player pk.value matches 0.. run tellraw @s [{text:"Players are now limited to ",color:"gray"},{score:{name:"$pk.waystones.settings.limit_per_player",objective:"pk.value"},color:"yellow"},{text:" waystones",color:"gray"}]
# Unlimited
execute unless score $pk.waystones.settings.limit_per_player pk.value matches 0.. run tellraw @s [{text:"Players are now not limited in the number of waystones they can own",color:"gray"}]