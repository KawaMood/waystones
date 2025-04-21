# Edit waystones names stored in database from stringified text components (1.21.4 or less) to compound (since 1.21.5)

scoreboard players set $l pk.value 0
execute store result score $l pk.value run data get storage pk:waystones database.waystones
execute if score $l pk.value matches 0 run return fail

scoreboard players set $i pk.value 0
data remove storage pk:common t.d
data modify storage pk:common t.d.waystones set from storage pk:waystones database.waystones
function pk_waystones:_main/update/versions/3_4_6/2 with storage pk:common t.args