////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Combat Patrol Generator
//
//	Script created by BlackAlpha.
//	www.tier1ops.eu
//
//	Edited by Lux0r.
//	www.sos-tactical-gaming.shivtr.com
//
//	This script will spawn enemies randomly on the map. First, the script randomly chooses a "patrol area". Then it spawns enemies around that patrol area.
//
//
//	Technical stuff:
//
//	Execute this script during map initialization and it will start the entire Combat Patrol Generator.
//	For example, inside "init.sqf" put the following line:
//	[] execVM "CombatPatrolGenerator\init.sqf";
//
//
//	This script requires the following ingame markers to exist prior to starting CPG:
//	(Name of marker)		(Description what the marker is for)
//	m_cpg_startloc			- Marks the player starting position. No enemies will spawn in 2 kilometer around that marker.
//	m_cpg_backupPosLand		- Marks backup position to spawn land units in case no safe random position could be found due to collision isues.
//	m_cpg_backupPosWater	- Marks backup position to spawn water units in case no safe random position could be found due to collision isues.
//	m_cpg_fort1				- Marks an area containing buildings that can be occupied by AI.
//	m_cpg_fort2				- Marks an area containing buildings that can be occupied by AI.
//	m_cpg_fort3				- Marks an area containing buildings that can be occupied by AI.
//	m_cpg_fortX				- Optional: More of such areas can be marked. Just make sure the number increments by 1 each time and you do not skip a number!
//
//
//	This script requires UPSMON. This script expects all UPSMON content to be located inside UPSMON's default folder:
//	- (mission root folder)\Scripts\
//	For example, "Init_UPSMON.sqf" should be located in:
//	- (mission root folder)\Scripts\Init_UPSMON.sqf
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if (isServer || !hasInterface) then {
	// Initialize functions and variables that are required to start the CPG.
	_availableSideMissions			= 15;		// Number of available side missions
	CPG_intelNo						= 0;		// Intel number to create markers (patrol are + enemy locations)
	CPG_patrolNo					= 0;		// Patrol number to create markers for UPSMON
	CPG_mainMissions_counter		= 0;		// Number of created main missions (Main HQ)
	CPG_sideMissions_counter		= 0;		// Number of created Side Missions
	CPG_backupPos					= [getmarkerPos "m_cpg_backupPosLand", getmarkerPos "m_cpg_backupPosWater"];
	CPG_patrolArea_positions		= [];		// Array contains the positions of all created Patrol Areas
	CPG_blacklist					= [];		// List with areas, where enemies will not spawn (e.g. base)
	CPG_blacklistSideMissions		= [];		// List with areas, where side missions will not spawn (e.g. close to other side missions)
	CPG_taskNames					= [];		// Used to store the task names
	CPG_forts						= [];		// List with all fort markers
	CPG_mapSize						= getNumber (configFile >> "CfgWorlds" >> worldName >> "mapSize");
	CPG_mapCenter					= [CPG_mapSize/2, CPG_mapSize/2, 0];
	CPG_missionCompleted			= false;

	// Determine the scale of the operation. Some Side-Missions will only spawn on "Large" scale.
	_playersWest = playersNumber west;

	CPG_scale = if (_playersWest > 20) then {
		"Large";
	} else {
		if (_playersWest > 10) then {
			"Medium";
		} else {
			"Small"
		};
	};

	// Patrol Generator: Number of patrol areas																Default:   1
	CPG_patrolArea_number			= ["PatrolArea_Number", 1] call BIS_fnc_getParamValue;
	// Patrol Generator: OPFOR Gear																			Default:   0 (Random)
	CPG_patrolArea_guerillas		= ["PatrolArea_Guerillas",1] call bis_fnc_getParamValue;
	if (CPG_patrolArea_guerillas == 0) then {
		CPG_patrolArea_guerillas	= [1,2] call bis_fnc_selectRandom;
	};
	// Patrol Generator: Show blue Patrol The Area marker?													Default:   1 (Yes)
	CPG_patrolArea_showMarker		= ["PatrolArea_ShowMarker", 1] call BIS_fnc_getParamValue;
	// Patrol Generator: Automatically scale the mission according to the number of players?				Default:   1 (Yes)
	CPG_patrolArea_AutoScale		= ["PatrolArea_AutoScale", 1] call BIS_fnc_getParamValue;
	// Patrol Generator: Probability to see enemy positions marked on the map								Default:  50%
	CPG_markerProb					= ["PatrolGenerator_MarkerProb", 50] call BIS_fnc_getParamValue;
	// Patrol Generator: Probability to know the unit type of marked enemies								Default:  50%
	CPG_markerTypeProb				= ["PatrolGenerator_MarkerTypeProb", 50] call BIS_fnc_getParamValue;
	// Patrol Generator: Probability factor for enemy vehicle appearance									Default:  10 (Normal)
	CPG_vehicleProb					= (["PatrolGenerator_VehicleProb", 10] call BIS_fnc_getParamValue) / 10;
	// Patrol Generator: Enemy mortars present in the normal troop mix										Default:   0 (No)
	CPG_mortars						= ["PatrolGenerator_Mortars", 0] call BIS_fnc_getParamValue;
	// Side Missions: Show Side Mission markers?															Default:   1 (Yes)
	CPG_sideMissions_showMarker		= ["SideMissions_ShowMarker", 1] call BIS_fnc_getParamValue;

	diag_log format ["CPG init.sqf: CPG_patrolArea_AutoScale = %1, CPG_scale = %2, _playersWest = %3", CPG_patrolArea_AutoScale, CPG_scale, _playersWest];
	// If auto-scale is disabled, use the mission parameters. Otherwise set the variables depending on the actual scale.
	if (CPG_patrolArea_AutoScale == 0) then {
		// Patrol Generator: Radius multiplication factor for the patrol area (Only on disabled auto-scale)		Default: 100
		CPG_patrolArea_radiusMulti		= (["PatrolArea_RadiusMulti", 100] call BIS_fnc_getParamValue) / 100;
		// Patrol Generator: Number of enemies around each patrol area (Only on disabled auto-scale)			Default: 125
		CPG_patrolArea_enemies			= (["PatrolArea_Enemies", 125] call BIS_fnc_getParamValue) + (floor(random 26));
		// Patrol Generator: Number of enemy air-ambushes (Only on disabled auto-scale)							Default:  10
		CPG_airAmbushes					= ["PatrolGenerator_AirAmbushes", 10] call BIS_fnc_getParamValue;
		// Side Missions: Minimum number of Side Missions (Only on disabled auto-scale)							Default:   6
		CPG_sideMissions_min			= ["SideMissions_Min", 6] call BIS_fnc_getParamValue;
		// Side Missions: Maximum number of Side Missions (Only on disabled auto-scale)							Default:   8
		CPG_sideMissions_max			= ["SideMissions_Max", 8] call BIS_fnc_getParamValue;
		// Side Missions: Radius multiplication factor for the Side Missions (Only on disabled auto-scale)		Default: 100
		CPG_sideMissions_radiusMulti	= (["SideMissions_RadiusMulti", 100] call BIS_fnc_getParamValue) / 100;
		// Maximum distance between the Airfield (Base) and the Main HQ
		CPG_mainHQ_maxDistance			= CPG_mapSize;
	} else {
		switch (CPG_scale) do {
			case "Small": {
				CPG_patrolArea_radiusMulti		= 0.75;
				CPG_patrolArea_enemies			= 50;
				CPG_airAmbushes					= 5;
				CPG_sideMissions_min			= 3;
				CPG_sideMissions_max			= 4;
				CPG_sideMissions_radiusMulti	= 0.75;
				CPG_mainHQ_maxDistance			= 5000;
			};
			case "Medium": {
				CPG_patrolArea_radiusMulti		= 1;
				CPG_patrolArea_enemies			= 100;
				CPG_airAmbushes					= 10;
				CPG_sideMissions_min			= 5;
				CPG_sideMissions_max			= 6;
				CPG_sideMissions_radiusMulti	= 1;
				CPG_mainHQ_maxDistance			= 8000;
			};
			case "Large": {
				CPG_patrolArea_radiusMulti		= 1;
				CPG_patrolArea_enemies			= 150;
				CPG_airAmbushes					= 15;
				CPG_sideMissions_min			= 7;
				CPG_sideMissions_max			= 8;
				CPG_sideMissions_radiusMulti	= 1;
				CPG_mainHQ_maxDistance			= CPG_mapSize;
			};
		};
	};
	// disables air ambushes for guerilla opfor
	if (CPG_patrolArea_guerillas == 2) then {
		CPG_airAmbushes	= 0;
	};

	// Find all fort marker placed on the map.
	for [{_i = 1}, {(getMarkerType (format["m_cpg_fort%1", _i])) != ""}, {_i = _i + 1}] do {
		CPG_forts pushBack format["m_cpg_fort%1", _i];
	};

	// Add onPlayerConnected event handler
	["CPG_updateJIPMarkersEH", "onPlayerConnected", CPG_fnc_updateJIPMarkers] call BIS_fnc_addStackedEventHandler;

	// Create blacklist zone around player starting position and the salt lake.
	[CPG_blacklist, getMarkerPos "m_cpg_startloc", 2000, 2000] call CPG_fnc_addToBlacklist;
	[CPG_blacklist, getMarkerPos "m_cpg_saltlake", 400, 600] call CPG_fnc_addToBlacklist;

	// Start populating.
	_cpgHandle = [] spawn CPG_fnc_startPopulating;
	waitUntil {sleep 10; scriptDone _cpgHandle;};

	// Create the Air Ambushes.
	for [{_i = 0}, { _i < CPG_airAmbushes}, {_i = _i + 1}] do {
		[_i] spawn CPG_fnc_createAirAmbush;
	};

	// Choose random value between CPG_sideMissions_min and CPG_sideMissions_max
	_sideMissions = CPG_sideMissions_min + floor(random((CPG_sideMissions_max - CPG_sideMissions_min) + 1));

	// Create Side Missions.
	while {CPG_sideMissions_counter < _sideMissions} do {
		// Randomly choose a side mission.
		[] spawn (missionNamespace getVariable format["CPG_fnc_SideMission_%1", floor (random _availableSideMissions)]);
		sleep 20;
	};

	// Wait until all tasks are completed
	waitUntil {
		sleep 10;
		// Copy the array before passing it to the function.
		_taskNames = +CPG_taskNames;
		_taskNames call SHK_Taskmaster_areCompleted;
	};

	CPG_missionCompleted = true;
	publicVariable "CPG_missionCompleted";
};