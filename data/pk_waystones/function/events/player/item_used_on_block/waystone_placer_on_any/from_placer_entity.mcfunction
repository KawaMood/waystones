# Store block placer data
data modify storage pk:common temp.block_placer_entity set from entity @s
kill @s

# Try to place the waystone as the player
execute as @p[tag=pk.current.player] run function pk_waystones:blocks/waystone/place/try/start