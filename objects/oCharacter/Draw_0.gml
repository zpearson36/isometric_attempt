/// @description Insert description here
// You can write your code in this editor
var tileData, screenX, screenY;
if(selected)
{
	switch(state)
	{
		case CHARSTATES.IDLE:
		{
			for(var tX = 0; tX < MAP_W; tX++)
			{
				for(var tY = 0; tY < MAP_H; tY++)
				{
					if(tX == ScreenToTileX(x, y) and tY == ScreenToTileY(x, y)) continue
					tileData = movement_grid[# tX, tY]
					screenX = TileToScreenX(tX, tY)
					screenY = TileToScreenY(tX, tY)
					var offset = 1
					if(current_ap == 1 ) offset = 0

					if(tileData != 0)
					{
						draw_sprite_ext(sIsoMovement, tileData - offset, screenX, screenY, 1, 1, 0, c_white, .5)
					}
				}
			}
			break;
		}	
		case CHARSTATES.ATTACKING:
		{
			for(var tX = 0; tX < MAP_W; tX++)
			{
				for(var tY = 0; tY < MAP_H; tY++)
				{
					if(tX == ScreenToTileX(x, y) and tY == ScreenToTileY(x, y)) continue
					tileData = attack_grid[# tX, tY]
					screenX = TileToScreenX(tX, tY)
					screenY = TileToScreenY(tX, tY)

					if(tileData != -1)
					{
						draw_sprite_ext(sIsoAttackIndicator, tileData, screenX, screenY, 1, 1, 0, c_white, .5)
					}
				}
			}
			break;
		}

	}
}
draw_sprite_ext(sprite_index, -1, x, y, 1,1, 0, c_color, 1)
