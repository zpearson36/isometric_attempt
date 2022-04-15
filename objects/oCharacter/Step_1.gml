/// @description Insert description here
// You can write your code in this editor
if(selected and current_ap <= 0)
{
	oGame.selected = undefined
	selected = false
}
switch(state)
{
	case CHARSTATES.IDLE:
	{
		menu.is_active = selected
		break;
	}
	case CHARSTATES.ATTACKING:
	{
		menu.is_active = false
	}
}