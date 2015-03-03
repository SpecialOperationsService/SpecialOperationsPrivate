////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Enemy HQ
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_mrkPos","_mrkPatrol","_mrk","_hq"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_check = [];
_counter = 0;
_equal1 = true;
_equal2 = true;

// We want to find a good position to create the HQ, so we need the isFlatEmpty function to check if
// the position found by BIS_fnc_findSafePos is a good one. If not, retry.
while {(_equal1 || _equal2) && _counter < 10000} do {
	_missionPos = [_patrolAreaPos, (1000*CPG_sideMissions_radiusMulti), (1500*CPG_sideMissions_radiusMulti), 4, 0, 0, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
	_check = _missionPos isFlatEmpty  [ 12, 1, 0.2, 15, 0, false, objNull];
	_counter = _counter + 1;
	_equal1 = [[], _check] call BIS_fnc_areEqual;
	_normal = surfaceNormal  _missionPos;
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

	_hqClass = "Land_Cargo_HQ_V1_F";

	if (CPG_patrolArea_guerillas == 2) then {
		_hqClass = "Land_Cargo_HQ_V2_F";
	};

	_hq = createVehicle [_hqClass, _missionPos, [], 0, "CAN_COLLIDE"];

	_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) + 12, (_missionPos select 1)], [], 0, "CAN_COLLIDE"];
	_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
	clearMagazineCargoGlobal _ammo1;
	_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 0);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_0);
	};

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_TL_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 1);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_1);
	};

	_group_2 = createGroup east;
	_ai = _group_2 createUnit ["O_Soldier_lite_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 2);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_2);
	};

	_group_3 = createGroup east;
	_ai = _group_3 createUnit ["O_Soldier_AR_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 3);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_3);
	};

	_group_4 = createGroup east;
	_ai = _group_4 createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 4);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_4);
	};

	_group_5 = createGroup east;
	_ai = _group_5 createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 5);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_5);
	};

	_group_6 = createGroup east;
	_ai = _group_6 createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_hq buildingPos 6);
	[_ai] spawn CPG_fnc_rearmAA;
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_6);
	};

	// create AA group
	_aaGroup = createGroup East;
	_aapos = [_missionPos, 100, 100, 20, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_ai = _aaGroup CreateUnit["O_Soldier_SL_F", _aapos, [], 0, "NONE"];
	_ai = _aaGroup CreateUnit["O_Soldier_F", _aapos, [], 0, "NONE"];
	_ai = _aaGroup CreateUnit["O_Soldier_AR_F", _aapos, [], 0, "NONE"];
	_ai = _aaGroup CreateUnit["O_Soldier_AA_F", _aapos, [], 0, "NONE"];
	[_ai] spawn CPG_fnc_rearmAA;
	_ai = _aaGroup CreateUnit["O_Soldier_AAA_F", _aapos, [], 0, "NONE"];
	_ai = _aaGroup CreateUnit["O_soldier_M_F", _aapos, [], 0, "NONE"];
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _aaGroup, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
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
	_taskTitle = "Destroy HQ";
	_taskDesc = "The enemy has set up a small headquarters building, in order to command their forces in the area.<br/><br/>Destroy the enemy HQ.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\HQ.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkPos = [_missionPos, 10, 100, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "o_hq", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\HQ.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil { sleep 5; !alive _hq };

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "HQ Destroyed";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>Destroy HQ</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The enemy headquarters have been destroyed: the enemy chain of command has been severed.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};