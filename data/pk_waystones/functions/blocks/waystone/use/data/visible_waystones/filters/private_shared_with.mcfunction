#> pk_waystones:blocks/waystone/use/data/visible_waystones/filters/private_shared_with

data modify storage pk:common temp.filter.output set value []
data modify storage pk:common temp.args set value {p1:'data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{visibility:"private",shared_with:[{uuid:',p2:"}]}]"}
data modify storage pk:common temp.args.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args