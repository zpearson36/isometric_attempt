/// @description Insert description here
// You can write your code in this editor
if(is_active)
{
	if(device_mouse_x_to_gui(0) > x and device_mouse_x_to_gui(0) < x + width
		and device_mouse_y_to_gui(0) > y and device_mouse_y_to_gui(0) <= y + height)
	{
		c_color = c_color_hover
		if(mouse_check_button_pressed(mb_left))
		{
			c_color      = c_color_select
			c_color_text = c_color_text_select
			script_execute(action)
		}
	}
}
