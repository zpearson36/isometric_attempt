/// @description Insert description here
// You can write your code in this editor
if(device_mouse_x_to_gui(0) > draw_x and device_mouse_x_to_gui(0) < draw_x + width
	and device_mouse_y_to_gui(0) > draw_y and device_mouse_y_to_gui(0) <= draw_y + (num_buttons * (60)) + 10)
{
	oGame.in_action_menu = true
}
for(var i = 0; i < array_length(button_array); i++)
{
	button_array[i].is_active = is_active
}