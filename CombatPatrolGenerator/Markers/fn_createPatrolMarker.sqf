/*
	Created by Lux0r
*/


private ["_mkrPos","_mkrSize","_mkrShape","_mrk"];

_mkrPos		= [_this, 0] call BIS_fnc_param;
_mkrSize	= [_this, 1, [1, 1]] call BIS_fnc_param;
_mkrShape	= [_this, 2, "RECTANGLE"] call BIS_fnc_param;


CPG_patrolNo = CPG_patrolNo + 1;
_mrk = createMarkerLocal [format ["m_cpg_taskNo%1", CPG_patrolNo], _mkrPos];
_mrk setMarkerSizeLocal _mkrSize;
_mrk setMarkerShapeLocal _mkrShape;
_mrk setMarkerAlphaLocal 0;

_mrk