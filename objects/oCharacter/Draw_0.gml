/// @description Insert description here
// You can write your code in this editor

var tileData, screenX, screenY;

if(selected)
{
	for(var tX = 0; tX < MAP_W; tX++)
	{
		for(var tY = 0; tY < MAP_H; tY++)
		{
			if(tX == ScreenToTileX(x, y) and tY == ScreenToTileY(x, y)) continue
			tileData = movement_grid[# tX, tY]
			screenX = TileToScreenX(tX, tY)
			screenY = TileToScreenY(tX, tY)

			if(tileData != 0)
			{
				draw_sprite_ext(sIsoMovement, tileData - 1, screenX, screenY, 1, 1, 0, c_white, .5)
			}
		}
	}
}
draw_self()