#> pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/tp_cooldown/cancel_2

$data modify storage pk:common temp.args.reason set value "You must wait $(seconds) seconds before reaching another waystone"
function pk_waystones:blocks/waystone/use/gui/triggers/cancel with storage pk:common temp.args