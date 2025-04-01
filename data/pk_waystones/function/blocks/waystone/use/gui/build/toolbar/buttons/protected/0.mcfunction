#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/protected/0

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {id:"minecraft:leather_chestplate",count:1,components:{"minecraft:custom_name":[{text:"Protection: ",italic:false},{text:"Disabled",color:"gray"}],"minecraft:lore":[{text:"Click to enable protection",color:"gray",italic:false}],"minecraft:attribute_modifiers":[],"minecraft:dyed_color":6120292,"minecraft:bundle_contents":[{id:"minecraft:stick",count:64}],"minecraft:tooltip_display":{hidden_components:["minecraft:dyed_color","minecraft:attribute_modifiers"]},"minecraft:custom_data":{pk_data:{gui:1b,from:"waystones",trigger:"protected/change",trigger_params:{allowed:0b,protected:1b}}},"minecraft:custom_model_data":{strings:["pk_waystones:gui_protection_false"]}},Slot:22b}

# Check permissions
#   Disallow by default
scoreboard players set $allow pk.temp 0
#   "Protection Change" is enabled and player is the owner
execute unless score $pk.waystones.permissions.change.protection pk.value matches 0 if score $player_is_owner pk.temp matches 1 run scoreboard players set $allow pk.temp 1
#   Player is manager
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $allow pk.temp 1
#   Set items data depending on permissions
execute if score $allow pk.temp matches 0 run data remove storage pk:common temp.gui.item.components."minecraft:lore"
execute if score $allow pk.temp matches 1 run data modify storage pk:common temp.gui.item.components."minecraft:custom_data".pk_data.trigger_params.allowed set value 1b

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item