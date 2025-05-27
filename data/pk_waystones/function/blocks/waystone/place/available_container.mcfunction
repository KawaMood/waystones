#> pk_waystones:blocks/waystone/place/available_container
# @context should be set at container

# Get the waystone data
data modify storage pk:common temp.args set value {p1:"data modify storage pk:common temp.waystone set from storage pk:waystones database.waystones[{id:",p2:"}]"}
execute align xyz run data modify storage pk:common temp.args.v1 set from entity @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] data.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args

# Redefine container name
function pk_waystones:blocks/waystone/place/redefine_container_name with storage pk:common temp.waystone

# Remove block
setblock ~ ~ ~ air strict

# Set container
setblock ~ ~ ~ barrel[facing=down]{Items:[{id:"minecraft:light_gray_stained_glass_pane",count:1,components:{"minecraft:custom_data":{pk_data:{custom_block:1b,id:"waystone",from:"waystones",gui:1b,in_use:0b}}},Slot:0b}]} strict
data modify block ~ ~ ~ CustomName set from storage pk:common temp.custom_name