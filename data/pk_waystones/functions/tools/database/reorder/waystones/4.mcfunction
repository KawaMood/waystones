#> pk_waystones:tools/database/reorder/waystones/4

# Append potential remaining waystones
data modify storage pk:common temp.new_waystones append from storage pk:common temp.remaining_waystones[]
data modify storage pk:waystones database.waystones set from storage pk:common temp.new_waystones

# Logs
tellraw @s [{"text": "Reordered all waystones successfully","color": "yellow"}]