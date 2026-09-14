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
$data remove storage pk:common temp.container[{components:{"minecraft:custom_data":{pk_data:{id:"waystone",from:"waystones",version:$(version)s}}}}]
execute if data storage pk:common temp.container[{}] run function pk_waystones:items/waystone/update/change/slot/container_recursive

# Free player
tag @s remove pk.current.player