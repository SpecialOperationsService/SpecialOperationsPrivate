/*
	Created by Lux0r
*/


private ["_groups","_groupIDs","_groupId"];

_groups		= [_this, 0] call BIS_fnc_param;
_groupIDs	= [_this, 1] call BIS_fnc_param;

diag_log format["manageGroups: _groups = %1, _groupIDs = %2", _groups, _groupIDs];

{
	_groupId = _groupIDs select _forEachIndex;
	_x setGroupId [_groupId];
	[_x] call GRP_fnc_addGroupIcon;
} forEach _groups;