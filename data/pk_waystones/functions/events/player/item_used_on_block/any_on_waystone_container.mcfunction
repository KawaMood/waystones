#> pk_waystones:events/player/item_used_on_block/any_on_waystone_container
# @within advancement pk_waystones:events/item_used_on_block/any_on_waystone_container

advancement revoke @s only pk_waystones:events/item_used_on_block/any_on_waystone_container

# Increment and set interaction.id score
scoreboard players add $next pk.custom_block.interaction.id 1
scoreboard players operation @s pk.custom_block.interaction.id = $next pk.custom_block.interaction.id

# Mark the current player
tag @s add pk.current.player

# Search the placed block
# @callback function pk_waystones:blocks/waystone/use/start
data modify storage pk:common temp.args set value {distance:10,block:"minecraft:barrel[open=true]",nbt:{Items:[{components:{"minecraft:custom_data":{pk_data:{custom_block:1b,from:"waystones",gui:1b,in_use:0b,id:"waystone"}}}}]},callback:"function pk_waystones:blocks/waystone/use/start",stop_at_first:true}
function pk_waystones:packages/search_block/start with storage pk:common temp.args

# Unmark the current player
tag @s remove pk.current.player