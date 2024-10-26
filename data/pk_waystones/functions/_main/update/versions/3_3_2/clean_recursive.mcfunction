#> pk_waystones:_main/update/versions/3_3_2/clean_recursive

# Check if the current entry contains an id property
execute if data storage pk:common temp.destructive.waystones[-1].id run data modify storage pk:common temp.cleaned_waystones prepend from storage pk:common temp.destructive.waystones[-1]

# Recursive call
data remove storage pk:common temp.destructive.waystones[-1]
execute if data storage pk:common temp.destructive.waystones[-1] run function pk_waystones:_main/update/versions/3_3_2/clean_recursive