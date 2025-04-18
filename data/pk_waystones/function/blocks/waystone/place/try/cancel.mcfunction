#> pk_waystones:blocks/waystone/place/try/cancel
# @input
#   $reason: reason

# Stop try
scoreboard players set $place.stop pk.temp 1

# Throw error
title @s clear
$title @s actionbar {text: "$(reason)", color: "red"}

# Give item back to the player
data modify storage pk:common temp.args.id set from storage pk:common temp.item.id
data modify storage pk:common temp.args.components set from storage pk:common temp.item.components
data modify storage pk:common temp.args.count set value 1
function pk_waystones:packages/dynamic_item/give with storage pk:common temp.args

# Set the current block as air
setblock ~ ~ ~ air