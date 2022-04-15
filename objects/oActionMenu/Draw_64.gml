/// @description Insert description here
// You can write your code in this editor
if(is_active)
{
	draw_rectangle_color(draw_x, draw_y, draw_x + width, draw_y + (num_buttons * (60)) + 10, c_black, c_black, c_black, c_black, true)
	draw_set_alpha(.5)
	draw_rectangle_color(draw_x, draw_y, draw_x + width, draw_y + (num_buttons * (60)) + 10, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}