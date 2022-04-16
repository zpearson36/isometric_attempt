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
				if(mouse_check_button_pressed(mb_left))
				{
					if(attack_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == 2)
					{
						var tmp_char = oGame.map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
						var hit = irandom(99) + 1
						if(weapon.accuracy * hit > 75)
						{
							tmp_char._health -= weapon.damage
							instance_create_depth(tmp_char.x, tmp_char.y, -50000, oHitIndicator)
						}
						else instance_create_depth(tmp_char.x, tmp_char.y, -50000, oMissIndicator)
						current_ap = 0
					}
				}
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
