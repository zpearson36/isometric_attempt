/// @description Insert description here
// You can write your code in this editor
if(is_active)
{
	draw_rectangle_color(x, y, x + width, y + height,
		                    c_color, c_color, c_color, c_color, true)	
	draw_set_alpha(.5)
	draw_rectangle_color(x, y, x + width, y + height,
		                    c_color, c_color, c_color, c_color, false)	 
	draw_set_alpha(1)
	draw_text(x + 10, y + 10, txt)
}
