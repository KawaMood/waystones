#> pk_waystones:blocks/waystone/place/data/render_item

# Try to get the item form of the block bellow the Waystone, if it fails, use a grass block instead
loot replace entity @s container.0 mine ~ ~-1 ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1s}]}
execute unless data entity @s item.id run item replace entity @s container.0 with grass_block
data remove storage pk:common temp.waystone.render_item
data modify storage pk:common temp.waystone.render_item.id set from entity @s item.id
data modify storage pk:common temp.waystone.render_item.tag set from entity @s item.tag

# Remove entity
kill @s