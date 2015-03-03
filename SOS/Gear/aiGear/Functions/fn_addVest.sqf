/*
	Created by Cenwulf

	Description:
	Adds a vest selected at random from an array passed as argument. Also works to add a specific object but is not its intended use.

	Intended to have arguments aray in the form of:
	[weapon, defaultAmmo, silencer, GL ammo]
	If any param is not available and empty string "" must be used to preserve array indices

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		(_this select 1) select n: STRING - Class name of vest

	ALTERNATIVE:
	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: STRING - classname

	Returns:
	NONE
*/

private ["_unit","_vests","_vest"];
_unit = _this select 0;
_vests = _this select 1;
removeVest _unit;
if (typeName _vests == "ARRAY") then {
	_vest = _vests call BIS_fnc_selectRandom;
	if !(_vest == "") then {
		_unit addVest _vest;
	};
} else {
	_unit addVest _vests;
};