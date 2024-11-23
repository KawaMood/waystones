#> pk_waystones:settings/lootable_delay/set
# Used for compatiblity with plugins that allow areas protection
# @input
#   delay: minimal delay (in ticks) the waystone should have existed to be able to loot its item
# Example: 
#   function pk_waystones:settings/lootable_delay/set {delay:2}

$scoreboard players set $pk.waystones.settings.lootable_delay pk.value $(delay)

tellraw @s [{"text":"The minimal age waystones must have to loot when broken is now set to ","color":"gray"},{"score":{"name":"$pk.waystones.settings.lootable_delay","objective":"pk.value"},"color":"yellow"},{"text":" tick(s)","color":"gray"}]