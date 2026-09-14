#> pk_waystones:packages/get_distance/run
# @requires
#   storage pk:common temp.args.mode (string): Can be either "manhattan" (grid plan) or "euclidean" (straight-line)
#   storage pk:common temp.args.pos1 (array of numbers): Coordinates set of the first point
#   storage pk:common temp.args.pos2 (array of numbers): Coordinates set of the second point
# @writes
#   score $distance pk.temp

# Clear data
data remove storage pk:common temp.compute

# Calculate differences
data modify storage pk:common temp.compute.dx set compute default float {type:"minecraft:abs",input:{type:"minecraft:sub",left:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos1[0]"},right:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos2[0]"}}}
data modify storage pk:common temp.compute.dy set compute default float {type:"minecraft:abs",input:{type:"minecraft:sub",left:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos1[1]"},right:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos2[1]"}}}
data modify storage pk:common temp.compute.dz set compute default float {type:"minecraft:abs",input:{type:"minecraft:sub",left:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos1[2]"},right:{type:"minecraft:storage",storage:"pk:common",path:"temp.args.pos2[2]"}}}

# If Manhattan, get distance using this method
execute if data storage pk:common temp.args{mode:"manhattan"} run return run execute store result score $distance pk.temp run compute default float {type:"minecraft:add",inputs:[{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dx"},{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dy"},{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dz"}]}

# Otherwise, get euclidean distance
#   Compute temp.compute.sum_distances = (dx² + dy² + dz²)
data modify storage pk:common temp.compute.sum_distances set compute default float {type:"minecraft:add",inputs:[{type:"minecraft:pow",base:{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dx"},exponent:2},{type:"minecraft:pow",base:{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dy"},exponent:2},{type:"minecraft:pow",base:{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.dz"},exponent:2}]}
#   Compute sqrt(temp.compute.sum_distances)
execute store result score $distance pk.temp run compute default float {type:"minecraft:sqrt",input:{type:"minecraft:storage",storage:"pk:common",path:"temp.compute.sum_distances"}}