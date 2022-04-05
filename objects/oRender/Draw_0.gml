/// @description Insert description here
// You can write your code in this editor
var tileData, screenX, screenY, tileIndex, tileZ;

for(var tX = 0; tX < MAP_W; tX++)
{
	for(var tY = 0; tY < MAP_H; tY++)
	{
		tileData = global.theMap[# tX, tY]
		screenX = TileToScreenX(tX, tY)
		screenY = TileToScreenY(tX, tY)
		tileIndex = tileData[TILE.SPRITE]
		tileZ = tileData[TILE.Z]
		
		
		if(tileIndex != 0)
		{
			if((ScreenToTileX(mouse_x, mouse_y) == tX) && (ScreenToTileY(mouse_x, mouse_y) == tY))
			{
				tileZ -= TILE_H / 2
			}
			draw_sprite(sIsoTerrain, tileIndex - 1, screenX, screenY + tileZ)
			if((ScreenToTileX(mouse_x, mouse_y) == tX) && (ScreenToTileY(mouse_x, mouse_y) == tY))
			{
				draw_sprite(sIsoSelect, - 1, screenX, screenY + tileZ)
			}
		}
	}
}