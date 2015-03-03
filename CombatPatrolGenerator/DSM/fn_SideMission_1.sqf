////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Checkpoint
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_mrkPos","_barGate","_tower","_mrkPatrol","_mrk"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_ambush = [];
_roads = [];
_counter = 0;

while {((count _roads) < 1) and (_counter < 100)} do {
	_ambush = [_patrolAreaPos, (1500*CPG_sideMissions_radiusMulti), (2000*CPG_sideMissions_radiusMulti), 5, 0, 1000, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
	_roads = _ambush nearRoads 300;
	_counter = _counter + 1;
};

// This is a safety measure: if no roads have been found, don't execute the mission itself.
if ((count _roads) >= 1) then {
	CPG_sideMissions_counter = CPG_sideMissions_counter + 1;
	_missionPos = position (_roads call BIS_fnc_selectRandom);
	[CPG_blacklistSideMissions, _missionPos, 400, 400] call CPG_fnc_addToBlacklist;

	_nearRoads = _missionPos nearRoads 10;
	_road = _nearRoads select 0;
	_roadConnectedTo = roadsConnectedTo _road;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;

	_barrierPos = [((_missionPos select 0) - (cos(_direction) * 8)), ((_missionPos select 1) + (sin(_direction) * 8)), 0];
	_barrier = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "NONE"];
	_barrier setVectorUp (surfaceNormal _barrierPos);
	_barrier setDir (_direction + 90);

	_barGate = createVehicle ["Land_BarGate_F", _missionPos, [], 0, "NONE"];
	_barGate setDir (_direction);

	_posammo = [((_missionPos select 0) - (cos(_direction) * 10)), ((_missionPos select 1) + (sin(_direction) * 10)), 0];
	_ammo1 = createVehicle ["Box_East_AmmoOrd_F", _posammo, [], 0, "NONE"];
	_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
	clearMagazineCargoGlobal _ammo1;
	_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];


	_towerClass = "Land_Cargo_Patrol_V1_F";

	if (CPG_patrolArea_guerillas == 2) then {
		_towerClass = "Land_Cargo_Patrol_V2_F";
	};

	_postower = [_missionPos, 15, 30, 4, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_tower = createVehicle [_towerClass, _postower, [], 0, "CAN_COLLIDE"];

	_count = 0;
	while {isOnRoad _tower && _count < 1000} do {
		_tower2 = _tower;
		_tower setPosATL [(getPosATL _tower2 select 0) + 10 - random 20, (getPosATL _tower2 select 1) + 10 - random 20, 0.01];
		_count = _count + 1;
	};

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _postower, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 1);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_0);
	};

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_F", _postower, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 0);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_1);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "ONROAD", "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [200, 200]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [250, 250]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// ----------------------------------------------------------------------------------------------------

	_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
	CPG_taskNames pushBack _taskName;
	_taskTitle = "Destroy Checkpoint";
	_taskDesc = "Enemy forces have set up a checkpoint aiming at controlling this island's roads and communications.<br/><br/>Destroy the checkpoint and any fortification.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\Checkpoint.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkroads = _missionPos nearRoads 100;
		_mrkPos = position (_mrkroads call BIS_fnc_selectRandom);

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "mil_destroy", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\Checkpoint.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil { sleep 5; !alive _barGate && !alive _tower };

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "Checkpoint Destroyed";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The enemy checkpoint has been destroyed: the enemy plan of territorial control has been halted.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};