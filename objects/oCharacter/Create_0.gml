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
cover = global.no_cover
protection = 0
y_offset = 0
_health = 3

enum CHARSTATES
{
	IDLE,
	ATTACKING
}

state = CHARSTATES.IDLE

function get_protection(char_obj)
{
	var tmp_pro = protection
	var tmp_x1 = ScreenToTileX(x, y)
	var tmp_y1 = ScreenToTileY(x, y)
	var tmp_x2 = ScreenToTileX(char_obj.x, char_obj.y)
	var tmp_y2 = ScreenToTileY(char_obj.x, char_obj.y)
	var tmp_x3 = ScreenToTileX(cover.x, cover.y)
	var tmp_y3 = ScreenToTileY(cover.x, cover.y)
	var tmp_dst1 = point_distance(tmp_x1, tmp_y1, tmp_x2, tmp_y2)
	var tmp_dst2 = point_distance(tmp_x3, tmp_y3, tmp_x2, tmp_y2)
	if(tmp_dst1 > tmp_dst2) tmp_pro += cover.cover_bonus
	return tmp_pro
}