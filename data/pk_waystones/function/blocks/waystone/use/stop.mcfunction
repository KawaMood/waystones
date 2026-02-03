#> pk_waystones:blocks/waystone/use/stop
# @context as the current controller at @s

# Prepare score
scoreboard players operation $temp pk.custom_block.interaction.id = @s pk.custom_block.interaction.id
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players set $use.stop pk.temp 1

# Public hook: waystone_close_before
function #pk_waystones:public/waystone_close_before

# Update controller
function pk_waystones:blocks/waystone/use/components/controller/update_on_stop

# Remove the lock interaction
execute align xyz run kill @e[type=interaction,tag=pk.custom_block.lock.in_use,dx=0,predicate=pk_waystones:scores/custom_block/component_id/match_temp,limit=1]

# Refresh container
function pk_waystones:blocks/waystone/place/available_container

# Remove potential kept gui items from the player inventory (using a stress glitch)
clear @a[predicate=pk_waystones:scores/custom_block/interaction_id/match_temp,limit=1] *[minecraft:custom_data~{pk_data:{gui:1b,from:"waystones"}}]
execute as @a[tag=pk.current.player,limit=1] at @s anchored eyes positioned ^ ^ ^ run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{pk_data:{gui:1b,from:"waystones"}}}}},distance=..2]

# Animations
stopsound @a[distance=..30] block block.barrel.close

# Public hook: waystone_close_after
function #pk_waystones:public/waystone_close_after

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.current.player,limit=1]",color: "gray"},{text: " closed waystone at ["},{nbt:"x","block":"~ ~ ~"},{text: ","},{nbt:"y","block":"~ ~ ~"},{text: ","},{nbt:"z","block":"~ ~ ~"},{text: "]"}]