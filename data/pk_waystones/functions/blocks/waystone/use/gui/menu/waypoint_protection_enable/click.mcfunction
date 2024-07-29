#> pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_enable/click

# Set scores
scoreboard players set $action.stop pk.temp 0

# Check if the player is the owner
execute store result score $owner.id pk.temp run data get storage pk.common:data Temp.Waystone.Owner.id
execute as @a[tag=pk.temp.current,limit=1] unless entity @s[predicate=pk_waystones:gameplay/waystone/owner_or_manager] run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_enable/fail
execute if score $action.stop pk.temp matches 0 run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_enable/success

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"protected\" button"}]