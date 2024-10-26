# Prepare an array of coordinates of the used waystone
data modify storage pk:common temp.used_waystone.pos set value []
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.x
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.y
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.z