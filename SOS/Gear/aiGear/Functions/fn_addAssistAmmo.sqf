/*
	Created by Cenwulf

	Description:
	Adds ammo to assistants's backpack dependant on missile specialists' weapons.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of arrays
		((_this select 1) select n: ARRAY - Array of strings
			((_this select 1) select n) select 0: STRING - Class name of launcher
			((_this select 1) select n) select 1: STRING - Class name of magazine

	ALTERNATE:
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

private ["_unit","_weapons","_unitsGroup","_mags","_weaponArray","_weaponsCount","_weaponsMax","_weaponsUnit"];
_unit = _this select 0;
_weapons = _this select 1;
sleep 1;
_unitsGroup = units group _unit;
if ((count _unitsGroup) > 1) then {
	_mags = [];
	_weaponsCount = count _weapons;
	_weaponsMax = _weaponsCount - 1;
	{
		_weaponsUnit = weapons _x;
		for "_i" from 0 to _weaponsMax do {
			_weaponArray = _weapons select _i;
			if ((_weaponArray select 0) in _weaponsUnit) then {
				_mags pushBack (_weaponArray select 1);
			};
		};
	} forEach _unitsGroup;
	for "_i" from 0 to 4 do {
		{_unit addItemToBackpack _x;} forEach _mags;
	};
};