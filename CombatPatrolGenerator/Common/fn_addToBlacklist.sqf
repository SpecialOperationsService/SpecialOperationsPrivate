/*
	Created by Lux0r
*/


// Don't add "_blacklist" to private variables. This function modifies the original list;
private ["_pos","_x","_y","_pos1","_pos2"];

_blacklist	= [_this, 0] call BIS_fnc_param;
_pos		= [_this, 1] call BIS_fnc_param;
_x			= [_this, 2] call BIS_fnc_param;
_y			= [_this, 3] call BIS_fnc_param;

_pos1 = [(_pos select 0) - _x, (_pos select 1) + _y, 0];
_pos2 = [(_pos select 0) + _x, (_pos select 1) - _y, 0];
_blacklist pushBack [_pos1,_pos2];