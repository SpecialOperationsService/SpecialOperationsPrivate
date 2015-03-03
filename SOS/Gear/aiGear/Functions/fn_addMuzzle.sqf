/*
	Created by Cenwulf

	Description:
	Adds a weapon muzzle device randomly selected from array. Also works to add a specific object but is not its intended use.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		((_this select 1) select n: STRING - classname of muzzle

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_weapons","_weaponsUnit","_weapon","_muzzle","_weaponClass","_weaponParents"];
_unit = _this select 0;
_weapons = _this select 1;
_weaponsUnit = weapons _unit;
{
	_weapon = _x select 0;
	_muzzle = _x select 2;
	_weaponClass = [_weapon] call bis_fnc_classWeapon;
	_weaponParents = [_weaponClass,true] call bis_fnc_returnParents;
	if (_weapon in _weaponsUnit && !(_muzzle == "") && typeName _muzzle == "STRING") then {
		if ("Rifle_Base_F" in _weaponParents) then {
			_unit addPrimaryWeaponItem _muzzle;
		};
		if ("Pistol_Base_F" in _weaponParents) then {
			_unit addHandgunItem _muzzle;
		};
	};
} forEach _weapons;