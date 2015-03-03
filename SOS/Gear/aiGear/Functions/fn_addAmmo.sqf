/*
	Created by Cenwulf

	Description:
	Adds ammo to ammobarer's backpack dependant on squad members' weapons.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of arrays
		((_this select 1) select n: ARRAY - Array of strings
			((_this select 1) select n) select 0: STRING - Class name of launcher
			((_this select 1) select n) select 1: STRING - Class name of magazine
	_this select 2: ARRAY - Array of arrays
		((_this select 2) select n: ARRAY - Array of strings
			((_this select 2) select n) select 0: STRING - Class name of rifle
			((_this select 2) select n) select 1: STRING - Class name of magazine
			((_this select 2) select n) select 2: STRING - Class name of silencer ("" if not available)
			((_this select 2) select n) select 3: STRING - Class name of grenade launcher magazine ("" if not available)

	Returns:
	NONE
*/

private ["_unit","_weaponsLauncher","_unitsGroup","_magsLauncher","_weaponArray","_mags","_weaponsCount","_weaponsMax","_weaponsUnit","_weaponsAll"];
_unit = _this select 0;
_weaponsLauncher = _this select 1;
_weaponsAll = _this select 2;
sleep 1;
_unitsGroup = units group _unit;
if ((count _unitsGroup) > 1) then {
	_magsLauncher = [];
	_weaponsCountLau = count _weaponsLauncher;
	_weaponsMaxLau = _weaponsCountLau - 1;
	{
		_weaponsUnit = weapons _x;
		for "_i" from 0 to _weaponsMaxLau do {
			_weaponArray = _weaponsLauncher select _i;
			if ((_weaponArray select 0) in _weaponsUnit) then {
				_magsLauncher pushBack (_weaponArray select 1);
			};
		};
	} forEach _unitsGroup;
	{_unit addItemToBackpack _x;} forEach _magsLauncher;
	_mags = [];
	_weaponsCount = count _weaponsAll;
	_weaponsMax = _weaponsCount - 1;
	_weaponArraySelect = [];
	for "_i" from 0 to _weaponsMax do {
		_weaponArraySelect = _weaponArraySelect + [_i];
	};		{
		_weaponsUnit = weapons _x;
		{
			_weaponArray = _weaponsAll select _x;
			if ((_weaponArray select 0) in _weaponsUnit) then {
				_mags pushBack (_weaponArray select 1);
			};
		} forEach _weaponArraySelect;
	} forEach _unitsGroup;
	for "_i" from 0 to 1 do {
		{_unit addItemToBackpack _x;} forEach _mags;
	};
};