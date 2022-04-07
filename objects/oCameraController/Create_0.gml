/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0]
cam_x = camera_get_view_x(cam)
cam_y = camera_get_view_y(cam)
camera_set_view_pos(cam, cam_x - (ROOM_W / 2), cam_y - (ROOM_H / 4))