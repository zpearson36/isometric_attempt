/// @description Insert description here
// You can write your code in this editor
map_grid = ds_grid_create(MAP_W, MAP_H)
ds_grid_clear(map_grid, noone)

randomize()
tmp_x = irandom(MAP_W)
tmp_y = irandom(MAP_H)

var tmp_char = instance_create_layer(
                                    TileToScreenX(tmp_x, tmp_y),
									TileToScreenY(tmp_x, tmp_y),
									layer,
									oCharacter
									)
team_one = []
array_push(team_one, tmp_char)
map_grid[# tmp_x, tmp_y] = tmp_char
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