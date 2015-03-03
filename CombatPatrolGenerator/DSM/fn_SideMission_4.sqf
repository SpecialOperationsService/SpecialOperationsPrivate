////////////////////////////////////////////////////////////////////////////////////
////
////	Cache
////
////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_buildingPos","_mrkPos","_cachePos","_targets","_target","_posarray","_mrkPatrol","_mrk","_ammo1","_ammo2","_ammo3","_ammo4","_ammo5"];

_valid_buildings = ["Land_i_Barracks_V1_F", "Land_i_Barracks_V2_F", "Land_i_House_Big_01_V1_F", "Land_i_House_Big_02_V1_F", "Land_i_Stone_HouseBig_V1_F", "Land_MilOffices_V1_F", "Land_i_Shed_Ind_F"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_targets = nearestObjects [_patrolAreaPos, _valid_buildings, (1500*CPG_sideMissions_radiusMulti)];

// This is a safety measure: if no possible targets have been found,
// don't execute the mission itself.
if ((count _targets) > 0) then {
	CPG_sideMissions_counter = CPG_sideMissions_counter + 1;
	_target = _targets select (random ((count _targets) - 1));
	_missionPos = position _target;
	[CPG_blacklistSideMissions, _missionPos, 400, 400] call CPG_fnc_addToBlacklist;

	_counter = 0;
	_posarray = [];

	// as long as building position _counter not equal to "[0,0,0]" keep looping
	while {format ["%1", _target buildingPos _counter] != "[0,0,0]" } do {
		_posarray = _posarray + [_counter];	// add the index of the position to the list
		_counter = _counter + 1;			// increment counter
	};

	// shuffle
	for [{_x = 0},{_x < count (_posarray)},{_x = _x + 1}] do {
		_tempValue = _posarray select _x;
		_tempIndex = floor(random(count _posarray));
		_posarray set [_x, _posarray select _tempIndex];
		_posarray set [_tempIndex, _tempValue];
	};

	for "_i" from 0 to ((count _posarray) - 1) do {
		_cachePos = _target buildingPos (_posarray select _i);

		if (_i == 0) then {
			_ammo1 = createVehicle ["Box_East_AmmoOrd_F", _cachePos, [], 0, "CAN_COLLIDE"];
			_ammo1 setPos _cachePos;
			_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
			clearMagazineCargoGlobal _ammo1;
			_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
			_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		};

		if (_i == 1) then {
			_ammo2 = createVehicle ["Box_East_AmmoOrd_F", _cachePos, [], 0, "CAN_COLLIDE"];
			_ammo2 setPos _cachePos;
			_ammo2 addEventHandler ["killed", "_this select 1 addScore 3;"];
			clearMagazineCargoGlobal _ammo2;
			_ammo2 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
			_ammo2 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		};

		if (_i == 2) then {
			_ammo3 = createVehicle ["Box_East_AmmoOrd_F", _cachePos, [], 0, "CAN_COLLIDE"];
			_ammo3 setPos _cachePos;
			_ammo3 addEventHandler ["killed", "_this select 1 addScore 3;"];
			clearMagazineCargoGlobal _ammo3;
			_ammo3 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
			_ammo3 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		};

		if (_i == 3) then {
			_ammo4 = createVehicle ["Box_East_AmmoOrd_F", _cachePos, [], 0, "CAN_COLLIDE"];
			_ammo4 setPos _cachePos;
			_ammo4 addEventHandler ["killed", "_this select 1 addScore 3;"];
			clearMagazineCargoGlobal _ammo4;
			_ammo4 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
			_ammo4 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		};

		if (_i == 4) then {
			_ammo5 = createVehicle ["Box_East_AmmoOrd_F", _cachePos, [], 0, "CAN_COLLIDE"];
			_ammo5 setPos _cachePos;
			_ammo5 addEventHandler ["killed", "_this select 1 addScore 3;"];
			clearMagazineCargoGlobal _ammo5;
			_ammo5 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
			_ammo5 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		};
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "fortify", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _aaGroup);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "fortify", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _aaGroup);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _aaGroup);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [200, 200]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _aaGroup);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [250, 250]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _aaGroup);
	};

	// ----------------------------------------------------------------------------------------------------

	_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
	CPG_taskNames pushBack _taskName;
	_taskTitle = "Destroy Cache";
	_taskDesc = "Enemy forces have gathered weapons in an unknown location.<br/><br/>Find and destroy the weapons cache.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\Cache.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkPos = [_missionPos, 10, 150, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "mil_unknown", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\Cache.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil { sleep 5; !alive _ammo1 && !alive _ammo2 && !alive _ammo3 && !alive _ammo4 && !alive _ammo5 };

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	for "_i" from 0 to 10 do {
		_bomb = createVehicle ['R_60mm_HE', _missionPos, [], 0, 'NONE'];
		_bomb setVectorUp [0,0,-1];
		sleep (random 2);
	};

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "Cache Destroyed";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The enemy cache has been destroyed: taking out their weapons, they will have little to fight us with.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};