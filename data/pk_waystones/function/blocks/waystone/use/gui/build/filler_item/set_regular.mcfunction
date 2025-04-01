#> pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular
# @input
#   $slot (int): slot where the filler should be set
#   $custom_model_data (entry): custom model data value

$data modify storage pk:common temp.gui.items append value {id:"minecraft:black_stained_glass_pane",count:1,components:{"minecraft:tooltip_display":{hide_tooltip:true},"minecraft:bundle_contents":[{id:"minecraft:stick",count:64}],"minecraft:custom_data":{pk_data:{gui:1b,from:"waystones",restore_gui_on_click:1b}},"minecraft:custom_model_data":$(custom_model_data)},Slot:$(slot)b}