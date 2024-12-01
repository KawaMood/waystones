#> pk_waystones:items/waystone/update/change/slot/container
#
# @args
#   variant (string): variant of the waystone
#
# @context a temporary armor stand, at the current player

$item replace entity @s weapon.mainhand from entity @a[tag=pk.current.player,limit=1,distance=..0.1] container.$(slot)
data modify storage pk:common temp.item set from entity @s HandItems[0]
function pk_waystones:items/waystone/update/change/run with storage pk:common temp.item.components."minecraft:custom_data".pk_data
$item replace entity @a[tag=pk.current.player,limit=1,distance=..0.1] container.$(slot) from entity @s weapon.mainhand
kill @s