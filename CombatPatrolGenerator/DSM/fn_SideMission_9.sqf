////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Anti-Air Units
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_missionPos","_normal","_barrier1","_barrier2","_barrier3","_barrier4","_mrkPos","_mrkPatrol","_mrk","_counter"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_check = [];
_counter = 0;
_equal1 = true;
_equal2 = true;

// We want to find a good position to create the AA units, so we need the isFlatEmpty function to check if
// the position found by BIS_fnc_findSafePos is a good one. If not, retry.
while {(_equal1 || _equal2) && _counter < 10000} do {
	_missionPos = [_patrolAreaPos, (500*CPG_sideMissions_radiusMulti), (1500*CPG_sideMissions_radiusMulti), 4, 0, 0, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
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

	_barrier1 = createVehicle ["Land_HBarrier_5_F", [(_missionPos select 0) + 5, _missionPos select 1], [], 0, "CAN_COLLIDE"];
	_barrier1 setVectorUp (surfaceNormal _missionPos);
	_barrier1 setDir 90;
	_barrier2 = createVehicle ["Land_HBarrier_5_F", [(_missionPos select 0) - 5, _missionPos select 1], [], 0, "CAN_COLLIDE"];
	_barrier2 setVectorUp (surfaceNormal _missionPos);
	_barrier2 setDir 270;
	_barrier3 = createVehicle ["Land_HBarrier_5_F", [_missionPos select 0, (_missionPos select 1) + 5], [], 0, "CAN_COLLIDE"];
	_barrier3 setVectorUp (surfaceNormal _missionPos);
	_barrier4 = createVehicle ["Land_HBarrier_5_F", [_missionPos select 0, (_missionPos select 1) - 5], [], 0, "CAN_COLLIDE"];
	_barrier4 setVectorUp (surfaceNormal _missionPos);

	// create AA group
	_grp	= createGroup east;
	_leader	= _grp createUnit ["O_Soldier_SL_F", _missionPos, [], 0, "NONE"];
	_air1	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_air2	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_air3	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_rifle1	= _grp createUnit ["O_Soldier_F", _missionPos, [], 0, "NONE"];
	_rifle2	= _grp createUnit ["O_Soldier_F", _missionPos, [], 0, "NONE"];
	_mg		= _grp createUnit ["O_Soldier_AR_F", _missionPos, [], 0, "NONE"];
	_medic	= _grp createUnit ["O_medic_F", _missionPos, [], 0, "NONE"];
	{[_x] spawn CPG_fnc_rearmAA;} forEach (units _grp);
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create AA group
	_grp	= createGroup east;
	_leader	= _grp createUnit ["O_Soldier_SL_F", _missionPos, [], 0, "NONE"];
	_air4	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_air5	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_air6	= _grp createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "NONE"];
	_rifle1	= _grp createUnit ["O_Soldier_F", _missionPos, [], 0, "NONE"];
	_rifle2	= _grp createUnit ["O_Soldier_F", _missionPos, [], 0, "NONE"];
	_mg		= _grp createUnit ["O_Soldier_AR_F", _missionPos, [], 0, "NONE"];
	_medic	= _grp createUnit ["O_medic_F", _missionPos, [], 0, "NONE"];
	{[_x] spawn CPG_fnc_rearmAA;} forEach (units _grp);
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
	_taskTitle = "Neutralize AA Site";
	_taskDesc = "Enemy forces have set up a small AA Site, denying us the possibility of air operations in that area.<br/><br/>Suppress the AA Site by eliminating the AA operators.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\AAUnits.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkPos = [_missionPos, 10, 100, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "o_support", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\AAUnits.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>Suppress AA Site</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil {sleep 5; !alive _air1 && !alive _air2 && !alive _air3 && !alive _air4 && !alive _air5 && !alive _air6};

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "AA Site Neutralized";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The enemy AA Site has been neutralized: our air operations in the area can now be restored.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};