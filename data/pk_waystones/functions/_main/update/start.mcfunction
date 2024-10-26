#> pk_waystones:_main/update/start
# Update the current data pack if needed

# V.3.1.0
execute unless score $pk.waystones.version pk.value matches 1.. run function pk_waystones:_main/update/versions/3_1_0
# V.3.3.0
execute unless score $pk.waystones.version pk.value matches 9.. run function pk_waystones:_main/update/versions/3_3_0
# V.3.3.2
execute unless score $pk.waystones.version pk.value matches 30302.. run function pk_waystones:_main/update/versions/3_3_2/start
# V.3.4.0
execute unless score $pk.waystones.version pk.value matches 30400.. run function pk_waystones:_main/update/versions/3_4_0

# Set the data pack current version score
scoreboard players set $pk.waystones.version pk.value 30400
data modify storage pk:common installed_datapacks[{id:"waystones"}].version set value "3.4.0"