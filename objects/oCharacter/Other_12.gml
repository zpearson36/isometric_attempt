/// @description Draw_Gui event
// You can write your code in this editor
if(selected)
{
	switch(state)
	{
		case CHARSTATES.IDLE:
		{
			draw_text(50, 100, cover)
			break;
		}	
		case CHARSTATES.ATTACKING:
		{
			draw_text(50, 100, attack_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)])
			if(attack_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)] == 2)
			{
				var tmp_char = oGame.map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)]
				draw_set_alpha(.5)
				draw_rectangle_color(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) - 100, device_mouse_x_to_gui(0) + 200, device_mouse_y_to_gui(0) - 50, c_black, c_black, c_black, c_black, false)
				draw_set_alpha(1)
				draw_rectangle_color(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) - 100, device_mouse_x_to_gui(0) + 200, device_mouse_y_to_gui(0) - 50, c_black, c_black, c_black, c_black, true)
				draw_text(device_mouse_x_to_gui(0) + 10, device_mouse_y_to_gui(0) - 90, "Chance to hit: " + string(100 - tmp_char.get_protection()) + "%")
			}
			break;
		}

	}
}