/*
	Created by Cenwulf

	Description:
	Adds basic items to vest and unitform.

	Parameter(s):
	_this select 0: OBJECT - Target unit
	_this select 1: ARRAY - Array of arrays
		(_this select 1) select 0: STRING - Class name FAK
		(_this select 1) select 1: STRING - Class name smoke
		(_this select 1) select 2: STRING - Class name grenade
		(_this select 1) select 3: STRING - Class name chemlight

	Returns:
	NONE
*/

private ["_unit","_basicItems"];
_unit = _this select 0;
_basicItems = _this select 1;
for "_i" from 1 to 2 do {
	_unit addItemToUniform (_basicItems select 0);
	_unit addItemToVest (_basicItems select 1);
	_unit addItemToVest (_basicItems select 2);
	_unit addItemToVest (_basicItems select 3);
};