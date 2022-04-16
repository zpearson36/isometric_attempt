/// @description Insert description here
// You can write your code in this editor
ds_grid_clear(map_grid, noone)
for (var i = 0; i < instance_number(oLowCover); ++i;)
{
	var tmp_cov = instance_find(oLowCover,i);
	map_grid[# ScreenToTileX(tmp_cov.x, tmp_cov.y), ScreenToTileY(tmp_cov.x, tmp_cov.y)] = tmp_cov
}
for (var i = 0; i < instance_number(oHighCover); ++i;)
{
	var tmp_cov = instance_find(oHighCover,i);
	map_grid[# ScreenToTileX(tmp_cov.x, tmp_cov.y), ScreenToTileY(tmp_cov.x, tmp_cov.y)] = tmp_cov
}
for (var i = 0; i < instance_number(oCharacter); ++i;)
{
    var tmp_char = instance_find(oCharacter,i);
	if(tmp_char._health <= 0)
	{
		for(var j = 0; j < array_length(team_array); j++)
		{
			var index = in_array(team_array[j], tmp_char)
			if(index != -1)
			{
				array_delete(team_array[j], index, 1)
				instance_destroy(tmp_char)
			}
			
		}
	}
	else map_grid[# ScreenToTileX(tmp_char.x, tmp_char.y), ScreenToTileY(tmp_char.x, tmp_char.y)] = tmp_char
}