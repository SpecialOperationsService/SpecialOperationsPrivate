/*
	Edited by Lux0r
*/


private ["_pos","_range","_type","_air","_dead","_sides","_units","_result"];

_pos	= [_this, 0] call BIS_fnc_param;
_range	= [_this, 1, 100, [0]] call BIS_fnc_param;
_type	= [_this, 2, "", [""]] call BIS_fnc_param;
_air	= [_this, 3, false, [false]] call BIS_fnc_param;
_dead	= [_this, 4, false, [false]] call BIS_fnc_param;
_sides	= [_this, 5, [west, east, resistance], [[]]] call BIS_fnc_param;


if (_type == "count") then {
	_result = 0;
} else {
	_result = [];
};

if (!isDedicated) then {
	// Singleplayer
	_units = [player];
} else {
	// Multiplayer
	_units = playableUnits;
};

{
	// Check if unit is a human player from the searched sides.
	if ((isPlayer _x) && (side _x in _sides)) then {
		// Check if unit is not in an aircraft, or it's allowed.
		if (!(vehicle _x isKindOf "Air") || _air) then {
			// Check if unit is alive, or parameter for dead units is enabled.
			if (alive _x || _dead) then {
				// Check if unit is in range of the position.
				if (_x distance _pos <= _range) then {
					if (_type == "count") then {
						_result = _result + 1;
					} else {
						_result pushBack _x;
					};
				};
			};
		};
	};
} forEach _units;

_result