#> pk_waystones:packages/dynamic_item/give
# @input
#   $id (string): the id of the item
#   $components (empty string or object): the components of the item (syntax SNBT)
#   $count (int): the count of item

$loot give @s loot {pools:[{rolls:1,entries:[{type:"item",name:"$(id)",modifier:[{type:"set_components",components:$(components)},{type:"set_count",count:$(count)}]}]}]}