/// @description Insert description here
// You can write your code in this editor
var total_action_points = 0
for(var i = 0; i < array_length(team_array[current_team]); i++)
{
	total_action_points += team_array[current_team][i].current_ap
}
//draw_text(50, 50, total_action_points)
var tmp_array = [5, 4, 3]
draw_text(50, 50, in_array(team_array[current_team], team_array[current_team][0]))