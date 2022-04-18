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
		
		cover = global.no_cover
		var tmp_x = ScreenToTileX(x, y)
		var tmp_y = ScreenToTileY(x, y)
		for(var i = -1; i <= 1; i++)
		{
			for(var j = -1; j <= 1; j++)
			{
				if(i == 0 and j == 0) continue
				if(tmp_x + i < 0 or tmp_y + j < 0 or tmp_x + i >= MAP_W or tmp_y + j >= MAP_H) continue
				if(oGame.map_grid[# tmp_x + i, tmp_y + j] != noone)
				{
					var tmp_obj_index = oGame.map_grid[# tmp_x + i, tmp_y + j].object_index
					if(tmp_obj_index == oLowCover or tmp_obj_index == oHighCover)
					{
						cover = oGame.map_grid[# tmp_x + i, tmp_y + j]
					}
				}
			}
		}
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
						if(weapon.accuracy * hit > tmp_char.get_protection(self))
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
