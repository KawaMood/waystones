#> pk_waystones:items/waystone/give
# @args
#   variant (string): variant of the waystone

$function pk_waystones:items/waystone/attributes/$(variant)
data modify storage pk:common temp.args set value {count:1}
execute if score $count pk.temp matches 1.. store result storage pk:common temp.args.count int 1 run scoreboard players get $count pk.temp
data modify storage pk:common temp.args merge from storage pk:common temp.attributes
function pk_waystones:packages/dynamic_item/give with storage pk:common temp.args