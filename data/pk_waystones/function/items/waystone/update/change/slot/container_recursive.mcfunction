#> pk_waystones:items/waystone/update/change/slot/container_recursive

# Update the current item
data modify storage pk:common temp.args.slot set from storage pk:common temp.container[-1].Slot
function pk_waystones:items/waystone/update/change/slot/container_concat_args_slot with storage pk:common temp.args 
execute summon armor_stand run function pk_waystones:items/waystone/update/change/slot/single with storage pk:common temp.args

# Recursive call
data remove storage pk:common temp.container[-1]
execute if data storage pk:common temp.container[0] run function pk_waystones:items/waystone/update/change/slot/container_recursive