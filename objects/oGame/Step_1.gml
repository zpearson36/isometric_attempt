// uncomment to make player_turn false, have AI run all teams
//player_turn = false
end_turn_button.is_active = player_turn
ds_grid_clear(map_grid, noone)
for (var i = 0; i < instance_number(oLowCover); ++i;)
{
	var tmp_cov = instance_find(oLowCover,i);
	map_grid[# ScreenToTileX(tmp_cov.x, tmp_cov.y), ScreenToTileY(tmp_cov.x, tmp_cov.y)] = tmp_cov
}
for (var i = 0; i < instance_number(oHighCover); ++i;)
{
	var tmp_cov = instance_find(oHighCover,i);
	map_grid[# ScreenToTileX(tmp_cov.x, tmp_cov.y), ScreenToTileY(tmp_cov.x, tmp_cov.y)] = tmp_cov
}
for (var i = 0; i < instance_number(oCharacter); ++i;)
{
    var tmp_char = instance_find(oCharacter,i);
	tmp_char.flanked_by = []
	tmp_char.flanked = false
	if(tmp_char._health <= 0)
	{
		for(var j = 0; j < array_length(team_array); j++)
		{
			var index = in_array(team_array[j], tmp_char)
			if(index != -1)
			{
				array_delete(team_array[j], index, 1)
				instance_destroy(tmp_char)
			}
			
		}
	}
	else map_grid[# ScreenToTileX(tmp_char.x, tmp_char.y), ScreenToTileY(tmp_char.x, tmp_char.y)] = tmp_char
}
for(var i = 0; i < array_length(team_one); i++)
{
	for(var j = 0; j < array_length(team_two); j++)
	{
		if(team_one[i].is_flanked(team_two[j]))
		{
			team_one[i].flanked = true
			array_push(team_one[i].flanked_by, team_two[j])
		}
		if(team_two[j].is_flanked(team_one[i]))
		{
			team_two[j].flanked = true
			array_push(team_two[j].flanked_by, team_one[i])
		}
	}
}
switch state
{
	case GAMESTATES.BEGINTURN:
	{
		ai.next(noone)
		if(not player_turn)
		{
			selected = 0
		    ai.next(team_array[current_team][selected])
		}
		state = GAMESTATES.MAINTURN
		break;
	}
	case GAMESTATES.MAINTURN:
	{
		
		if(not player_turn)
		{
			if(team_array[current_team][selected].current_ap <= 0)
			{
				selected += 1
			    if(selected >= array_length(team_array[current_team])) break;
			    ai.next(team_array[current_team][selected])
			}
			break;
		}
	}
	case GAMESTATES.ENDTURN:
	{
		break;
	}
}