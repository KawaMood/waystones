# Retrieve the name of the player
# @context a player at @s
# @writes pk:common temp.packages.get_player_name.name

tag @s add pk.package.get_player_name.player
data remove storage pk:common temp.packages.get_player_name.name
summon text_display ~ ~ ~ {Tags:["pk.package.get_player_name.text_display"],text:{selector:"@p[tag=pk.package.get_player_name.player]"}}
data modify storage pk:common temp.packages.get_player_name.name set from entity @e[type=text_display,tag=pk.package.get_player_name.text_display,distance=..0.1,limit=1] text.insertion
kill @e[type=text_display,tag=pk.package.get_player_name.text_display,distance=..0.1,limit=1]
tag @s remove pk.package.get_player_name.player