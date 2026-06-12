# Check permissions of the current user to define the next visibility trigger
# Score $next_visibility: Public: 1 | Discover and public: 2 | Private: 3 | Discover and private: 4
# $next_visibility pk.temp should be set to 0 if no change permission is allowed
#
# args:
#   visibility (string): Current visibility of used waystone

# Get permissions of the current user
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/next/allowed_visibility

# Unchangeable (default)
scoreboard players set $next_visibility pk.temp 0

# Define the next visibility depending on listed permission and current visibility setting
$function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/next/from/$(visibility)

# Set the relative lore and trigger depending on the retained next visibility
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/set_lore_and_trigger