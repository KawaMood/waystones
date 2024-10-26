#> pk_waystones:blocks/waystone/use/gui/triggers/return_put_item
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.accepted_item: accepted item from the put items list
#      @within pk_waystones:blocks/waystone/use/gui/actions/put/accepted/shared_with/run

# Return item to user if not allowed to put it
data modify storage pk:common temp.args set value {components:{}}
data modify storage pk:common temp.args.id set from storage pk:common temp.gui.accepted_item.id
data modify storage pk:common temp.args.count set from storage pk:common temp.gui.accepted_item.count
data modify storage pk:common temp.args.components set from storage pk:common temp.gui.accepted_item.components
function pk_waystones:packages/dynamic_item/give with storage pk:common temp.args