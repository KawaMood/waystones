#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/private

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {id:"minecraft:leather_helmet",count:1,components:{"minecraft:custom_name":[{text:"Visibility: ",italic:false},{text:"Private",color:"red",italic:false}],"minecraft:dyed_color":13200001,"minecraft:attribute_modifiers":[],"minecraft:trim":{material:"minecraft:copper",pattern:"minecraft:sentry"},"minecraft:bundle_contents":[{id:"minecraft:stick",count:64}],"minecraft:tooltip_display":{hidden_components:["minecraft:dyed_color","minecraft:attribute_modifiers","minecraft:trim"]},"minecraft:custom_data":{pk_data:{gui:1b,from:"waystones",trigger:"visibility/change",trigger_params:{allowed:1b}}},"minecraft:custom_model_data":{strings:["pk_waystones:gui_visibility_private"]}},Slot:21b}

# Check permissions to define the trigger
#   Score $next_visibility: Public: 1 | Private: 2 | Discover: 3
scoreboard players set $next_visibility pk.temp 0
#   (Player is the owner) & (Discover is allowed) & (Public is disallowed): Set to Private
execute if score $player_is_owner pk.temp matches 1 unless score $pk.waystones.permissions.change.visiblity.discover pk.value matches 0 if score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 run scoreboard players set $next_visibility pk.temp 3
#   (Player is the owner) & (Public is allowed): Set to Public
execute if score $player_is_owner pk.temp matches 1 unless score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 run scoreboard players set $next_visibility pk.temp 1
#   Player is a manager: Set to Public
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $next_visibility pk.temp 1

# Set lore and trigger depending on permissions
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/set_lore_and_trigger

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item