/// @description Insert description here
// You can write your code in this editor
//draw_text(50, 50, team_two[2].current_ap)
/*
draw_text(50, 50, map_grid[# ScreenToTileX(mouse_x, mouse_y), ScreenToTileY(mouse_x, mouse_y)])
*/
//draw_text(50, 75, string(ScreenToTileX(mouse_x, mouse_y)) + ", " + string(ScreenToTileY(mouse_x, mouse_y)))
draw_text(50, 75, team_one)
draw_text(50, 100, team_two)

for (var i = 0; i < instance_number(oCharacter); ++i;)
{
    draw_text(50,125 + i * 25, string(instance_find(oCharacter,i).flanked) + ": " + string(instance_find(oCharacter,i).flanked_by))
}