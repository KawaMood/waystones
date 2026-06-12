execute as @a[tag=pk.waystones.opener_delay] at @s run function pk_waystones:events/player/item_used_on_block/any_on_waystone_container/trigger
tag @a[tag=pk.waystones.opener_delay] remove pk.waystones.opener_delay
