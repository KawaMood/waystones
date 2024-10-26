#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/taken/run
# @context the user (tag=pk.current.player) at the used waystone's controller
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# Storage:
#   pk:common temp.used_waystone: the currently used waystone

# Cancel if the player isn't the owner or a manager
scoreboard players set $trigger.stop pk.temp 0
function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/check_permissions
execute if score $trigger.stop pk.temp matches 1 run return 0

# Give item to user
#   Set default params
data modify storage pk:common temp.args set value {components:{"minecraft:writable_book_content":{pages:[]}},id:"minecraft:writable_book"}
data modify storage pk:common temp.args.count set value 1
#   Set params.components."minecraft:writable_book_content".pages
data modify storage pk:common temp.array_1 set value []
data modify storage pk:common temp.array_1 append from storage pk:common temp.used_waystone.shared_with[].name
execute if data storage pk:common temp.array_1[-1] run function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/taken/pages_add_recursive
function pk_waystones:packages/dynamic_item/give with storage pk:common temp.args

# Update data unless it has been swapped with another accepted item
execute if score $gui.action.put.accepted_item pk.temp matches 0 run data modify storage pk:common temp.used_waystone.shared_with set value []
execute if score $gui.action.put.accepted_item pk.temp matches 0 run function pk_waystones:blocks/waystone/use/data/used_waystone/update

# Update the GUI unless it has been swapped with another accepted item
execute if score $gui.action.put.accepted_item pk.temp matches 0 align xyz run function pk_waystones:blocks/waystone/use/gui/build/run