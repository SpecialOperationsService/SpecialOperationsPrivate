/*
	Edited by Lux0r
*/


private ["_blacklist","_patrolArea_position","_pos1","_pos2","_mrk"];

_blacklist = [];


// This loop allows the script to run multiple times to create multiple patrol areas.
// Amount of patrol areas depends on what is set in the mission parameters.
for [{_k = 0}, {_k < CPG_patrolArea_number}, {_k = _k + 1}] do {
	// Counter of the number of enemies created so far
	CPG_createdEnemies = 0;
	
	// The first patrol area is spawning close to the Main HQ
	if (_k == 0) then {
		// Create enemy Main HQ.
		[] spawn CPG_fnc_mainHQ;
		waitUntil {sleep 10; count CPG_patrolArea_positions > 0;};
		_patrolArea_position = CPG_patrolArea_positions select 0;
	} else {
		// The following finds a random position on the island that isn't inside the blacklisted zones.
		_patrolArea_position = [CPG_mapCenter, 0, (CPG_mapSize/2) , 0, 0, 1000, 0, (CPG_blacklist + _blacklist), CPG_backupPos] call BIS_fnc_findSafePos;
		CPG_patrolArea_positions pushBack _patrolArea_position;
	};
	
	// Create a zone around the patrol are and save it in a blacklist, to prevent further patrol areas to spawn in the same area.
	[_blacklist, _patrolArea_position, (2000*CPG_patrolArea_radiusMulti), (2000*CPG_patrolArea_radiusMulti)] call CPG_fnc_addToBlacklist;
	
	// Create a marker on the patrol area center position, if the corresponding mission parameter is set to on.
	if (CPG_patrolArea_showMarker == 1) then {
		_mrk = [format ["m_cpg_patrolArea%1", _k], _patrolArea_position, "mil_objective", "ColorBlue", 0.8, "Solid", "Patrol the area"] call CPG_fnc_createMarker;
	};
	
	// Spawn enemies with different tactics/behaviour.
	while {CPG_createdEnemies <= CPG_patrolArea_enemies} do {
		[_patrolArea_position] call CPG_fnc_chooseTactic;
	};
};