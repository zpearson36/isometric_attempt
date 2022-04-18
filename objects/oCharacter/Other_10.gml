/// @description Draw Begin event
// You can write your code in this editor

for(var tX = 0; tX < MAP_W; tX++)
{
	for(var tY = 0; tY < MAP_H; tY++)
	{
		var tmp_char = oGame.map_grid[# tX, tY]
		if(tmp_char != noone and attack_grid[# tX, tY] == 0)
		{
			if(in_array(oGame.team_array[oGame.current_team], tmp_char))
			{
				attack_grid[# tX, tY] = 1
			}
			else if(tmp_char.object_index != oLowCover and tmp_char.object_index != oHighCover)
			{
				attack_grid[# tX, tY] = 2
			}
		}
	}
}
if(highlight) y_offset -= TILE_H / 2