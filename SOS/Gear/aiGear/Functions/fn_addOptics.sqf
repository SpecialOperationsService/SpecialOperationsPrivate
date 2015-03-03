/*
	Created by Cenwulf

	Description:
	Adds a weapon optic randomly selected from array. Also works to add a specific object but is not its intended use.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		((_this select 1) select n: STRING - classname of optic

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_optics","_optic"];
_unit = _this select 0;
_optics = _this select 1;
if (typeName _optics == "ARRAY") then {
	_optic = _optics call BIS_fnc_selectRandom;
	if !(_optic == "") then {
		_unit addPrimaryWeaponItem _optic;
	};
} else {
	_unit addPrimaryWeaponItem _optics;
};