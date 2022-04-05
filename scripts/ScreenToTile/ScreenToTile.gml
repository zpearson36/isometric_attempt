// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenToTileX(_rX, _rY)
{
	return floor((_rY / TILE_H) + (_rX / TILE_W))
}

function ScreenToTileY(_rX, _rY)
{
	return floor((_rY / TILE_H) - (_rX / TILE_W))
}