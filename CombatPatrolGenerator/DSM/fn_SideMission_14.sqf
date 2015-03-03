////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Long Range Comms Tower / Comms Tower
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_grpPos","_mrkPos","_mrkPatrol","_mrk","_comms"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_check = [];
_counter = 0;
_equal1 = true;
_equal2 = true;

// We want to find a good position to create the comms tower, so we need the isFlatEmpty function to check if
// the position found by BIS_fnc_findSafePos is a good one. If not, retry.
while {(_equal1 || _equal2) && _counter < 10000} do {
	_missionPos = [_patrolAreaPos, (500*CPG_sideMissions_radiusMulti), (1500*CPG_sideMissions_radiusMulti), 4, 0, 0, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
	_check = _missionPos isFlatEmpty [20, 1, 0.2, 15, 0, false, objNull];
	_counter = _counter + 1;
	_equal1 = [[], _check] call BIS_fnc_areEqual;
	_normal = surfaceNormal _missionPos;
	if ((_normal select 2) > 0.99) then	{
		_equal2 = false;
		// hint format ["%1", _normal];
	} else {
		_equal2 = true;
	};
};

// This is a safety measure: if after 10000 iterations of the previous code you still haven't found
// a suitable place, don't execute the mission itself.
if (_counter < 10000) then {
	CPG_sideMissions_counter = CPG_sideMissions_counter + 1;
	[CPG_blacklistSideMissions, _missionPos, 400, 400] call CPG_fnc_addToBlacklist;

	// IF LOWER THAN 50 - > LONG RANGE COMMS TOWER! ELSE COMMS TOWER
	if(random(100) < 50) then {
		_comms = createVehicle ["Land_TTowerBig_2_F", [(_missionPos select 0) + 5, _missionPos select 1], [], 0, "CAN_COLLIDE"];
		_comms setDir 90;

		_house = createVehicle ["Land_i_House_Small_03_V1_F", [(_missionPos select 0) +20, (_missionPos select 1)-0.5], [], 0, "CAN_COLLIDE"];
		_house setVectorUp (surfaceNormal _missionPos);
		_house setDir 270;

		_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) + 4, (_missionPos select 1) + 3], [], 0, "CAN_COLLIDE"];
		_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
		clearMagazineCargoGlobal _ammo1;
		_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
		_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "fortify", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
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
		_taskTitle = "Destroy Long Range Comms Tower";
		_taskDesc = "Enemy forces have a long range communication tower that they use to communicate outside of the island.<br/><br/>Destroy Long Range Comms Tower.";
		_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\LongRangeCommsTower.jpg'/><br/><br/>";

		if (CPG_sideMissions_showMarker == 1) then {
			_mrkPos = [_missionPos, 10, 100, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			// create a task with destination
			[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

			// create marker
			_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "loc_Transmitter", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
		} else {
			// create a task without destination
			[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
		};

		message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\LongRangeCommsTower.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>%2", _taskTitle, _taskDesc];

		[message,"hintThis"] call BIS_fnc_MP;

		waitUntil { sleep 10; !alive _comms };

		[_taskName, "succeeded"] call SHK_Taskmaster_upd;

		if (CPG_sideMissions_showMarker == 1) then {
			_mrk setMarkerColor "ColorGreen";
			_mrk setMarkerText "Long Range Comms Tower Destroyed";
		};

		message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
		The enemy comms tower has been destroyed: the enemy long range communication have been disrupted.<br/>
		Good job everyone.", _taskTitle];

		[message,"hintThis"] call BIS_fnc_MP;
	} else {
		_comms = createVehicle ["Land_Communication_F", _missionPos, [], 0, "CAN_COLLIDE"];
		_comms setVectorUp [0,0,1];

		_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [((_missionPos select 0) - 4), (_missionPos select 1)], [], 0, "CAN_COLLIDE"];
		_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
		clearMagazineCargoGlobal _ammo1;
		_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
		_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

		// create group
		_grpPos = [_missionPos, 20, 100, 5, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_grpPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_grpPos, [100, 100]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_grpPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_grpPos, [150, 150]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_grpPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_grpPos, [200, 200]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_grpPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		[_grpPos, 75, _grp, "ATVs", true] call CPG_fnc_spawnVehicles; // 75% chance to spawn armed ATV(s) for this group
		_mrkPatrol = [_grpPos, [250, 250]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// ----------------------------------------------------------------------------------------------------

		_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
		CPG_taskNames pushBack _taskName;
		_taskTitle = "Destroy Comms Tower";
		_taskDesc = "Enemy forces have set up a communications relay to support their operations.<br/><br/>Destroy the communications tower.";
		_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\CommsTower.jpg'/><br/><br/>";

		if (CPG_sideMissions_showMarker == 1) then {
			_mrkPos = [_missionPos, 10, 75, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			// create a task with destination
			[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

			// create marker
			_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "loc_Transmitter", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
		} else {
			// create a task without destination
			[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
		};

		message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\CommsTower.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
		%2", _taskTitle, _taskDesc];

		[message,"hintThis"] call BIS_fnc_MP;

		waitUntil { sleep 10; !alive _comms };

		[_taskName, "succeeded"] call SHK_Taskmaster_upd;

		if (CPG_sideMissions_showMarker == 1) then {
			_mrk setMarkerColor "ColorGreen";
			_mrk setMarkerText "Comms Tower Destroyed";
		};

		message = parseText format["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
		The enemy comms tower has been destroyed: enemy logistics and coordination have been thoroughly disrupted.<br/>
		Good job everyone.", _taskTitle];

		[message,"hintThis"] call BIS_fnc_MP;
	};
};