#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/discover

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {id:"minecraft:leather_helmet",count:1,components:{"minecraft:custom_name":[{text:"Visibility: ",italic:false},{text:"Discover (public)",color:"yellow",italic:false}],"minecraft:dyed_color":16701501,"minecraft:attribute_modifiers":[],"minecraft:trim":{material:"minecraft:emerald",pattern:"minecraft:sentry"},"minecraft:bundle_contents":[{id:"minecraft:stick",count:64}],"minecraft:tooltip_display":{hidden_components:["minecraft:dyed_color","minecraft:attribute_modifiers","minecraft:trim"]},"minecraft:custom_data":{pk_data:{gui:1b,from:"waystones",trigger:"visibility/change",trigger_params:{allowed:1b}}},"minecraft:custom_model_data":{strings:["pk_waystones:gui_visibility_discover"]}},Slot:21b}

# Define button lore and trigger
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/next/_run with storage pk:common temp.used_waystone

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item