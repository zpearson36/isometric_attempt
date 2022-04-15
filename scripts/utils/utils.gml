// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function end_turn()
{
	oGame.selected.current_ap = 0
}

function in_array(array, obj)
{
	//returns index of object if found in array, else returns -1
	var index = -1
	for(var i = 0; i < array_length(array); i++)
	{
		if(array[i] == obj) index = i
	}
	
	return index
}

function move_to_attack()
{
	oGame.selected.state = CHARSTATES.ATTACKING
}