/// @description Insert description here
// You can write your code in this editor

num_buttons = array_length(button_array)
if(device_mouse_x_to_gui(0) > draw_x and device_mouse_x_to_gui(0) < draw_x + width
	and device_mouse_y_to_gui(0) > draw_y and device_mouse_y_to_gui(0) <= draw_y + (num_buttons * (60)) + 10)
{
	oGame.in_action_menu = true
}
for(var i = 0; i < array_length(button_array); i++)
{
	button_array[i].is_active = is_active
	button_array[i].x = draw_x + 10
	button_array[i].y = draw_y + 10 + i * (10 + button_array[i].height)
}