#> pk_waystones:items/waystone/update/change/slot/container
# @context a temporary armor stand, at the current player

$item replace entity @s weapon.mainhand from entity @a[tag=pk.current.player,limit=1,distance=..0.1] container.$(slot)
function pk_waystones:items/waystone/update/change/run
$item replace entity @a[tag=pk.current.player,limit=1,distance=..0.1] container.$(slot) from entity @s weapon.mainhand
kill @s