#> pk_waystones:blocks/waystone/use/gui/build/toolbar/run
# @context user at the waystone container location (aligned xyz)

# Set visibility button
execute if data storage pk:common temp.used_waystone{visibility:"discover"} run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/discover
execute if data storage pk:common temp.used_waystone{visibility:"private"} run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/private
execute if data storage pk:common temp.used_waystone{visibility:"public"} run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/public

# Set protection button
execute if data storage pk:common temp.used_waystone{protected:0b} run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/protected/0
execute if data storage pk:common temp.used_waystone{protected:1b} run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/protected/1

# Set shared_with button
execute unless data storage pk:common temp.used_waystone.shared_with[{}] run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/shared_with/placeholder
execute if data storage pk:common temp.used_waystone.shared_with[{}] run function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/shared_with/item

# Set fillers
function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular {slot:19,custom_model_data:{strings:["pk_waystones:gui_filler"]}}
function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular {slot:20,custom_model_data:{strings:["pk_waystones:gui_filler"]}}
function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular {slot:24,custom_model_data:{strings:["pk_waystones:gui_filler"]}}
function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_waystones_list_dependant/start {slot:25}