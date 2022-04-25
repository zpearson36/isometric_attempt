_utils = instance_create_layer(x, y, layer, oUtils)

map_grid = ds_grid_create(MAP_W, MAP_H)
ds_grid_clear(map_grid, noone)

randomize()
team_one = []
repeat(5)
{
	tmp_x = irandom(MAP_W - 1)
	tmp_y = irandom(MAP_H / 5)
	var tmp_char = instance_create_layer(
	                                    TileToScreenX(tmp_x, tmp_y),
										TileToScreenY(tmp_x, tmp_y),
										layer,
										oCharacter
										)
	array_push(team_one, tmp_char)
	map_grid[# tmp_x, tmp_y] = tmp_char
}

team_two = []
color_array = [c_red, c_aqua, c_fuchsia]
ii = 0
repeat(5)
{
	tmp_x = irandom(MAP_W - 1)
	tmp_y = irandom_range(MAP_H - (MAP_H /5) ,MAP_H - 1)
	while(map_grid[# tmp_x, tmp_y] != noone)
	{
		tmp_x = irandom(MAP_W - 1)
	    tmp_y = irandom(MAP_H - 1)
	}
	var tmp_char = instance_create_layer(
	                                    TileToScreenX(tmp_x, tmp_y),
										TileToScreenY(tmp_x, tmp_y),
										layer,
										oCharacter
										)
	tmp_char.c_color = color_array[ii % 3]
	array_push(team_two, tmp_char)
	map_grid[# tmp_x, tmp_y] = tmp_char
	ii++
}

team_array = []
array_push(team_array, team_one)
array_push(team_array, team_two)
current_team = 0
num_teams = array_length(team_array)

cover_array = []
repeat(15)
{
	tmp_x = irandom(MAP_W - 1)
	tmp_y = irandom(MAP_H - 1)
	//tmp_y = irandom_range((MAP_H / 4) + 1, MAP_H - (MAP_H / 4))
	while(map_grid[# tmp_x, tmp_y] != noone)
	{
		tmp_x = irandom(MAP_W - 1)
	    tmp_y = irandom(MAP_H - 1)
	}
	
	var tmp_obj = oLowCover
	if(irandom(100) % 2 == 0) tmp_obj = oHighCover
	
	var tmp_cover = instance_create_layer(
	                                    TileToScreenX(tmp_x, tmp_y),
										TileToScreenY(tmp_x, tmp_y),
										layer,
										tmp_obj
										)
	map_grid[# tmp_x, tmp_y] = tmp_cover

	array_push(cover_array, tmp_cover)
}
depth_sorter = instance_create_layer(x, y, layer, oDepthSorter)
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
player_turn = true
ai = instance_create_layer(x, y, layer, oNPCAI)

function end_team_turn()
{
	for(var i = 0; i < array_length(oGame.team_array[oGame.current_team]); i++)
	{
		oGame.team_array[oGame.current_team][i].current_ap = 0
	}
}
end_turn_button = instance_create_layer(x, y, layer, oActionMenu)
end_turn_button.draw_x = display_get_gui_width() - 300
end_turn_button.draw_y = 50
end_turn_button.is_active = player_turn
end_turn_button.button_array[0].action = end_team_turn
