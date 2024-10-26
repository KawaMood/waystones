#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/taken/pages_add_recursive

# Add string to the array
data modify storage pk:common temp.entry set value {}
data modify storage pk:common temp.entry.raw set from storage pk:common temp.array_1[0]
data modify storage pk:common temp.args.components."minecraft:writable_book_content".pages append from storage pk:common temp.entry

# Recursive call
data remove storage pk:common temp.array_1[0]
execute if data storage pk:common temp.array_1[-1] run function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/taken/pages_add_recursive