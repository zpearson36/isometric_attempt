/// @description Insert description here
// You can write your code in this editor
map_grid = ds_grid_create(MAP_W, MAP_H)
ds_grid_clear(map_grid, noone)

//randomize()
tmp_x = irandom(MAP_W - 1)
tmp_y = irandom(MAP_H - 1)
var tmp_char = instance_create_layer(
                                    TileToScreenX(tmp_x, tmp_y),
									TileToScreenY(tmp_x, tmp_y),
									layer,
									oCharacter
									)
team_one = []
array_push(team_one, tmp_char)
map_grid[# tmp_x, tmp_y] = tmp_char


tmp_x = irandom(MAP_W - 1)
tmp_y = irandom(MAP_H - 1)
var tmp_char = instance_create_layer(
                                    TileToScreenX(tmp_x, tmp_y),
									TileToScreenY(tmp_x, tmp_y),
									layer,
									oCharacter
									)
array_push(team_one, tmp_char)
map_grid[# tmp_x, tmp_y] = tmp_char

tmp_x = irandom(MAP_W - 1)
tmp_y = irandom(MAP_H - 1)
var tmp_char = instance_create_layer(
                                    TileToScreenX(tmp_x, tmp_y),
									TileToScreenY(tmp_x, tmp_y),
									layer,
									oCharacter
									)
tmp_char.c_color = c_red
team_two = []
array_push(team_two, tmp_char)
map_grid[# tmp_x, tmp_y] = tmp_char


team_array = []
array_push(team_array, team_one)
array_push(team_array, team_two)
current_team = 0
num_teams = array_length(team_array)

renderer = instance_create_layer(x, y, layer, oRender)			
cam_con = instance_create_layer(x, y, layer, oCameraController)

selected = undefined

enum GAMESTATES
{
	BEGINTURN,
	MAINTURN,
	ENDTURN
}

state = GAMESTATES.BEGINTURN
in_action_menu = false