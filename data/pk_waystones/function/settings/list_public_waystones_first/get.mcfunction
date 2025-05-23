#> pk_waystones:settings/legacy_textures/get

# If false
execute unless score $pk.waystones.settings.list_public_waystones_first pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"List Public Waystones First",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"false",color:"yellow"}]
# If true
execute if score $pk.waystones.settings.list_public_waystones_first pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"List Public Waystones First",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"true",color:"yellow"}]