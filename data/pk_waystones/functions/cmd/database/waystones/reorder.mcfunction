#> pk_waystones:cmd/database/waystones/reorder
# @input
#   ids (list of integers): the waystones ids in the new order to define
# Example:
#function pk_waystones:cmd/database/waystones/reorder {ids:[4,2,1,3]}

data remove storage pk:common params
$data modify storage pk:common params.ids set value $(ids)

execute unless data storage pk:common params.ids[0] run tellraw @s {"text":"\"ids\" must be a list of integers","color":"red"}
execute unless data storage pk:common params.ids[0] run return 0

execute if data storage pk:common params.ids[0] run function pk_waystones:tools/database/reorder/waystones/1