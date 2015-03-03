/*
	Returns all groups for the given side.
	
	Created by Lux0r
*/


private ["_side","_groups"];

_side	= [_this, 0] call BIS_fnc_param;
_groups = [];

{
	if (count units _x > 0 && side _x == _side) then {
		_groups pushBack _x;
	};
} forEach allGroups;

_groups