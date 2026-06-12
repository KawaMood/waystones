#> pk_waystones:events/player/item_used_on_block/any_on_waystone_container/start
# @within advancement pk_waystones:events/item_used_on_block/any_on_waystone_container

advancement revoke @s only pk_waystones:events/item_used_on_block/any_on_waystone_container

# Open container delay
# Notably solve issues like Paper (> 26.1 build #17)
scoreboard players set $settings.open_container_delay pk.temp 0
execute store result score $settings.open_container_delay pk.temp run data get storage pk:waystones settings.open_container_delay
execute unless score $settings.open_container_delay pk.temp matches ..0 run return run function pk_waystones:events/player/item_used_on_block/any_on_waystone_container/open_container_delay/set_cooldown with storage pk:waystones settings

# Run instantly
function pk_waystones:events/player/item_used_on_block/any_on_waystone_container/trigger