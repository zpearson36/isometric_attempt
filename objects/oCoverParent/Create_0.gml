/// @description Insert description here
// You can write your code in this editor
function get_adjacent_tiles()
{
	var tmp_x = ScreenToTileX(x, y)
	var tmp_y = ScreenToTileY(x, y)
	var cardinals = [[tmp_x, tmp_y-1], [tmp_x-1, tmp_y], [tmp_x+1, tmp_y], [tmp_x, tmp_y+1]]
	var tile_list = []
	for(var i = -1; i <= 1; i++)
	{
		for(var j = -1; j <= 1; j++)
		{
			if(i == 0 and j == 0) continue
			array_push(tile_list, [tmp_x + i, tmp_y + j])
		}
	}
	
	// remove cardinals and return tile_list to use all adjacent tiles
	return cardinals
}