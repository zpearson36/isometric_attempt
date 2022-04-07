/// @description Insert description here
// You can write your code in this editor
var change_size = 128
cam = view_camera[0]
cam_x = camera_get_view_x(cam)
cam_y = camera_get_view_y(cam)
cam_h = camera_get_view_height(view_camera[0])
cam_w = camera_get_view_width(view_camera[0])
if(cam_x + cam_w > ROOM_W) camera_set_view_pos(cam, ROOM_W - cam_w, cam_y)
if(cam_y + cam_h > ROOM_H) camera_set_view_pos(cam, cam_x, ROOM_H - cam_h)

if(keyboard_check(ord("W"))) camera_set_view_pos(cam, cam_x, max(0 - ROOM_H / 3, cam_y - 16))
if(keyboard_check(ord("S"))) camera_set_view_pos(cam, cam_x, min(ROOM_H - cam_h, cam_y + 16))
if(keyboard_check(ord("A"))) camera_set_view_pos(cam, max(0 - ROOM_W / 2, cam_x - 16), cam_y)
if(keyboard_check(ord("D"))) camera_set_view_pos(cam, min(ROOM_W - cam_w, cam_x + 16), cam_y)

/*
//zoom functionality. if scroll down zoom out
//if scroll up zoom in
if(mouse_wheel_down())
{
	//var vp = room_get_viewport(Room1, 0)
	cam_size_w = min(cam_w + change_size, 3 * ROOM_W)
	cam_size_h = min(cam_h + change_size, 3 * ROOM_H)
	camera_set_view_size(view_camera[0], cam_size_w, cam_size_h)
	//oUtil.z = (cam_size / 256)
}else if(mouse_wheel_up())
{
	cam_w = camera_get_view_width(view_camera[0])
	cam_size_w = max(128, cam_w - change_size)
	cam_size_h = max(0, cam_w - change_size)
	camera_set_view_size(view_camera[0], cam_size_w, cam_size_h)
	//oUtil.z = (cam_size / 256)
}
*/

/*
if(oGame.state == GAME_STATE.PAUSED or oGame.state = GAME_STATE.GAME_OVER){
	draw_set_alpha(.3)
	draw_rectangle_color(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	if(oGame.state = GAME_STATE.GAME_OVER)
	{
		var room_to_cam_scale = (5/2)*camera_get_view_height(view_camera[0]) / ROOM_H
		draw_text_transformed_color(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 100*room_to_cam_scale,
						camera_get_view_y(view_camera[0])  + (camera_get_view_height(view_camera[0]) / 2), "GAME_OVER",//"("+string(floor(mouse_x / 32))+", "+string(floor(mouse_y / 32))+")",
						2 * room_to_cam_scale, 2 * room_to_cam_scale, 0,
						c_white, c_white, c_white, c_white, 1)
	}
}
*/