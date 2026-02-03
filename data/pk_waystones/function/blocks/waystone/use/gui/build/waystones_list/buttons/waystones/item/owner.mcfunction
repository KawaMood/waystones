#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/owner
# Set owner in lore
$data modify block ~ ~-1 ~ front_text.messages[0] set value [{text:"Owner: ",color:"gray",italic:false},{type:"object",object:"player",player:{id:$(owner)},color:"white"},{text:" "},{nbt:"database.players[{uuid:$(owner)}].name",storage:"pk:waystones"}]
data modify storage pk:common temp.gui.item.components."minecraft:lore" append from block ~ ~-1 ~ front_text.messages[0]