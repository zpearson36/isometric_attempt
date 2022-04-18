var inst_num = instance_number(oDepthParent)
var dgrid = ds_depthgrid

ds_grid_resize(dgrid, 2, inst_num)

//add instances to the grid
var yy=0; with(oDepthParent)
{
	dgrid[# 0, yy] = id
	dgrid[# 1, yy] = y
	yy += 1
}

//sort the grid in ascending order
ds_grid_sort(dgrid, 1, true)

//loop through grid and draw all instances

var inst; yy = 0; repeat(inst_num)
{
	inst = dgrid[# 0, yy]
	
	with(inst)
	{
		event_perform(ev_gui_end, 0)
	}
	yy += 1
}