/// @description Insert description here
// You can write your code in this editor
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

