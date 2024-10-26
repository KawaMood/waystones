#> pk_waystones:blocks/waystone/use/gui/actions/put/polluting/return_items_recursive
# @context the user (tag=pk.current.player) at the used waystone's controller
# Put items have been stored in storage pk:common temp.gui.put_items
#   @within function pk_waystones:blocks/waystone/use/gui/actions/watch

# Return item to user
data modify storage pk:common temp.args set value {components:{}}
data modify storage pk:common temp.args.id set from storage pk:common temp.gui.put_items[-1].id
data modify storage pk:common temp.args.count set from storage pk:common temp.gui.put_items[-1].count
data modify storage pk:common temp.args.components set from storage pk:common temp.gui.put_items[-1].components
function pk_waystones:packages/dynamic_item/give with storage pk:common temp.args

# Remove item from GUI
data modify storage pk:common temp.args set value {p1:"data remove block ~ ~ ~ Items[{Slot:",p2:"b}]"}
data modify storage pk:common temp.args.v1 set from storage pk:common temp.gui.put_items[-1].Slot
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args

# Recursive call
data remove storage pk:common temp.gui.put_items[-1]
execute if data storage pk:common temp.gui.put_items[-1] run function pk_waystones:blocks/waystone/use/gui/actions/put/polluting/return_items_recursive