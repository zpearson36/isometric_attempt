/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left))
{
	if(selected != undefined
	   and map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == noone)
	{
		var mx = mouse_x
		var my = mouse_y
		ds_grid_set(map_grid, ScreenToTileX(selected.x, selected.y), ScreenToTileY(selected.x, selected.y), noone)
		selected.x = TileToScreenX(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
		selected.y = TileToScreenY(ScreenToTileX(mx, my), ScreenToTileY(mx, my))
		ds_grid_set(map_grid, ScreenToTileX(selected.x, selected.y), ScreenToTileY(selected.x, selected.y), selected)
	}
	else
	{
		if(map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] != noone)
		{
			selected = map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
		}
	}
}

if(mouse_check_button_pressed(mb_right))
{
	selected = undefined
}