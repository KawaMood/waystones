#> pk_waystones:blocks/waystone/remove/try/cancel

# Disclaimer
title @p[scores={pk.waystones.mined.barrel=1..},distance=..20] actionbar {text: "This waystone is protected", color: "red"}

# Remove the dropped container and GUI items
execute align xyz run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{pk_data:{gui:1b}}}}},dx=0]
execute align xyz run kill @e[type=item,nbt={Item:{id:"minecraft:barrel",count:1},Age:0s},dx=0,limit=1]

# Place potentially removed block(s) back
setblock ~ ~-1 ~ barrier
function pk_waystones:blocks/waystone/place/available_container