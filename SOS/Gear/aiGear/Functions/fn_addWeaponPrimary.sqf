/*
	Created by Cenwulf

	Description:
	Adds a grenade launcher type primary weapon along with magazines and grenades which are added to vest.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of arrays
		((_this select 1) select n: ARRAY - Array of strings
			((_this select 1) select n) select 0: STRING - Class name of rifle
			((_this select 1) select n) select 1: STRING - Class name of magazine
			((_this select 1) select n) select 2: STRING - Class name of silencer ("" if not available)
			((_this select 1) select n) select 3: STRING - Class name of grenade launcher magazine ("" if not available)

	Returns:
	NONE
*/

private ["_unit","_weapons","_weapon"];
_unit = _this select 0;
_weapons = _this select 1;
_weapon = _weapons call BIS_fnc_selectRandom;
for "_i" from 1 to 10 do {_unit addItemToVest (_weapon select 1);};
_unit addItemToUniform (_weapon select 1);
_unit addWeapon (_weapon select 0);
_unit addItemToVest (_weapon select 1);
for "_i" from 1 to 3 do {_unit addItemToUniform (_weapon select 1);};