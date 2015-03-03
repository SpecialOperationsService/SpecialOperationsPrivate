/*
	Created by Lux0r
*/


private ["_type","_pos","_distance","_mkrPos","_mkrType","_mrk"];

_type		= [_this, 0] call BIS_fnc_param;
_pos		= [_this, 1] call BIS_fnc_param;
_distance	= [_this, 3, 0] call BIS_fnc_param;


// Create marker depending on the chosen probability
if (floor(random 100) < CPG_markerProb) then {
	CPG_intelNo	= CPG_intelNo + 1;
	_mkrPos		= [_pos, 0, _distance, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_mkrType	= if ((random 100) < CPG_markerTypeProb) then {_type;} else {"o_unknown";};
	_mrk		= [format ["m_cpg_intelNo%1", CPG_intelNo], _mkrPos, _mkrType] call CPG_fnc_createMarker;
};