#> pk_waystones:blocks/waystone/remove/run

# Set component id score
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Stop the tick environment process
scoreboard players set $env.stop pk.temp 1

# Delete from the database
data modify storage pk:common temp.args set value {p1:"data remove storage pk:waystones database.waystones[{id:",p2:"}]"}
data modify storage pk:common temp.args.v1 set from storage pk:common temp.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args

# Kill dropped GUI items and potential barrel
execute align xyz run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{pk_data:{gui:1b}}}}},dx=0]
execute unless block ~ ~ ~ barrel align xyz run kill @e[type=item,nbt={Item:{id:"minecraft:barrel",count:1},Age:0s},dx=0,limit=1]

# Check if the waystones has been removed too quickly
#   Used for Worldguard compatibility
function pk_waystones:blocks/waystone/remove/should_loot

# Remove potential remaining blocks
setblock ~ ~-1 ~ air
setblock ~ ~ ~ air

# Remove components
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,predicate=pk_waystones:scores/custom_block/component_id/match_temp,distance=..10]

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Waystone at [", "color": "gray"},{"nbt":"temp.waystone.location.x","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.y","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.z","storage":"pk:common"},{"text": "] in "},{"nbt":"temp.waystone.location.dimension","storage":"pk:common"},{"text": " has been removed"}]