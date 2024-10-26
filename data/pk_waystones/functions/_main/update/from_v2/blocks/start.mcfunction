#> pk_waystones:_main/update/from_v2/blocks/start
# @input
#   $source (string): storage path to the list of blocks to recreate
#   $block_id (string): id of the block to udpate

# Prepare data
$data modify storage pk:common update.blocks set from storage $(source)
$data modify storage pk:common update.params.block_id set value "$(block_id)"
scoreboard players set $pk.update.blocks.length pk.value 0
execute store result score $pk.update.blocks.length pk.value run data get storage pk:common update.blocks

# Stop if no there is block to update
execute if score $pk.update.blocks.length pk.value matches 0 run return fail
# @continue Start update
execute if score $pk.update.blocks.length pk.value matches 1.. run function pk_waystones:_main/update/from_v2/blocks/recursive with storage pk:common update.params