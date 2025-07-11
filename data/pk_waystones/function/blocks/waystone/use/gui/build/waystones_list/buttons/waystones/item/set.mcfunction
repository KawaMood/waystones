#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/set
# @context user at the waystone container location (aligned xyz)
# Storage:
#   pk:common temp.visible_waystone: the current visible waystone of the loop
# Score:
#   $hide_coordinates pk.temp: 0 if it can see coordinates, 1 if it can't
#       @within function pk_waystones:blocks/waystone/use/gui/build/run

# Set id, components, Count and Slot
data modify storage pk:common temp.gui.item set value {count:1}
execute store result storage pk:common temp.gui.item.Slot byte 1 run scoreboard players get $slot pk.temp
data modify storage pk:common temp.gui.item merge from storage pk:common temp.visible_waystone.render_item
data modify storage pk:common temp.gui.item.id set value "minecraft:cooked_cod"
data modify storage pk:common temp.gui.item.components."!minecraft:consumable" set value {}
data modify storage pk:common temp.gui.item.components."minecraft:item_model" set from storage pk:common temp.visible_waystone.render_item.id

# Set attributes
data modify storage pk:common temp.gui.item.components."minecraft:custom_data".pk_data set value {gui:1b,from:"waystones",trigger:"tp/run"}

# Store waystone id
data modify storage pk:common temp.gui.item.components."minecraft:custom_data".pk_data.waystone.id set from storage pk:common temp.visible_waystone.id

# Set name
data modify block ~ ~-1 ~ front_text.messages[0] set value {nbt:"temp.visible_waystone.name",storage:"pk:common",color:"yellow",italic:false,"interpret":true}
data modify storage pk:common temp.gui.item.components."minecraft:custom_name" set from block ~ ~-1 ~ front_text.messages[0]

# Set bundle_content (to avoid the item to be collectable with bundles)
data modify storage pk:common temp.gui.item.components."minecraft:bundle_contents" set value [{id:"minecraft:stick",count:64}]

# Set location in lore
data modify storage pk:common temp.gui.item.components."minecraft:lore" set value []
data modify block ~ ~-1 ~ front_text.messages[0] set value [{text:"At [",color:"gray",italic:false},{nbt:"temp.visible_waystone.location.x",storage:"pk:common"},{text:", "},{nbt:"temp.visible_waystone.location.y",storage:"pk:common"},{text:", "},{nbt:"temp.visible_waystone.location.z",storage:"pk:common"},{text:"] in "},{nbt:"temp.visible_waystone.location.dimension",storage:"pk:common"}]
execute if score $hide_coordinates pk.temp matches 0 run data modify storage pk:common temp.gui.item.components."minecraft:lore" append from block ~ ~-1 ~ front_text.messages[0]

# Set visibility in lore
execute if data storage pk:common temp.visible_waystone{visibility:"private"} run data modify storage pk:common temp.gui.item.components."minecraft:lore" append value {text:"Private Waystone",color:"red",italic:false} 
execute if data storage pk:common temp.visible_waystone{visibility:"discover"} run data modify storage pk:common temp.gui.item.components."minecraft:lore" append value {text:"Discovered Waystone",color:"yellow",italic:false} 
execute if data storage pk:common temp.visible_waystone{visibility:"public"} run data modify storage pk:common temp.gui.item.components."minecraft:lore" append value {text:"Public Waystone",color:"green",italic:false} 

# Set required level if the "consumption_level" setting is enabled
execute if score $pk.waystones.settings.xp_consumption.value pk.value matches 1.. run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/xp_consumption/try

# Set owner in lore
execute if data storage pk:common temp.visible_waystone.owner run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/owner
execute unless data storage pk:common temp.visible_waystone.owner run data modify storage pk:common temp.gui.item.components."minecraft:lore" append value {text:"Unclaimed",color:"gray",italic:false}

# Set id in lore
data modify block ~ ~-1 ~ front_text.messages[0] set value [{text:"id: ",color:"gray",italic:false},{nbt:"temp.visible_waystone.id",storage:"pk:common"}]
data modify storage pk:common temp.gui.item.components."minecraft:lore" append from block ~ ~-1 ~ front_text.messages[0]

# Append to GUI items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item