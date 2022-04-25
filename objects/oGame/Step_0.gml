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
		if(player_turn)
		{
			if(mouse_check_button_pressed(mb_left) and not in_action_menu)
			{
				if(selected != undefined)
				{
					switch(selected.state)
					{
						case CHARSTATES.IDLE:
						{
							if( map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == noone
								and selected.movement_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] > 0)
							{
								var mx = mouse_x
								var my = mouse_y
								var tmp_dst = []
								tmp_dst[0] = TileToScreenX(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
								tmp_dst[1] = TileToScreenY(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
								selected.destination = tmp_dst
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
							break;
						}
						case CHARSTATES.TARGETING:
						{
							if(mouse_check_button_pressed(mb_left))
							{
								show_debug_message(selected.attack_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)])
								if(selected.attack_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == 2)
								{
									selected.target = map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
								}
							}
							break;
						}
						case CHARSTATES.ATTACKING:
						{
							break;
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
				if(selected != undefined)
				{
					if(selected.state != CHARSTATES.IDLE) selected.state = CHARSTATES.IDLE
					else
					{
						selected.selected = false
					    selected = undefined
					}
				}
			
			}
			break;
		}
		else
		{
			break;
		}
	}
	case GAMESTATES.ENDTURN:
	{
		if(player_turn)
		{
			if(selected != undefined) selected.selected = false
		}
		selected = undefined
		current_team++
		if(current_team >= num_teams) current_team = 0
		state = GAMESTATES.BEGINTURN
		player_turn = not player_turn
		break;
	}
}
