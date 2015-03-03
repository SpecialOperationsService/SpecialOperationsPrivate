/*
	Created by Cenwulf

	Description:
	Adds a secondary weapon along with magazines which are added to backpack.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of arrays
		(_this select 1) select n: ARRAY - Array of strings
			((_this select 1) select n) select 0: STRING - Class name of rifle
			((_this select 1) select n) select 1: STRING - Class name of magazine

	Returns:
	NONE
*/

private ["_unit","_weapons","_weapon"];
_unit = _this select 0;
_weapons = _this select 1;
_weapon = _weapons call BIS_fnc_selectRandom;
for "_i" from 1 to 5 do {_unit addItemToBackpack (_weapon select 1);};
_unit addWeapon (_weapon select 0);
_unit addItemToBackpack (_weapon select 1);