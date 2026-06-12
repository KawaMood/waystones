#> pk_waystones:blocks/waystone/use/data/visible_waystones/filters/private

# Owner
data modify storage pk:common temp.filter.output set value []
data modify storage pk:common temp.args set value {p1:'data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{visibility:"private",owner:',p2:"}]"}
data modify storage pk:common temp.args.v1 set from storage pk:common temp.waystone_user.uuid
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args
data modify storage pk:common temp.array_1 append from storage pk:common temp.filter.output[]

# Shared with
data modify storage pk:common temp.filter.output set value []
data modify storage pk:common temp.args merge value {p1:'data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{visibility:"private",shared_with:[{uuid:',p2:"}]}]"}
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args
data modify storage pk:common temp.array_1 append from storage pk:common temp.filter.output[]