/*
	Created by Cenwulf

	Description:
	Adds a uniform selected at random from an array passed as argument. Also works to add a specific object but is not its intended use.

	Intended to have arguments aray in the form of:
	[weapon, defaultAmmo, silencer, GL ammo]
	If any param is not available and empty string "" must be used to preserve array indices

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of strings
		(_this select 1) select n: STRING - Class name of uniform

	Returns:
	NONE
*/

private ["_unit","_uniforms","_uniform"];
_unit = _this select 0;
_uniforms = _this select 1;
removeUniform _unit;
if (typeName _uniforms == "ARRAY") then {
	_uniform = _uniforms call BIS_fnc_selectRandom;
	_unit forceAddUniform _uniform;
} else {
	_unit forceAddUniform _uniforms;
};