#> pk_waystones:settings/tick_clear_gui_items/false

# Cancel process if setting is already set on the attempted value
execute unless score $pk.waystones.settings.tick_clear_gui_items pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Tick Clear GUI Items","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"false","color":"yellow"}]
execute if score $pk.waystones.settings.tick_clear_gui_items pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Tick Clear GUI Items","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"false","color":"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.tick_clear_gui_items pk.value 0