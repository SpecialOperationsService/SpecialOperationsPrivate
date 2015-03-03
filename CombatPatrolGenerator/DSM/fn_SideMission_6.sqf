////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Armed Chopper (PO-30 Orca/Mi-48 Kajman)
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_mrkPos","_barrier1","_barrier2","_barrier3","_barrier4","_barrel1","_mrkPatrol","_mrk","_chopper","_chopperType"];

// Only spawn this mission, if the scale of the operation is "Large"
if (CPG_scale == "Large") then {
	_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
	_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

	_check = [];
	_counter = 0;
	_equal1 = true;
	_equal2 = true;

	// We want to find a good position to create the armed chopper, so we need the isFlatEmpty function to check if
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

		_barrier1 = createVehicle ["Land_HBarrier_5_F", [(_missionPos select 0) + 8, _missionPos select 1], [], 0, "CAN_COLLIDE"];
		_barrier1 setVectorUp (surfaceNormal _missionPos);
		_barrier1 setDir 90;
		_barrier2 = createVehicle ["Land_HBarrier_5_F", [(_missionPos select 0) - 10, _missionPos select 1], [], 0, "CAN_COLLIDE"];
		_barrier2 setVectorUp (surfaceNormal _missionPos);
		_barrier2 setDir 270;
		_barrier3 = createVehicle ["Land_HBarrier_5_F", [_missionPos select 0, (_missionPos select 1) + 10], [], 0, "CAN_COLLIDE"];
		_barrier3 setVectorUp (surfaceNormal _missionPos);
		_barrier4 = createVehicle ["Land_HBarrier_5_F", [_missionPos select 0, (_missionPos select 1) - 10], [], 0, "CAN_COLLIDE"];
		_barrier4 setVectorUp (surfaceNormal _missionPos);

		_helipad = createVehicle ["Land_HelipadSquare_F", _missionPos, [], 0, "CAN_COLLIDE"];

		if ((random 100) < 50) then	{
			_chopper		= createVehicle ["O_Heli_Light_02_F", _missionPos, [], 0, "NONE"];
			_chopperType	= "Orca";
		} else {
			_chopper		= createVehicle ["O_Heli_Attack_02_F", _missionPos, [], 0, "NONE"];
			_chopperType	= "Kajman";
		};

		_chopper setVehicleLock "LOCKED";

		// create group
		_chopperGroup = createGroup east;
		_ai = _chopperGroup createUnit ["O_helipilot_F", _missionPos, [], 0, "NONE"];
		_ai moveInDriver _chopper;
		_ai = _chopperGroup createUnit ["O_helipilot_F", _missionPos, [], 0, "NONE"];
		_ai moveInTurret [_chopper, [0]];
		_mrkPatrol = [_missionPos, [750, 750]] call CPG_fnc_createPatrolMarker;
		[leader _chopperGroup, _mrkPatrol, "nowp", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _chopperGroup);
		};

		_barrel1 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) + 2, (_missionPos select 1) + 8.5], [], 0, "CAN_COLLIDE"];
		_barrel1 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) + 8.5, (_missionPos select 1) + 2], [], 0, "CAN_COLLIDE"];
		_barrel1 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) + 8.5, (_missionPos select 1) + 3], [], 0, "CAN_COLLIDE"];
		_barrel1 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) + 8.5, (_missionPos select 1) - 1], [], 0, "CAN_COLLIDE"];

		_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) + 4, (_missionPos select 1) + 8.5], [], 0, "CAN_COLLIDE"];
		_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
		clearMagazineCargoGlobal _ammo1;
		_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
		_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [200, 200]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		_mrkPatrol = [_missionPos, [250, 250]] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";

		// ----------------------------------------------------------------------------------------------------

		_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
		CPG_taskNames pushBack _taskName;
		_taskTitle = format ["Destroy Helicopter (%1)", _chopperType];
		_taskDesc = "Enemy forces have set up an FOB, supporting the activity of an armed helicopter. This helicopter could be manned, so practice extreme caution during the approach.<br/><br/>Destroy the armed helicopter.";
		_taskImage = format ["<img image='CombatPatrolGenerator\DSM\pix\%1.jpg'/><br/><br/>", _chopperType];

		if (CPG_sideMissions_showMarker == 1) then {
			_mrkPos = getPos _chopper;

			// create a task with destination
			[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

			// create marker
			_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "o_air", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
		} else {
			// create a task without destination
			[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
		};

		message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\%1.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%2</t><br/><br/>
		<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
		%3", _chopperType, _taskTitle, _taskDesc];

		[message,"hintThis"] call BIS_fnc_MP;

		while {alive _chopper} do {
			_chopper setFuel 1;

			if (CPG_sideMissions_showMarker == 1) then {
				_mrk setMarkerPos (getPos _chopper);
			};
			sleep 10;
		};

		[_taskName, "succeeded"] call SHK_Taskmaster_upd;

		if (CPG_sideMissions_showMarker == 1) then {
			_mrk setMarkerColor "ColorGreen";
			_mrk setMarkerText "Helicopter Destroyed";
		};

		message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
		The enemy attack helicopter has been destroyed: this enormous threat to our operation has finally ceased to exist.<br/>
		Good job everyone.", _taskTitle];

		[message,"hintThis"] call BIS_fnc_MP;
	};
};