////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Investigate War Crimes
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_grpPos","_mrkPos","_mrkPatrol","_mrk"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_check = [];
_counter = 0;
_equal1 = true;
_equal2 = true;
_roads= [];

// We want to find a good position to create the war crimes, so we need the isFlatEmpty function to check if
// the position found by BIS_fnc_findSafePos is a good one. If not, retry.
while { (_equal1 || _equal2) && _counter < 10000} do {
	_missionPos = [_patrolAreaPos, (1000*CPG_sideMissions_radiusMulti), (2000*CPG_sideMissions_radiusMulti), 10, 0, 0, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
	_check = _missionPos isFlatEmpty  [ 12, 1, 0.1, 25, 0, false, objNull];
	_counter = _counter + 1;
	_equal1 = [[], _check] call BIS_fnc_areEqual;
	_normal = surfaceNormal  _missionPos;

	if ((_normal select 2) > 0.985) then {
		_equal2 = false;
		// hint format ["%1", _normal];
		//_roads = _missionPos nearRoads 200;
	} else {
		_equal2 = true;
	};
};

// This is a safety measure: if after 10000 iterations of the previous code you still haven't found
// a suitable place, don't execute the mission itself.
if (_counter < 10000) then {
	CPG_sideMissions_counter = CPG_sideMissions_counter + 1;
	[CPG_blacklistSideMissions, _missionPos, 400, 400] call CPG_fnc_addToBlacklist;

	_dirtPos = [(_missionPos select 0) + 8.5, _missionPos select 1];
	_dirt1 = createVehicle ["Dirthump_2_F", _dirtPos, [], 0, "CAN_COLLIDE"];
	_dirt1 setVectorUp (surfaceNormal _dirtPos);
	_dirt1 setDir 90;
	_dirtPos = [(_missionPos select 0) - 8.5, _missionPos select 1];
	_dirt2 = createVehicle ["Dirthump_2_F", _dirtPos, [], 0, "CAN_COLLIDE"];
	_dirt2 setVectorUp (surfaceNormal _dirtPos);
	_dirt2 setDir 270;
	_dirtPos = [_missionPos select 0, (_missionPos select 1) + 8.5];
	_dirt3 = createVehicle ["Dirthump_2_F", _dirtPos, [], 0, "CAN_COLLIDE"];
	_dirt3 setVectorUp (surfaceNormal _dirtPos);
	_dirtPos = [_missionPos select 0, (_missionPos select 1) - 8.5];
	_dirt4 = createVehicle ["Dirthump_2_F", _dirtPos, [], 0, "CAN_COLLIDE"];
	_dirt4 setVectorUp (surfaceNormal _dirtPos);

	_skeleton = createVehicle ["Land_HumanSkull_F", [(_missionPos select 0) + 3, (_missionPos select 1) - 2.5], [], 0, "CAN_COLLIDE"];
	_skeleton = createVehicle ["Land_HumanSkull_F", [(_missionPos select 0) + 1, (_missionPos select 1) - 2], [], 0, "CAN_COLLIDE"];
	_skeleton = createVehicle ["Land_HumanSkeleton_F", [(_missionPos select 0) + 2, (_missionPos select 1) + 3], [], 0, "CAN_COLLIDE"];
	_skeleton = createVehicle ["Land_HumanSkeleton_F", [(_missionPos select 0) + 2, (_missionPos select 1) + 2], [], 0, "CAN_COLLIDE"];
	_skeleton = createVehicle ["Land_HumanSkeleton_F", [(_missionPos select 0) - 4, (_missionPos select 1) + 4], [], 0, "CAN_COLLIDE"];

	_grpCiv = createGroup civilian;

	for "_i" from 0 to 14 do {
		_posciv = [((_missionPos select 0) - 7 + (random 14)), ((_missionPos select 1) - 7 + (random 14)), 0];

		_civ = switch (floor (random 7)) do {
			case 0:	{_grpCiv createUnit ["C_man_1", _posciv, [], 0, "CAN_COLLIDE"];};
			case 1:	{_grpCiv createUnit ["C_man_polo_1_F", _posciv, [], 0, "CAN_COLLIDE"];};
			case 2:	{_grpCiv createUnit ["C_man_polo_2_F", _posciv, [], 0, "CAN_COLLIDE"];};
			case 3:	{_grpCiv createUnit ["C_man_polo_3_F", _posciv, [], 0, "CAN_COLLIDE"];};
			case 4:	{_grpCiv createUnit ["C_man_polo_4_F", _posciv, [], 0, "CAN_COLLIDE"];};
			case 5:	{_grpCiv createUnit ["C_man_polo_5_F", _posciv, [], 0, "CAN_COLLIDE"];};
			case 6:	{_grpCiv createUnit ["C_man_polo_6_F", _posciv, [], 0, "CAN_COLLIDE"];};
		};

		_civ setDir (random 360);
		_civ setDamage 1;
	};
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grpCiv);
	};

	// create group
	_grpPos = [_missionPos, 0, 30, 4, 0, 0, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_grp = createGroup east;
	_leader = _grp createUnit ["O_recon_TL_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_M_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_LAT_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_JTAC_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_Medic_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpPos = [_missionPos, 0, 100, 4, 0, 0, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_grp = createGroup east;
	_leader = _grp createUnit ["O_recon_TL_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_M_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_LAT_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_JTAC_F", _grpPos, [], 0, "CAN_COLLIDE"];
	_ai = _grp createUnit ["O_recon_Medic_F", _grpPos, [], 0, "CAN_COLLIDE"];
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
	_taskTitle = "Investigate War Crimes";
	_taskDesc = "We have intel of ongoing war crimes in our area, by hands of the enemy. Recon the area and check these reports.<br/><br/>Find evidence of war crimes.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\WarCrimes.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkPos = [_missionPos, 10, 100, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "o_recon", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\WarCrimes.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil {sleep 5; ([_missionPos, 25, "count", false, false, [west]] call SOS_fnc_nearestPlayers) > 0};

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "War Crimes Found";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The evidence has been found: the population will know about these crimes, enhancing their support towards our operation.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};