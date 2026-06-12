# Check permissions of the current user to define the trigger
# Score $next_visibility: Public: 1 | Discover and public: 2 | Private: 3 | Discover and private: 4
# $next_visibility pk.temp should be set to 0 if no change permission is allowed

# List allowed visibility settings for the current user
data modify storage pk:common temp.allowed_visibility set value [{visibility:"public"},{visibility:"discover"},{visibility:"private"},{visibility:"discover_private"}]

# Player is manager (always success, don't change anything)
execute if entity @s[tag=pk.waystones.manager] run return 1

# Player isn't the owner (always fail, unless the previous manager check successed)
execute unless score $player_is_owner pk.temp matches 1 run return run data modify storage pk:common temp.allowed_visibility set value []

# Remove allowed visibility settings depending on permissions settings
#   Public
execute if score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 run data remove storage pk:common temp.allowed_visibility[{visibility:"public"}]
#   Discover (public)
execute if score $pk.waystones.permissions.change.visiblity.discover pk.value matches 0 run data remove storage pk:common temp.allowed_visibility[{visibility:"discover"}]
#   Private
execute if score $pk.waystones.permissions.change.visiblity.private pk.value matches 0 run data remove storage pk:common temp.allowed_visibility[{visibility:"private"}]
#   Discover (private)
execute if score $pk.waystones.permissions.change.visiblity.discover_private pk.value matches 0 run data remove storage pk:common temp.allowed_visibility[{visibility:"discover_private"}]