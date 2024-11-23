#> pk_waystones:settings/lootable_delay/get

scoreboard players set $lootable_delay pk.temp 0
scoreboard players operation $lootable_delay pk.temp = $pk.waystones.settings.lootable_delay pk.value

tellraw @s [{"text":"The minimal age waystones must have to loot when broken is currently set to ","color":"gray"},{"score":{"name":"$lootable_delay","objective":"pk.temp"},"color":"yellow"},{"text":" tick(s)","color":"gray"}]