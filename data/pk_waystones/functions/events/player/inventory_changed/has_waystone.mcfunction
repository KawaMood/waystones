#> pk_waystones:events/player/inventory_changed/has_waystone

# Update waystones items from lower versions
execute if items entity @s container.* player_head[custom_data~{pk_data:{id:"waystone",from:"waystones"}},!custom_data~{pk_data:{version:11b}}] run function pk_waystones:items/waystone/update/run {version:11b}

# Revoke advancement at the end so the function isn't indefinitively triggered by the inventory change above
advancement revoke @s only pk_waystones:events/inventory_changed/has_waystone