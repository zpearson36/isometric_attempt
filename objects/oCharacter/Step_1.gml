/// @description Insert description here
// You can write your code in this editor
ds_grid_clear(movement_grid, 0)
ds_grid_clear(attack_grid, -1)
if(current_ap > 0)
{
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd * current_ap,
						2)
	ds_grid_set_disk(movement_grid,
		                ScreenToTileX(x, y),
						ScreenToTileY(x, y),
						spd,
						1)
}
ds_grid_set_disk(attack_grid,
		         ScreenToTileX(x, y),
				 ScreenToTileY(x, y),
				 weapon.range,
				 0)
if(selected and current_ap <= 0)
{
	oGame.selected = undefined
	selected = false
	state = CHARSTATES.IDLE
}
switch(state)
{
	case CHARSTATES.IDLE:
	{
		menu.is_active = selected
		break;
	}
	case CHARSTATES.MOVING:
	{
		menu.is_active = false
	}
	case CHARSTATES.TARGETING:
	{
		menu.is_active = false
	}
	case CHARSTATES.ATTACKING:
	{
		menu.is_active = false
	}
}

