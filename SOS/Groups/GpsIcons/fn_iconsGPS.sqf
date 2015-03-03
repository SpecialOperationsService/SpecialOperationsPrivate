/*
	Created by Cenwulf
*/

private ["_groups","_iconCfg"];
_player = _this select 0;
_groups = [side (group _player)] call GRP_fnc_getGroups;
{
	if (_x getVariable ["hasGPS",false]) then {
		if !(_x getVariable ["shownIcon",false]) then {
			_iconCfg = [_x] call GRP_fnc_getGroupIconCfg;
			_x setGroupIconParams [(_iconCfg select 1), (_iconCfg select 2), 1, true];
			format ["lastKnownPos%1", _x] setMarkerAlphaLocal 0;
			_x setVariable ["shownIcon",true];
		};
	} else {
		if (_x getVariable ["shownIcon",true]) then {
			format ["lastKnownPos%1", _x] setMarkerPosLocal (_x getVariable ["lastKnownPos",[0,0]]);
			_iconCfg = [_x] call GRP_fnc_getGroupIconCfg;
			_x setGroupIconParams [(_iconCfg select 1), (_iconCfg select 2), 1, false];
			if !(str (getMarkerPos format ["lastKnownPos%1", _x]) == "[0,0]") then {
				format ["lastKnownPos%1", _x] setMarkerAlphaLocal 1;
			};
			_x setVariable ["shownIcon",false];
		};
	};
} forEach _groups;