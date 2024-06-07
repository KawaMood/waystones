#> pk_waystones:blocks/waystone/place/skins/sand/start
# Only set entities that depends on the type of the Waystone

# Set container block decorative entities depending on the legacy_texture property value
# - Default (custom)
execute unless score $pk.waystones.settings.legacy_textures pk.value matches 1.. run function pk_waystones:blocks/waystone/place/skins/sand/middle/default
# - Legacy (lodestone)
execute if score $pk.waystones.settings.legacy_textures pk.value matches 1.. summon item_display run function pk_waystones:blocks/waystone/place/skins/sand/middle/legacy

# Base entities
execute summon item_display run function pk_waystones:blocks/waystone/place/skins/sand/base/1
execute summon item_display run function pk_waystones:blocks/waystone/place/skins/sand/base/2
execute summon item_display run function pk_waystones:blocks/waystone/place/skins/sand/base/3

# Top entities
execute positioned ~ ~2 ~ summon item_display run function pk_waystones:blocks/waystone/place/skins/sand/top/1