#> pk_waystones:blocks/waystone/remove/loot

$function pk_waystones:items/waystone/attributes/$(variant)
data modify storage pk:common temp.packages.dynamic_item set value {apply_random_motion:1b}
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item set from storage pk:common temp.attributes
execute unless data storage pk:common temp.waystone{name:{text:"Waystone"}} run data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.components."minecraft:custom_name" set from storage pk:common temp.waystone.name
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.count set value 1
function pk_waystones:packages/dynamic_item/drop/run