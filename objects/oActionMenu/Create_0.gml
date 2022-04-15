/// @description Insert description here
// You can write your code in this editor
draw_y = display_get_gui_height() - 300
draw_x = 100
button_array = []
array_push(button_array, instance_create_depth( draw_x + 10, draw_y + 10,  -10000, oActionMenuButton))
button_array[0].action = end_turn
button_array[0].txt    = "End Turn"
is_active = false
width = 220
num_buttons = array_length(button_array)