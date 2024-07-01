#> pk_waystones:settings/tick_clear_gui_items/get

# If false
execute unless score $pk.waystones.settings.tick_clear_gui_items pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Tick Clear GUI Items","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
# If true
execute if score $pk.waystones.settings.tick_clear_gui_items pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Tick Clear GUI Items","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]