# Prepare container custom name
data modify storage pk:common temp.custom_name set value "Waystone"
data modify storage pk:common temp.custom_name set from storage pk:common temp.waystone.name

# Test current text component format
scoreboard players set $format pk.temp 1
execute if data storage pk:common temp.waystone.name.text run scoreboard players set $format pk.temp 2
execute if data storage pk:common temp.waystone.name.extra run scoreboard players set $format pk.temp 3
execute if data storage pk:common temp.waystone.name.extra[0] run scoreboard players set $format pk.temp 4
execute if data storage pk:common temp.waystone.name[0] run scoreboard players set $format pk.temp 5

# 1 - 2 : pure string or compound without extra
$execute if score $format pk.temp matches 1..2 run data modify storage pk:common temp.custom_name set value [{text:" ($(id))",color:"gray",italic:false,bold:false,obfuscated:false,strikethrough:false,underlined:false,font:"minecraft:default"}]
execute if score $format pk.temp matches 1..2 run data modify storage pk:common temp.custom_name prepend from storage pk:common temp.waystone.name

# 3 : If object with compound extra
$execute if score $format pk.temp matches 3 run data modify storage pk:common temp.custom_name.extra set value [{text:" ($(id))",color:"gray",italic:false,bold:false,obfuscated:false,strikethrough:false,underlined:false,font:"minecraft:default"}]
execute if score $format pk.temp matches 3 run data modify storage pk:common temp.custom_name.extra prepend from storage pk:common temp.waystone.name.extra

# 3 : If object with array extra
$execute if score $format pk.temp matches 4 run data modify storage pk:common temp.custom_name.extra append value {text:" ($(id))",color:"gray",italic:false,bold:false,obfuscated:false,strikethrough:false,underlined:false,font:"minecraft:default"}

# 4 : If list
$execute if score $format pk.temp matches 5 run data modify storage pk:common temp.custom_name append value {text:" ($(id))",color:"gray",italic:false,bold:false,obfuscated:false,strikethrough:false,underlined:false,font:"minecraft:default"}