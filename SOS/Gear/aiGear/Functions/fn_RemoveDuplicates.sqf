/*
	Created by Muzzleflash and _Mofo_

	Description:
	Removes duplicate elements from an array and returns the duplicate free array.
	http://forums.bistudio.com/showthread.php?146876-Arrays-sqf-(howto)

	Parameter(s):
	_this select 0: ARRAY

	Returns:
	ARRAY
*/

private ["_array", "_unduplicated", "_original","_exists"];
_array = _this;
_unduplicated = [];
{
	_original = _x;
	_exists = false;
	{
		if ([_original, _x] call CEN_fnc_FancyIsEqual) exitWith {
			_exists = true;
		};
	} forEach _unduplicated;
	if (not _exists) then {
		_unduplicated set [count _unduplicated, _original];
	};
} forEach _array;
_unduplicated