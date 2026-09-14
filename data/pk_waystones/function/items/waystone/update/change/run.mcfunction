# args
#   variant (string): waystone variant
# context a temporary armor stand holding the item to change, at the current player

$function pk_waystones:items/waystone/attributes/$(variant)
data modify storage pk:common temp.attributes.count set from storage pk:common temp.item.count
item modify entity @s weapon.mainhand {type:"set_item",item:"glow_item_frame"}
data modify entity @s equipment.mainhand set from storage pk:common temp.attributes