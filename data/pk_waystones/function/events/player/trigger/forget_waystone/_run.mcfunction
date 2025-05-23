# Forget a discovered/private waystone
#
# /trigger pk.waystones.trigger.forget_waystone set <id>
#   Where <id> is the id of a waystone
#
# Forgetting a waystone will remove the UUID of the player from both the discovered_by and shared_with lists


data modify storage pk:common temp.args.uuid set from entity @s UUID
execute store result storage pk:common temp.args.id int 1 run scoreboard players get @s pk.waystones.trigger.forget_waystone
function pk_waystones:events/player/trigger/forget_waystone/with_args with storage pk:common temp.args

scoreboard players set @s pk.waystones.trigger.forget_waystone 0