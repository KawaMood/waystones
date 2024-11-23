#> pk_waystones:tools/database/reorder/waystones/1

# Prepare data
data modify storage pk:common temp.ids set from storage pk:common params.ids
data modify storage pk:common temp.new_waystones set value []
data modify storage pk:common temp.remaining_waystones set from storage pk:waystones database.waystones

# Start the recursive process
function pk_waystones:tools/database/reorder/waystones/2