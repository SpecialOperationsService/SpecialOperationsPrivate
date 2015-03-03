/*
	Created by Cenwulf

	Description:
	Adds goggles selected at random from an array passed as argument. Also works to add a specific object but is not its intended use.

	Intended to have arguments aray in the form of:
	[weapon, defaultAmmo, silencer, GL ammo]
	If any param is not available and empty string "" must be used to preserve array indices

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		(_this select 1) select n: STRING - Class name of goggles

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_goggles","_goggle"];
_unit = _this select 0;
_goggles = _this select 1;
removeGoggles _unit;
if (typeName _goggles == "ARRAY") then {
	_goggle = _goggles call BIS_fnc_selectRandom;
	if !(_goggle == "") then {
		_unit addGoggles _goggle;
	};
} else {
	_unit addGoggles _goggles;
};