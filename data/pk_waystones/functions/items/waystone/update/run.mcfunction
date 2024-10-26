#> pk_waystones:items/waystone/update/run
#
# @args
#   version (byte): item version to set
#
# Update waystones items from lower versions

# Mark player
tag @s add pk.current.player

# Container
data modify storage pk:common temp.container set value []
data modify storage pk:common temp.container append from entity @s Inventory[{components:{"minecraft:custom_data":{pk_data:{id:"waystone",from:"waystones"}}}}]
$data remove storage pk:common temp.container[{components:{"minecraft:custom_data":{pk_data:{id:"waystone",from:"waystones",version:$(version)b}}}}]
data remove storage pk:common temp.container[{Slot:-106b}]
data remove storage pk:common temp.container[{Slot:100b}]
data remove storage pk:common temp.container[{Slot:101b}]
data remove storage pk:common temp.container[{Slot:102b}]
data remove storage pk:common temp.container[{Slot:103b}]
data modify storage pk:common backup set from storage pk:common temp.container
execute if data storage pk:common temp.container[{}] run function pk_waystones:items/waystone/update/change/slot/container_recursive

# Offhand
$execute if items entity @s weapon.offhand player_head[custom_data~{pk_data:{id:"waystone",from:"waystones"}},!custom_data~{pk_data:{version:$(version)b}}] at @s summon armor_stand run function pk_waystones:items/waystone/update/change/slot/offhand

# Free player
tag @s remove pk.current.player