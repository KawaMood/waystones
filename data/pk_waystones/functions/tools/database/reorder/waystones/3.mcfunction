#> pk_waystones:tools/database/reorder/waystones/3

# Append the waystone matching the id set in params to the new list and remove it from the reminaing waystones
$data modify storage pk:common temp.new_waystones append from storage pk:common temp.remaining_waystones[{id:$(id)}]
$data remove storage pk:common temp.remaining_waystones[{id:$(id)}]