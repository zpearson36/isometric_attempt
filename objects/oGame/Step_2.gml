/// @description Insert description here
// You can write your code in this editor
switch state
{
	case GAMESTATES.BEGINTURN:
	{
		break;
	}
	case GAMESTATES.MAINTURN:
	{
		var total_action_points = 0
		for(var i = 0; i < array_length(team_array[current_team]); i++)
		{
			var tmp_char = team_array[current_team][i]
			total_action_points += tmp_char.current_ap
		}
		if(total_action_points == 0) state = GAMESTATES.ENDTURN
		break;
	}
	case GAMESTATES.ENDTURN:
	{
		break;
	}
}
in_action_menu = false
for(var i = 0; i < array_length(team_array); i++)
{
	if(array_length(team_array[i]) == 0) game_end() 
}