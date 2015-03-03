/*
	Created by Cenwulf

	Description:
	Adds a backpack selected at random from an array passed as argument. Also works to add a specific object but is not its intended use.

	Intended to have arguments aray in the form of:
	[weapon, defaultAmmo, silencer, GL ammo]
	If any param is not available and empty string "" must be used to preserve array indices

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		(_this select 1) select n: STRING - Class name of pack

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_packs","_pack"];
_unit = _this select 0;
_packs = _this select 1;
removeBackpack _unit;
if (typeName _packs == "ARRAY") then {
	_pack = _packs call BIS_fnc_selectRandom;
	if !(_pack == "") then {
		_unit addBackpack _pack;
	};
} else {
	_unit addBackpack _packs;
};