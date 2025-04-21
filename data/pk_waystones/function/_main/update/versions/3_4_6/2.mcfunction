execute store result storage pk:common t.args.i int 1 run scoreboard players get $i pk.value
data modify storage pk:common t.args.name set from storage pk:common t.d.waystones[0].name
data modify storage pk:common t.char_0_1 set string storage pk:common t.args.name 0 1
data modify storage pk:common t.chars_0_2 set string storage pk:common t.args.name 0 2

scoreboard players set $t pk.value 0
execute if data storage pk:common t{char_0_1:'"'} run scoreboard players set $t pk.value 1
execute if data storage pk:common t{chars_0_2:'{"'} run scoreboard players set $t pk.value 1
execute if score $t pk.value matches 1 run function pk_waystones:_main/update/versions/3_4_6/3 with storage pk:common t.args

data remove storage pk:common t.d.waystones[0]
scoreboard players add $i pk.value 1
execute if score $i pk.value < $l pk.value run function pk_waystones:_main/update/versions/3_4_6/2