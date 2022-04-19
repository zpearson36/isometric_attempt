/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case NPCSTATES.IDLE:
	{
		if(npc == noone) break;
		if(npc.current_ap <= 0)          {npc = noone; break;}
		if(dest != undefined)            {state = NPCSTATES.MOVING; break;}
		if(npc.flanked)                  {state = NPCSTATES.FINDINGCOVER; break;}
		if(npc.cover == global.no_cover) {state = NPCSTATES.FINDINGCOVER; break;}
		if(npc.target == noone)          {state = NPCSTATES.TARGETSELECTION; break;}
		state = NPCSTATES.ACTION;
		break;
	}
	case NPCSTATES.FINDINGCOVER:
	{
		var tmp_dest = undefined
		for(var i = 0; i < instance_number(oCoverParent); i++)
		{
			var tmp_cov = instance_find(oCoverParent, i)
			var tile_list = tmp_cov.get_adjacent_tiles()
			for(var j = 0; j < array_length(tile_list); j++)
			{
				var new_dest = [TileToScreenX(tile_list[j][0], tile_list[j][1]), TileToScreenY(tile_list[j][0], tile_list[j][1])]
				var is_flanked = false
				if(oGame.map_grid[# tile_list[j][0], tile_list[j][1]] != noone) continue
				for(var k = 0; k < array_length(oGame.team_one); k++)
				{
					var char_obj = oGame.team_one[k]
					var tmp_x2 = ScreenToTileX(char_obj.x, char_obj.y)
					var tmp_y2 = ScreenToTileY(char_obj.x, char_obj.y)
					var tmp_x3 = ScreenToTileX(tmp_cov.x, tmp_cov.y)
					var tmp_y3 = ScreenToTileY(tmp_cov.x, tmp_cov.y)
					var tmp_dist1 = point_distance(tile_list[j][0], tile_list[j][1], tmp_x2, tmp_y2)
					var tmp_dist2 = point_distance(tmp_x3, tmp_y3, tmp_x2, tmp_y2)
					if(tmp_dist1 < tmp_dist2) is_flanked = true
				}
				if(not is_flanked)
				{
					if(tmp_dest == undefined) tmp_dest = new_dest
					else if(point_distance(npc.x, npc.y, new_dest[0], new_dest[1])
							< point_distance(npc.x, npc.y, tmp_dest[0], tmp_dest[1])) tmp_dest = new_dest
				}
			}
		}
		dest = tmp_dest
		state = NPCSTATES.IDLE
		break;
	}
	case NPCSTATES.MOVING:
	{
		//show_debug_message(npc)
		//show_debug_message([ScreenToTileX(dest[0], dest[1]), ScreenToTileY(dest[0], dest[1])])
		if(npc.movement_grid[# ScreenToTileX(dest[0], dest[1]), ScreenToTileY(dest[0], dest[1])] == 0)
		{
			var tmp_x = ScreenToTileX(dest[0], dest[1])
			var tmp_y = ScreenToTileY(dest[0], dest[1])
			var tmp_dest = undefined
			for(var i = 0; i < MAP_W; i++)
			{
				for(var j = 0; j < MAP_H; j++)
				{
					if(npc.movement_grid[# i, j] != 0)
					{
						if(tmp_dest == undefined) tmp_dest = [i, j]
						else
						{
							if(point_distance(tmp_x, tmp_y, i, j) < point_distance(tmp_x, tmp_y, tmp_dest[0], tmp_dest[1])) tmp_dest = [i, j]
						}
						
					}
				}
			}
			dest = [TileToScreenX(tmp_dest[0], tmp_dest[1]), TileToScreenY(tmp_dest[0], tmp_dest[1])]
		}
		//show_debug_message([ScreenToTileX(dest[0], dest[1]), ScreenToTileY(dest[0], dest[1])])
		npc.destination = dest
		dest = undefined
		state = NPCSTATES.IDLE
		break;
	}
	case NPCSTATES.TARGETSELECTION:
	{
		//Are there any targets within range?
		//targets in range, find target with highest hit chance
		//set target
		var target_list = []
		for(var i = 0; i < array_length(oGame.team_one); i++)
		{
			var tmp_char = oGame.team_one[i]
			var tX = ScreenToTileX(tmp_char.x, tmp_char.y)
			var tY = ScreenToTileY(tmp_char.x, tmp_char.y)
			if(npc.attack_grid[# tX, tY] != -1)
			{
				array_push(target_list, tmp_char)
			}
		}
		if(array_length(target_list) > 0)
		{
			var tmp_targ = noone
			for(var i = 0; i < array_length(target_list); i++)
			{
				show_debug_message(target_list[i])
				if(tmp_targ == noone) tmp_targ = target_list[i]
				else if(tmp_targ.get_protection(npc) < target_list[i].get_protection(npc)) tmp_targ = target_list[i]
			}
			npc.target = tmp_targ
			target = tmp_targ
			state = NPCSTATES.IDLE
			break;
		}
		else
		{
			//No Targets in range, find the closest potential target
			//find safest cover closer to potential target
			//set destination
			var tmp_targ = noone
			for(var i = 0; i < array_length(oGame.team_one); i++)
			{
				var tmp_char = oGame.team_one[i]
				if(tmp_targ == noone) tmp_targ = tmp_char
				else if(point_distance(npc.x, npc.y, tmp_char.x, tmp_char.y) < point_distance(npc.x, npc.y, tmp_targ.x, tmp_targ.y)) tmp_targ = tmp_char
			}
			if(tmp_targ == noone){state = NPCSTATES.IDLE; break;}
			var cover_array = []
			for(var i = 0; i < instance_number(oCoverParent); i++)
			{
				var tmp_cov = instance_find(oCoverParent, i)
			    if(tmp_cov == npc.cover) continue
				if(point_distance(tmp_targ.x, tmp_targ.y, tmp_cov.x, tmp_cov.y) < point_distance(tmp_targ.x, tmp_targ.y, npc.x, npc.y)) array_push(cover_array, tmp_cov)
			}
			var tmp_dest = undefined
			for(var i = 0; i < array_length(cover_array); i++)
			{
				var tmp_cov = cover_array[i]
				var tile_list = tmp_cov.get_adjacent_tiles()
				for(var j = 0; j < array_length(tile_list); j++)
				{
					var new_dest = [TileToScreenX(tile_list[j][0], tile_list[j][1]), TileToScreenY(tile_list[j][0], tile_list[j][1])]
					var is_flanked = false
					if(oGame.map_grid[# tile_list[j][0], tile_list[j][1]] != noone) continue
					for(var k = 0; k < array_length(oGame.team_one); k++)
					{
						var char_obj = oGame.team_one[k]
						var tmp_x2 = ScreenToTileX(char_obj.x, char_obj.y)
						var tmp_y2 = ScreenToTileY(char_obj.x, char_obj.y)
						var tmp_x3 = ScreenToTileX(tmp_cov.x, tmp_cov.y)
						var tmp_y3 = ScreenToTileY(tmp_cov.x, tmp_cov.y)
						var tmp_dist1 = point_distance(tile_list[j][0], tile_list[j][1], tmp_x2, tmp_y2)
						var tmp_dist2 = point_distance(tmp_x3, tmp_y3, tmp_x2, tmp_y2)
						if(tmp_dist1 < tmp_dist2) is_flanked = true
					}
					if(not is_flanked)
					{
						if(tmp_dest == undefined) tmp_dest = new_dest
						else if(point_distance(tmp_targ.x, tmp_targ.y, new_dest[0], new_dest[1])
								< point_distance(tmp_targ.x, tmp_targ.y, tmp_dest[0], tmp_dest[1])
								and npc.movement_grid[# ScreenToTileX(new_dest[0], new_dest[1]), ScreenToTileY(new_dest[0], new_dest[1])] != 0) tmp_dest = new_dest
					}
				}
			}
			npc.destination = tmp_dest
			state = NPCSTATES.IDLE
			break;
		}
		break;
	}
	case NPCSTATES.ACTION:
	{
		break;
	}
}