#> pk_waystones:_main/uninstall/feature/6
#
# Define context of location from the current feature location
#
# @input args
#   dimension: 
#       Dimension of the current feature
#   x, y, z: int
#       Coordinates of the current feature

$execute in $(dimension) positioned $(x).0 $(y).0 $(z).0 run function pk_waystones:_main/uninstall/feature/4