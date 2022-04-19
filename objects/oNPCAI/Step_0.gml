/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case NPCSTATES.IDLE:
	{
		if(npc == noone) break;
		if(npc.current_ap <= 0)          {npc = noone; break;}
		if(dest != undefined)            {state = NPCSTATES.MOVING; break;}
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
				if(oGame.map_grid[# tile_list[j][0], tile_list[j][1]] != noone) continue
				for(var k = 0; k < array_length(oGame.team_one); k++)
				{
					var new_dest = undefined
					var char_obj = oGame.team_one[k]
					var tmp_x2 = ScreenToTileX(char_obj.x, char_obj.y)
					var tmp_y2 = ScreenToTileY(char_obj.x, char_obj.y)
					var tmp_x3 = ScreenToTileX(tmp_cov.x, tmp_cov.y)
					var tmp_y3 = ScreenToTileY(tmp_cov.x, tmp_cov.y)
					var tmp_dist1 = point_distance(tile_list[j][0], tile_list[j][1], tmp_x2, tmp_y2)
					var tmp_dist2 = point_distance(tmp_x3, tmp_y3, tmp_x2, tmp_y2)
					if(tmp_dist1 > tmp_dist2) new_dest = [TileToScreenX(tile_list[j][0], tile_list[j][1]), TileToScreenY(tile_list[j][0], tile_list[j][1])]
					if(tmp_dest == undefined) tmp_dest = new_dest
					else if(new_dest != undefined and point_distance(npc.x, npc.y, new_dest[0], new_dest[1]) < point_distance(npc.x, npc.y, tmp_dest[0], tmp_dest[1])) tmp_dest = new_dest
					//Back up incase no suitable destination can be found, finds the closest
					//if(tmp_dest == undefined) tmp_dest = [TileToScreenX(tile_list[j][0], tile_list[j][1]), TileToScreenY(tile_list[j][0], tile_list[j][1])]
					//else if(point_distance(npc.x, npc.y, TileToScreenX(tile_list[j][0], tile_list[j][1]), TileToScreenY(tile_list[j][0], tile_list[j][1])) < point_direction(npc.x, npc.y, tmp_dest[0], tmp_dest[1])) tmp_dest = [tmp_cov.x, tmp_cov.y]
				}
			}
		}
		if(dest == undefined) dest = tmp_dest
		state = NPCSTATES.IDLE
		break;
	}
	case NPCSTATES.MOVING:
	{
		show_debug_message(npc)
		show_debug_message([ScreenToTileX(dest[0], dest[1]), ScreenToTileY(dest[0], dest[1])])
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
		show_debug_message([ScreenToTileX(dest[0], dest[1]), ScreenToTileY(dest[0], dest[1])])
		npc.destination = dest
		dest = undefined
		state = NPCSTATES.IDLE
		break;
	}
	case NPCSTATES.TARGETSELECTION:
	{
		npc.current_ap = 0
		break;
	}
	case NPCSTATES.ACTION:
	{
		break;
	}
}