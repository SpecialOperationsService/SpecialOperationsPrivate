/*
	Created by Cenwulf

	Description:
	Adds a headgear selected at random from an array passed as argument. Also works to add a specific object but is not its intended use.

	Intended to have arguments aray in the form of:
	[weapon, defaultAmmo, silencer, GL ammo]
	If any param is not available and empty string "" must be used to preserve array indices

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		(_this select 1) select n: STRING - Class name of headgear

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_helms","_helm"];
_unit = _this select 0;
_helms = _this select 1;
removeHeadgear _unit;
if (typeName _helms == "ARRAY") then {
	_helm = _helms call BIS_fnc_selectRandom;
	if !(_helm == "") then {
		_unit addHeadgear _helm;
	};
} else {
	_unit addHeadgear _helms;
};