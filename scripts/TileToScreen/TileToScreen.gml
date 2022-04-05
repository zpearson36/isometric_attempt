// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TileToScreenX(_tX, _tY)
{
	return ((_tX - _tY) * (TILE_W * .5))
}

function TileToScreenY(_tX, _tY)
{
	return ((_tX + _tY) * (TILE_H * .5))
}