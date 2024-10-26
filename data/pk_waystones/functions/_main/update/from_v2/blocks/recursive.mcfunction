#> pk_waystones:_main/update/from_v2/blocks/recursive

# Migration of the entry
data modify storage pk:common update.old_entry set from storage pk:common update.blocks[-1]
$function pk_waystones:_main/update/from_v2/blocks/id/$(block_id)

# Recursive call
data remove storage pk:common update.blocks[-1]
scoreboard players remove $pk.update.blocks.length pk.value 1
execute if score $pk.update.blocks.length pk.value matches 1.. run function pk_waystones:_main/update/from_v2/blocks/recursive with storage pk:common update.params