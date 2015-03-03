/*
	Created by Muzzleflash and _Mofo_

	Description:
	Checks if 2 array elements are equal.
	http://forums.bistudio.com/showthread.php?146876-Arrays-sqf-(howto)

	Parameter(s):
	_this select 0: ANYTHING
	_this select 1: ANYTHING

	Returns:
	BOOLEAN
*/

private ["_objectA","_objectB","_result","_elemB","_elemB"];
_objectA = _this select 0;
_objectB = _this select 1;
//Nils?
if (isNil "_objectA") exitWith {isNil "_objectB"};
//Do they have the same type?
if (typeName _objectA != typeName _objectB) exitWith {false};
//Are they values?
if (typeName _objectA != typeName []) exitWith {_objectA == _objectB};
//It must be arrays. Do they have same length?
if (count _objectA != count _objectB) exitWith {false};
//Process each element; assume true
_result = true;
for "_i" from 0 to (count _objectA - 1) do {
	_elemA = _objectA select _i;
	_elemB = _objectB select _i;
	//Process recursively
	if (not ([_elemA, _elemB] call CEN_fnc_FancyIsEqual)) exitWith {_result = false;};
};
_result