/// @description Insert description here
// You can write your code in this editor
tmp_x = 7
tmp_y = 6
highlight = false
max_action_points = 2
current_ap = max_action_points
spd = 5
selected = false
movement_grid = ds_grid_create(MAP_W, MAP_H)
ds_grid_clear(movement_grid, 0)
attack_grid = ds_grid_create(MAP_W, MAP_H)
ds_grid_clear(attack_grid, -1)
menu = instance_create_layer(x, y, layer, oActionMenu)
var tmp_btn = instance_create_depth( menu.draw_x + 10, menu.draw_y + 70,  -10000, oActionMenuButton)
tmp_btn.txt = "Attack"
tmp_btn.action = move_to_attack
array_push(menu.button_array, tmp_btn)
c_color = c_blue
weapon = instance_create_layer(x, y, layer, oWeapon)
protection = 50

_health = 3

enum CHARSTATES
{
	IDLE,
	ATTACKING
}

state = CHARSTATES.IDLE