/// @description Insert description here
// You can write your code in this editor
ds_grid_clear(movement_grid, 0)
ds_grid_clear(attack_grid, -1)
if(current_ap > 0)
{
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd * current_ap,
						2)
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd,
						1)
}
ds_grid_set_disk(attack_grid,
		         ScreenToTileX(x, y),
				 ScreenToTileY(x, y),
				 weapon.range,
				 0)
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
			else
			{
				attack_grid[# tX, tY] = 2
			}
		}
	}
}
if(highlight) y -= TILE_H / 2