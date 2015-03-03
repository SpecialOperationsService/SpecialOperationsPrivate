/*
	Created by Cenwulf

	Description:
	Adds a handgun type weapon along with magazines.

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
_unit addMagazines [(_weapon select 1),1];
_unit addWeapon (_weapon select 0);
_unit addMagazines [(_weapon select 1),3];