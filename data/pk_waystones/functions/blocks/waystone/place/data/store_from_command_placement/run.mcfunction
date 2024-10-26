#> pk_waystones:blocks/waystone/place/data/store_from_command_placement/run
# @require 
#   pk:common temp.command.params.waystone 
#       contains all data of the waystone to place
#       @within function pk_waystones:cmd/blocks/waystone/place

# Data with default values: visibility, discovered_by, shared_with, protected, render_item
data modify storage pk:common temp.waystone set value {variant:"andesite",visibility:"discover",discovered_by:[],shared_with:[],protected:0b,render_item:{id:"minecraft:grass_block"},name:'{"text":"Waystone"}',location:{dimension:"minecraft:overworld"}} 
# Id
data modify storage pk:common temp.waystone.id set from storage pk:common temp.command.params.waystone.id
execute unless data storage pk:common temp.waystone.id store result storage pk:common temp.waystone.id int 1 run scoreboard players get $temp pk.custom_block.component.id
# Variant
data modify storage pk:common temp.waystone.variant set from storage pk:common temp.command.params.waystone.variant
# Name
data modify storage pk:common temp.waystone.name set from storage pk:common temp.command.params.waystone.name
# Protection
data modify storage pk:common temp.waystone.protected set from storage pk:common temp.command.params.waystone.protected
# Visibility
data modify storage pk:common temp.waystone.visibility set from storage pk:common temp.command.params.waystone.visibility
# Owner
data modify storage pk:common temp.waystone.owner set from storage pk:common temp.command.params.waystone.owner
# Location
data modify storage pk:common temp.waystone.location.dimension set from storage pk:common temp.command.params.waystone.location.dimension
execute summon marker run function pk_waystones:blocks/waystone/place/data/store_from_command_placement/set_location
# Discovered by
execute if data storage pk:common temp.command.params.waystone.discovered_by[{}] run data modify storage pk:common temp.waystone.discovered_by set from storage pk:common temp.command.params.waystone.discovered_by
# Shared with
execute if data storage pk:common temp.command.params.waystone.shared_with[{}] run data modify storage pk:common temp.waystone.shared_with set from storage pk:common temp.command.params.waystone.shared_with
# Render item
execute if data storage pk:common temp.command.params.waystone.location.render_item run data modify storage pk:common temp.waystone.location.render_item set from storage pk:common temp.command.params.waystone.location.render_item
execute summon item_display run function pk_waystones:blocks/waystone/place/data/render_item
# Created at gametime
execute if data storage pk:common temp.command.params.waystone.created_at_gametime run data modify storage pk:common temp.waystone.created_at_gametime set from storage pk:common temp.command.params.waystone.created_at_gametime
execute unless data storage pk:common temp.waystone.created_at_gametime store result storage pk:common temp.waystone.created_at_gametime int 1 run time query gametime

# Add to database
data modify storage pk:waystones database.waystones append from storage pk:common temp.waystone