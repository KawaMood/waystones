#> pk_waystones:_main/update/versions/3_3_0
# Version 3.3.0 (#11)

# Change variants
execute if data storage pk:waystones database.waystones[{variant:"regular"}] run data modify storage pk:waystones database.waystones[{variant:"regular"}].variant set value "andesite"
execute if data storage pk:waystones database.waystones[{variant:"mossy_stone"}] run data modify storage pk:waystones database.waystones[{variant:"mossy_stone"}].variant set value "mossy"

# Update the default name
execute if data storage pk:waystones database.waystones[{name:'{"text":"Waystone","italic": false,"color": "yellow"}'}] run data modify storage pk:waystones database.waystones[{name:'{"text":"Waystone","italic": false,"color": "yellow"}'}].name set value '{"text":"Waystone"}'