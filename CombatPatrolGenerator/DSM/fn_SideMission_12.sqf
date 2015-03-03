////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Tank
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_check","_counter","_equal1","_equal2","_mrkPos","_mrkPatrol","_mrk","_tank"];

// Only spawn this mission, if the scale of the operation is "Large"
if (CPG_scale == "Large") then {
	_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
	_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

	_check = [];
	_counter = 0;
	_equal1 = true;
	_equal2 = true;

	// We want to find a good position to create the tank, so we need the isFlatEmpty function to check if
	// the position found by BIS_fnc_findSafePos is a good one. If not, retry.
	while {(_equal1 || _equal2) && _counter < 10000} do {
		_missionPos = [_patrolAreaPos, (500*CPG_sideMissions_radiusMulti), (1500*CPG_sideMissions_radiusMulti), 10, 0, 0, 0, (CPG_blacklist + CPG_blacklistSideMissions), CPG_backupPos] call BIS_fnc_findSafePos;
		_check = _missionPos isFlatEmpty  [ 12, 1, 0.2, 20, 0, false, objNull];
		_counter = _counter + 1;
		_equal1 = [[], _check] call BIS_fnc_areEqual;
		_normal = surfaceNormal  _missionPos;
		if ((_normal select 2) > 0.985) then {
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

		_camoNet = createVehicle ["CamoNet_OPFOR_big_F", _missionPos, [], 0, "CAN_COLLIDE"];
		_camoNet setVectorUp (surfaceNormal _missionPos);
		_camoNet setDir 180;

		_tank = createVehicle ["O_MBT_02_cannon_F", _missionPos, [], 0, "NONE"];
		_tank setVehicleLock "LOCKED";

		// create tank group
		_groupTank = createGroup east;
		_ai = _groupTank createUnit ["O_crew_F", _missionPos, [], 0, "NONE"];
		_ai moveInDriver _tank;
		_ai = _groupTank createUnit ["O_crew_F", _missionPos, [], 0, "NONE"];
		_ai moveInTurret [_tank, [0,0]];
		_ai = _groupTank createUnit ["O_crew_F", _missionPos, [], 0, "NONE"];
		_ai moveInGunner _tank;
		_mrkPatrol = [_missionPos, [750, 750]] call CPG_fnc_createPatrolMarker;
		[leader _groupTank, _mrkPatrol, "nowp", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _groupTank);
		};

		// Create tower
		_towerClass = "Land_Cargo_Patrol_V1_F";
		if (CPG_patrolArea_guerillas == 2) then {
			_towerClass = "Land_Cargo_Patrol_V2_F";
		};
		_postower = [_missionPos, 50, 100, 10, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_tower = createVehicle [_towerClass, _postower, [], 0, "CAN_COLLIDE"];
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

		// Create cargo
		_containerClass = "Land_Cargo20_military_green_F";

		if (CPG_patrolArea_guerillas == 2) then {
			_containerClass = ["Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"] call bis_fnc_selectRandom;
		};

		_cargo = [_missionPos, 60, 70, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_container = createVehicle [_containerClass, _cargo, [], 0, "CAN_COLLIDE"];

		if (CPG_patrolArea_guerillas == 2) then {
			_containerClass = ["Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"] call bis_fnc_selectRandom;
		};

		_cargo = [_missionPos, 63, 70, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_container = createVehicle [_containerClass, _cargo, [], 0, "CAN_COLLIDE"];

		// Create barrels
		_barrel1 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) -20, (_missionPos select 1) - 1], [], 0, "CAN_COLLIDE"];
		_barrel2 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) - 21.5, (_missionPos select 1) - 1.5], [], 0, "CAN_COLLIDE"];
		_barrel3 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) - 21, (_missionPos select 1) - 0.5], [], 0, "CAN_COLLIDE"];
		_barrel4 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) - 20.5, (_missionPos select 1) - 2], [], 0, "CAN_COLLIDE"];
		_barrel5 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) -20, (_missionPos select 1) - 2.5], [], 0, "CAN_COLLIDE"];
		_barrel6 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) - 20.5, _missionPos select 1], [], 0, "CAN_COLLIDE"];
		_barrel7 = createVehicle ["Land_MetalBarrel_F", [(_missionPos select 0) - 20.5, _missionPos select 1], [], 0, "CAN_COLLIDE"];

		// Create vehicle parts
		_scrapPos = [_missionPos, 45, 55, 5, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_scrap = createVehicle ["Land_ScrapHeap_1_F", _scrapPos, [], 0, "CAN_COLLIDE"];
		_scrapPos = [_missionPos, 80, 140, 5, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_scrap = createVehicle ["Land_ScrapHeap_2_F", _scrapPos, [], 0, "CAN_COLLIDE"];

		// Create ammo box
		_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) - 20, (_missionPos select 1) + 1], [], 0, "CAN_COLLIDE"];
		_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
		clearMagazineCargoGlobal _ammo1;
		_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
		_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

		// create AA group
		_aaGroup1 = createGroup East;
		_aapos = [_missionPos, 100, 100, 20, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_ai = _aaGroup1 CreateUnit["O_Soldier_SL_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup1 CreateUnit["O_Soldier_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup1 CreateUnit["O_Soldier_AR_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup1 CreateUnit["O_Soldier_AA_F", _aapos, [], 0, "NONE"];
		[_ai] spawn CPG_fnc_rearmAA;
		_ai = _aaGroup1 CreateUnit["O_Soldier_AAA_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup1 CreateUnit["O_soldier_M_F", _aapos, [], 0, "NONE"];
		_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
		[leader _aaGroup1, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _aaGroup1);
		};

		// create AA group
		_aaGroup2 = createGroup East;
		_aapos = [_missionPos, 100, 100, 20, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_ai = _aaGroup2 CreateUnit["O_Soldier_SL_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup2 CreateUnit["O_Soldier_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup2 CreateUnit["O_Soldier_AR_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup2 CreateUnit["O_Soldier_AA_F", _aapos, [], 0, "NONE"];
		[_ai] spawn CPG_fnc_rearmAA;
		_ai = _aaGroup2 CreateUnit["O_Soldier_AAA_F", _aapos, [], 0, "NONE"];
		_ai = _aaGroup2 CreateUnit["O_soldier_M_F", _aapos, [], 0, "NONE"];
		_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
		[leader _aaGroup2, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _aaGroup2);
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
		[leader _grp, _mrkPatrol, "ONROAD", "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};

		// ----------------------------------------------------------------------------------------------------

		_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
		CPG_taskNames pushBack _taskName;
		_taskTitle = "Destroy Tank";
		_taskDesc = "Enemy forces have set up an FOB, supporting the activity of an armed Tank. This Tank could be manned, so practice extreme caution during the approach.<br/><br/>Destroy the armed Tank.";
		_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\Tank.jpg'/><br/><br/>";

		if (CPG_sideMissions_showMarker == 1) then {
			_mrkPos = getPos _tank;

			// create a task with destination
			[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

			// create marker
			_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "o_armor", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
		} else {
			// create a task without destination
			[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
		};

		message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\Tank.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
		%2", _taskTitle, _taskDesc];

		[message,"hintThis"] call BIS_fnc_MP;

		_updateCounter = 0;
		while { alive _tank } do {
			//  update the marker and refuel the tank every 2 minutes
			if (CPG_sideMissions_showMarker == 1 && _updateCounter >= 180) then {
				_updateCounter = 0;
				_mrk setMarkerPos (getPos _tank);
				_tank setFuel 1;
				_tank setVehicleAmmo 1;
			};

			_updateCounter = _updateCounter + 10;
			sleep 10;
		};

		[_taskName, "succeeded"] call SHK_Taskmaster_upd;

		if (CPG_sideMissions_showMarker == 1) then {
			_mrk setMarkerColor "ColorGreen";
			_mrk setMarkerText "Tank Destroyed";
		};

		message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
		<t align='center' size='2'>Objective</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
		The enemy attack Tank has been destroyed: this enormous threat to our operation has finally ceased to exist.<br/>
		Good job everyone.", _taskTitle];

		[message,"hintThis"] call BIS_fnc_MP;
	};
};