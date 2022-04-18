/// @description Insert description here
// You can write your code in this editor

var tmp_x = ScreenToTileX(x, y)
var tmp_y = ScreenToTileY(x, y)
for(var i = -1; i <= 1; i++)
{
	for(var j = -1; j <= 1; j++)
	{
		if(i == 0 and j == 0) continue
		if(tmp_x + i < 0 or tmp_y + j < 0 or tmp_x + i >= MAP_W or tmp_y + j >= MAP_H) continue
		var tmp_obj = oGame.map_grid[# tmp_x + i, tmp_y + j]
		if(tmp_obj != noone)
		{
			if(tmp_obj.object_index == oCharacter and tmp_obj.y < y) alpha = .5
		}
		//draw_sprite(sIsoAttackIndicator, 0, TileToScreenX(tmp_x + i, tmp_y + j), TileToScreenY(tmp_x + i, tmp_y + j))
	}
}
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, c_white, alpha)
alpha = 1