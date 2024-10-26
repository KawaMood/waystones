#> pk_waystones:_main/update/versions/3_3_2/start

data modify storage pk:common temp.cleaned_waystones set value []
data modify storage pk:common temp.destructive.waystones set from storage pk:waystones database.waystones
execute if data storage pk:common temp.destructive.waystones[-1] run function pk_waystones:_main/update/versions/3_3_2/clean_recursive
data modify storage pk:waystones database.waystones set from storage pk:common temp.cleaned_waystones