/// @description Insert description here
// You can write your code in this editor
if(highlight) y -= TILE_H / 2
ds_grid_clear(movement_grid, 0)
if(current_ap > 0)
{
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd * current_ap,
						2
						)
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd,
						3 - current_ap
						)
}