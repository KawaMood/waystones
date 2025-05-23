#> pk_waystones:settings/list_public_waystones_first/true

# Cancel process if setting is already set on the attempted value
execute if score $pk.waystones.settings.list_public_waystones_first pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"red"},{text:"List Public Waystones First",color:"yellow"},{text:"\" is already set to ",color:"red"},{text:"true",color:"yellow"}]
execute unless score $pk.waystones.settings.list_public_waystones_first pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"List Public Waystones First",color:"yellow"},{text:"\" has been set to ",color:"gray"},{text:"true",color:"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.list_public_waystones_first pk.value 1