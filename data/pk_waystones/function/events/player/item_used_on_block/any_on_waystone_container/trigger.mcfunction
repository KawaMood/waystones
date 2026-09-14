# Increment and set interaction.id score
scoreboard players add $next pk.custom_block.interaction.id 1
scoreboard players operation @s pk.custom_block.interaction.id = $next pk.custom_block.interaction.id

# Mark the current player
tag @s add pk.current.player

# Search the interacted block
execute at @e[type=marker,tag=pk.waystones.waystone.controller,distance=..20] align xyz if block ~ ~ ~ minecraft:barrel[open=true] if items block ~ ~ ~ container.* *[custom_data~{pk_data:{custom_block:1b,from:"waystones",gui:1b,in_use:0b,id:"waystone"}}] run function pk_waystones:blocks/waystone/use/start

# Unmark the current player
tag @s remove pk.current.player