/// @description Insert description here
// You can write your code in this editor
switch oGame.state
{
	case GAMESTATES.BEGINTURN:
	{
		current_ap = max_action_points
		break;
	}
	case GAMESTATES.MAINTURN:
	{
		switch(state)
		{
			case CHARSTATES.IDLE:
			{
				break;
			}
			case CHARSTATES.ATTACKING:
			{
				break;
			}
		}
		if((ScreenToTileX(mouse_x, mouse_y) == ScreenToTileX(x, y)) && (ScreenToTileY(mouse_x, mouse_y) == ScreenToTileY(x, y)))
		{
			highlight = true
		}
		else
		{
			highlight = false
		}
		break;
	}
	case GAMESTATES.ENDTURN:
	{
		break;
	}
}
