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
		for(var i = 0; i < array_length(team_one); i++)
		{
			total_action_points += team_one[i].current_ap
		}
		if(total_action_points == 0) state = GAMESTATES.ENDTURN
		break;
	}
	case GAMESTATES.ENDTURN:
	{
		break;
	}
}