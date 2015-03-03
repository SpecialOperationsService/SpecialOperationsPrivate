/*
	Created by Lux0r
*/


private ["_name","_uid","_player","_groups","_groupIDs"];

_name	= [_this, 0] call BIS_fnc_param;
_uid	= [_this, 1] call BIS_fnc_param;
_player	= [_name, _uid] call SOS_fnc_getPlayerById;

diag_log format["Groups - onPlayerConnected: _name = %1, _uid = %2, _player = %3", _name, _uid, _player];

if (!isNull _player) then {
	_groups		= [side _player] call GRP_fnc_getGroups;
	_groupIDs	= [];
	
	{
		_groupIDs pushBack (groupId _x);
	} forEach _groups;
	
	// Broadcast the latest groups and groupIDs to all players, to manage the groups.
	[[_groups, _groupIDs], "GRP_fnc_manageGroups", true, false] call BIS_fnc_MP;
	
	// Workaround: wait 2 minutes, then broadcast the again.
	[_groups, _groupIDs] spawn {
		sleep 120;
		[[(_this select 0), (_this select 1)], "GRP_fnc_manageGroups", true, false] call BIS_fnc_MP;
	};
};