#> pk_waystones:_main/update/from_v2/blocks/id/waystone
# @input
#   storage pk:common update.old_entry: The current entry from the blocks list to update

# Prepare new entry
data modify storage pk:common update.new_entry set value {discovered_by:[],shared_with:[],visibility:"public"} 

# Set data from old to new entries
#   Id
data modify storage pk:common update.new_entry.id set from storage pk:common update.old_entry.id
#   Owner
data modify storage pk:common update.new_entry.owner set from storage pk:common update.old_entry.Owner.UUID
#   Variant
data modify storage pk:common update.new_entry.variant set from storage pk:common update.old_entry.Type
execute if data storage pk:common update.old_entry{Type:"regular"} run data modify storage pk:common update.new_entry.variant set value "andesite"
#   Name
data modify storage pk:common update.new_entry.name set from storage pk:common update.old_entry.Name
#   Location
data modify storage pk:common update.new_entry.location.x set from storage pk:common update.old_entry.x
data modify storage pk:common update.new_entry.location.y set from storage pk:common update.old_entry.y
data modify storage pk:common update.new_entry.location.z set from storage pk:common update.old_entry.z
data modify storage pk:common update.new_entry.location.dimension set from storage pk:common update.old_entry.Dimension
#   Protection
data modify storage pk:common update.new_entry.protected set from storage pk:common update.old_entry.Waypoint.tag.pkData.Protected
#   Visibility
execute if data storage pk:common update.old_entry.Waypoint.tag.pkData{Private:1b} run data modify storage pk:common update.new_entry.visibility set value "private"
#   Render item
#       will be redefined during the creation, from the block the waystone should be replaced on
#       @within function pk_waystones:blocks/waystone/place/replace/run
#   Created at gametime
execute store result storage pk:common update.new_entry.created_at_gametime int 1 run time query gametime

# Append owner to the database if it doesn't exist yet
data modify storage pk:common update.new_player set value {name:""}
data modify storage pk:common update.new_player.uuid set from storage pk:common update.new_entry.owner
data modify storage pk:common temp.args set value {p1:"execute unless data storage pk:waystones database.players[{uuid:",p2:"}] run data modify storage pk:waystones database.players prepend from storage pk:common update.new_player"}
data modify storage pk:common temp.args.v1 set from storage pk:common update.new_player.uuid
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args

# Append new entry to the database if the id doesn't exist yet
data modify storage pk:common temp.args set value {p1:"execute unless data storage pk:waystones database.waystones[{id:",p2:"}] run data modify storage pk:waystones database.waystones prepend from storage pk:common update.new_entry"}
data modify storage pk:common temp.args.v1 set from storage pk:common update.new_entry.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common temp.args