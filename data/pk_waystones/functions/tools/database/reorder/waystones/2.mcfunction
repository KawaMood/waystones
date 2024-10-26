#> pk_waystones:tools/database/reorder/waystones/2

# Store the current id and append it to the new waystones list
data modify storage pk:common temp.args.id set from storage pk:common temp.ids[0]
function pk_waystones:tools/database/reorder/waystones/3 with storage pk:common temp.args

# Recursive call
data remove storage pk:common temp.ids[0]
execute unless data storage pk:common temp.ids[0] run function pk_waystones:tools/database/reorder/waystones/4
execute if data storage pk:common temp.ids[0] run function pk_waystones:tools/database/reorder/waystones/2