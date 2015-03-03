/*
	Created by Lux0r
*/


private ["_grp","_grpIconId","_iconCfg"];

_grp		= [_this, 0] call BIS_fnc_param;
_grpIconId	= _grp getVariable "GRP_groupIcon";
_iconCfg	= [_grp] call GRP_fnc_getGroupIconCfg;


if (isNil "_grpIconId") then {
	_grpIconId	= _grp addGroupIcon [(_iconCfg select 0), [0, 0]];
	_grp setVariable ["GRP_groupIcon", _grpIconId, false];
};

_grp setGroupIconParams [(_iconCfg select 1), (_iconCfg select 2), 1, true];