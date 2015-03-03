/*
	Created by Cenwulf

	VARIABLES:
	_this select 0: group

	RETURNS:
	ARRAY - last known position of group leader.
*/

private ["_grp","_lastKnownPos","_iconCfg"];
_grp = _this select 0;
if (leader _grp == player) then {
	_pos3D = getPos (leader _grp);
	_pos2D = [_pos3D select 0, _pos3D select 1];
	_grp setVariable ["lastKnownPos",_pos2D,true];
};
_lastKnownPos = _grp getVariable ["lastKnownPos",[0,0]];
_lastKnownPos