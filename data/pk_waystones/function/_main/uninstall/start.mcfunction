#> pk_waystones:_main/uninstall/start

# @return check if an uninstalling process is already running
execute if score $uninstall pk.value matches 1 run return run tellraw @s {text: "An uninstalling process is already running",color:"red"}

# Set uninstalling process score
scoreboard players set $uninstall pk.value 1

# Mark player
tag @s add pk.uninstall

# Remove waystones
function pk_waystones:_main/uninstall/feature/start {feature_storage_path:"pk:waystones database.waystones",callback:"function pk_waystones:_main/uninstall/callback/after_removing_waystones",feature_id:"waystone"}