#> pk_waystones:_main/uninstall/references/specific

# Clear scores
scoreboard objectives remove pk.waystones.gametime

# Clear storage
data remove storage pk:waystones database
data remove storage pk:waystones settings
data remove storage pk:common installed_datapacks[{id:"waystones"}]