#> pk_waystones:blocks/waystone/place/replace/render_item

execute summon item_display run function pk_waystones:blocks/waystone/place/data/render_item
data modify storage pk:common temp.args set value {p1:"data modify storage pk:waystones database.waystones[{id:",p2:"}].render_item set from storage pk:common temp.waystone.render_item"}
data modify storage pk:common temp.args.v1 set from storage pk:common temp.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args