#> pk_waystones:settings/default_visibility/get

execute unless score $pk.waystones.settings.default_visibility pk.value matches 1.. run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Default Visibility",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"Discover",color:"yellow"}]
execute if score $pk.waystones.settings.default_visibility pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Default Visibility",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"Private",color:"yellow"}]
execute if score $pk.waystones.settings.default_visibility pk.value matches 2 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Default Visibility",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"Public",color:"yellow"}]