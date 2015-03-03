/*
	Created by Cenwulf
*/

private ["_iconCfg","_player","_groups"];

_name	= [_this, 0] call BIS_fnc_param;
_uid	= [_this, 1] call BIS_fnc_param;
_player	= [_name, _uid] call SOS_fnc_getPlayerById;

if (!isNull _player) then {
	_groups		= [side (group _player)] call GRP_fnc_getGroups;

	{
		if !(_x getVariable ["hasIcon",false]) then {
			_iconCfg = [_x] call GRP_fnc_getGroupIconCfg;
			_iconColour = [_x] call GRP_fnc_lastKnownPosCfg;
			createMarkerLocal [format ["lastKnownPos%1", _x],[0,0]];
			format ["lastKnownPos%1", _x] setMarkerAlphaLocal 0;
			format ["lastKnownPos%1", _x] setMarkerTypeLocal (_iconCfg select 0);
			format ["lastKnownPos%1", _x] setMarkerColorLocal _iconColour;
			format ["lastKnownPos%1", _x] setMarkerTextLocal (_iconCfg select 2);
			_x setVariable ["hasIcon",true];
		};
	} forEach _groups;
};