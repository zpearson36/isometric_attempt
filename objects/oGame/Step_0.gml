/// @description Insert description here
// You can write your code in this editor
switch state
{
	case GAMESTATES.BEGINTURN:
	{
		state = GAMESTATES.MAINTURN
		break;
	}
	case GAMESTATES.MAINTURN:
	{
		if(mouse_check_button_pressed(mb_left) and not in_action_menu)
		{
			if(selected != undefined)
			{
			   if( map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == noone
			       and selected.movement_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] > 0)
				{
					var mx = mouse_x
					var my = mouse_y
					ds_grid_set(map_grid, ScreenToTileX(selected.x, selected.y), ScreenToTileY(selected.x, selected.y), noone)
					selected.x = TileToScreenX(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
					selected.y = TileToScreenY(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
					ds_grid_set(map_grid, ScreenToTileX(selected.x, selected.y), ScreenToTileY(selected.x, selected.y), selected)
					selected.current_ap -= selected.movement_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
				}
				else if(map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] != noone)
				{
					var tmp_char = map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
					if(in_array(team_array[current_team], tmp_char) != -1)
					{
						selected.selected = false
						selected = tmp_char
						selected.selected = true
					}
				}
			}
			else
			{
				if(map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] != noone)
				{
					var tmp_char = map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
					if(in_array(team_array[current_team], tmp_char) != -1)
					{
						selected = tmp_char
						selected.selected = true
					}
				}
			}
		}

		if(mouse_check_button_pressed(mb_right))
		{
			if(selected != undefined) selected.selected = false
			selected = undefined
		}
		break;
	}
	case GAMESTATES.ENDTURN:
	{
		
		if(selected != undefined) selected.selected = false
		selected = undefined
		current_team++
		if(current_team >= num_teams) current_team = 0
		state = GAMESTATES.BEGINTURN
		break;
	}
}
