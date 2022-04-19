/// @description Insert description here
// You can write your code in this editor
npc = noone
target = noone
dest = undefined
enum NPCSTATES
{
	IDLE,
	FINDINGCOVER,
	MOVING,
	TARGETSELECTION,
	ACTION
}
state = NPCSTATES.IDLE

function next(char_obj)
{
	target = noone
	dest   = undefined
	state  = NPCSTATES.IDLE
	npc    = char_obj
}