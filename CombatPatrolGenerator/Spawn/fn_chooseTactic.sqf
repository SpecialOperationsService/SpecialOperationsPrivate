/*
	Edited by Lux0r
*/


private ["_patrolArea_position","_pos","_grpCfg","_grp","_minePos","_mrkSize","_mrkPatrol","_behaviour","_fortPos","_fort","_vehPos","_veh","_tower","_ai"];

_patrolArea_position = [_this, 0, [0,0,0], [[]], [2, 3]] call BIS_fnc_param;


// Pick randomly one of the following enemy types.
switch (floor(random 10)) do {
	case 0:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Common) Enemy foot patrol
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		_pos = [_patrolArea_position, 0, (2000*CPG_patrolArea_radiusMulti), 4, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

		// run UPSMON
		_mrkSize	= [[300, 300], [400, 400], [500, 500]] call BIS_fnc_selectRandom;
		_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

		_behaviour = [
				["spawned"],
				["reinforcement", "spawned"],
				["onroad", "spawned"],
				["onroad", "reinforcement", "spawned"]] call BIS_fnc_selectRandom;
			([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

		// Create intel marker
		["o_inf", _pos, 300] call CPG_fnc_createIntelMarker;

		// AIGear
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};
	};
	case 1:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Common) Enemy patrol and watchtower
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		_pos = [_patrolArea_position, 0, (2000*CPG_patrolArea_radiusMulti), 4, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create tower
		_towerClass = if (CPG_patrolArea_guerillas == 2) then {
			"Land_Cargo_Patrol_V2_F";
		} else {
			"Land_Cargo_Patrol_V1_F";
		};
		_tower = createVehicle [_towerClass, _pos, [], 0, "CAN_COLLIDE"];
		_group_0 = createGroup east;
		_ai = _group_0 createUnit ["O_Soldier_F", _pos, [], 0, "CAN_COLLIDE"];
		_ai setPos (_tower buildingPos 1);
		_group_1 = createGroup east;
		_ai = _group_1 createUnit ["O_Soldier_F", _pos, [], 0, "CAN_COLLIDE"];
		_ai setPos (_tower buildingPos 0);

		// create group
		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		CPG_createdEnemies = CPG_createdEnemies + (count units _grp) + 2;

		// run UPSMON
		_mrkSize	= [[150, 150], [200, 200], [250, 250]] call BIS_fnc_selectRandom;
		_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "spawned"] execVM "scripts\UPSMON.sqf";

		// Create intel marker
		["o_inf", _pos, 300] call CPG_fnc_createIntelMarker;

		// AIGear
		if (CPG_patrolArea_guerillas == 2) then {
			{
				{
					_x spawn CEN_fnc_aiGear;
				} forEach (units _x);
			} forEach [_grp, _group_0, _group_1];
		};
	};
	case 2:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Common) Fortified enemies
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		_pos = [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 3, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

		// run UPSMON
		_mrkSize	= [[150, 150], [200, 200], [250, 250]] call BIS_fnc_selectRandom;
		_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "nofollow", "fortify", "noveh", "spawned"] execVM "scripts\UPSMON.sqf";

		// Create intel marker
		["o_inf", _pos, 300] call CPG_fnc_createIntelMarker;

		// AIGear
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};
	};
	case 3:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Common) Fortified enemies inside nearby buildings.
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		_pos		= [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 3, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
		_fort		= [CPG_forts, _pos] call BIS_fnc_nearestPosition;
		_fortPos	= [(getMarkerPos _fort), 0, 75, 3, 0, 1000, 0, [], CPG_backupPos] call BIS_fnc_findSafePos;

		_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
		_grp = [_fortPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
		CPG_createdEnemies = CPG_createdEnemies + (count units _grp);
		_mrkSize	= [[150, 150], [200, 200], [250, 250]] call BIS_fnc_selectRandom;
		_mrkPatrol	= [_fortPos, _mrkSize] call CPG_fnc_createPatrolMarker;
		[leader _grp, _mrkPatrol, "nofollow", "fortify", "noveh", "spawned"] execVM "scripts\UPSMON.sqf";

		// Create intel marker
		["o_inf", _pos, 150] call CPG_fnc_createIntelMarker;

		// AIGear
		if (CPG_patrolArea_guerillas == 2) then {
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _grp);
		};
	};
	case 4:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Uncommon) Enemy motorized patrol
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if ((random 100) < (50 * CPG_vehicleProb)) then {
			_pos = [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 3, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			_grpCfg	= ["Infantry"] call CPG_fnc_chooseGroupConfig;
			_grp	= [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
			[_pos, 100, _grp, "ATVs"] call CPG_fnc_spawnVehicles;	// Spawn ATV(s) for this group
			CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

			// run UPSMON
			_mrkSize	= [[400, 400], [500, 500], [600, 600]] call BIS_fnc_selectRandom;
			_mrkPatrol = [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

			_behaviour = [
				["spawned"],
				["reinforcement", "spawned"],
				["onroad", "spawned"],
				["onroad", "reinforcement", "spawned"]] call BIS_fnc_selectRandom;
			([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

			// Create intel marker
			["o_motor_inf", _pos, 300] call CPG_fnc_createIntelMarker;

			// AIGear
			if (CPG_patrolArea_guerillas == 2) then {
				{
					_x spawn CEN_fnc_aiGear;
				} forEach (units _grp);
			};
		};
	};
	case 5:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Rare) Enemy Quadbike patrols
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (floor(random 100) < (35 * CPG_vehicleProb)) then {
			_pos = [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 7, 0, 0.5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
			_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
			[_pos, 100, _grp, "Quadbikes"] call CPG_fnc_spawnVehicles;	// spawn quadbikes for this group
			CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

			// run UPSMON
			_mrkSize	= [[500, 500], [600, 600], [700, 700]] call BIS_fnc_selectRandom;
			_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

			_behaviour = [
				["spawned"],
				["reinforcement", "spawned"],
				["onroad", "spawned"],
				["onroad", "reinforcement", "spawned"]] call BIS_fnc_selectRandom;
			([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

			// Create intel marker
			["o_inf", _pos, 300] call CPG_fnc_createIntelMarker;

			// AIGear
			if (CPG_patrolArea_guerillas == 2) then {
				{
					_x spawn CEN_fnc_aiGear;
				} forEach (units _grp);
			};
		};
	};
	case 6:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Rare) Enemy mechanized section
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if ((random 100) < (35 * CPG_vehicleProb)) then {
			_pos = [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 4, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
			_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;

			_apc = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 0, "CAN_COLLIDE"];
			_apc setVehicleLock "LOCKED";
			_ai = _grp createUnit ["O_Soldier_lite_F", _pos, [], 0, "CAN_COLLIDE"];
			_ai assignAsGunner _apc;
			_ai moveInGunner _apc;
			_ai = _grp createUnit ["O_Soldier_lite_F", _pos, [], 0, "CAN_COLLIDE"];
			_ai assignAsDriver _apc;
			_ai moveInDriver _apc;

			// 30% chance to spawn MRAP
			if ((random 100) < 30) then	{
				_vehPos = [_pos, 0, 100, 4, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
				_veh = createVehicle ["O_MRAP_02_hmg_F", _vehPos, [], 0, "CAN_COLLIDE"];
				_ai = _grp createUnit ["O_Soldier_lite_F", _vehPos, [], 0, "CAN_COLLIDE"];
				_ai assignAsGunner _veh;
				_ai moveInGunner _veh;
				_ai = _grp createUnit ["O_Soldier_lite_F", _vehPos, [], 0, "CAN_COLLIDE"];
				_ai assignAsDriver _veh;
				_ai moveInDriver _veh;
			};

			CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

			// run UPSMON
			_mrkSize	= [[400, 400], [500, 500], [600, 600]] call BIS_fnc_selectRandom;
			_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

			_behaviour = [
				["spawned"],
				["reinforcement", "spawned"],
				["onroad", "spawned"],
				["onroad", "reinforcement", "spawned"]] call BIS_fnc_selectRandom;
			([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

			// Create intel marker
			["o_mech_inf", _pos, 300] call CPG_fnc_createIntelMarker;

			// AIGear
			if (CPG_patrolArea_guerillas == 2) then {
				{
					_x spawn CEN_fnc_aiGear;
				} forEach (units _grp);
			};
		};
	};
	case 7:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Rare) Mines / ambush point
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		// Chance to spawn a minefield on a road further away from the patrol marker. This minefield marks the ambush point.
		if (floor(random 100) < 35) then {
			_roads		= [];
			_positions	= [];
			_tmpnr		= 0;

			// Find roads for ambush
			while {((count _roads) < 1) and (_tmpnr < 100)} do {
				_pos = [_patrolArea_position, (1500*CPG_patrolArea_radiusMulti), (2000*CPG_patrolArea_radiusMulti), 5, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
				_roads = _pos nearRoads 300;
				_tmpnr = _tmpnr + 1;
			};

			if (count _roads > 0) then {
				_ambushPos = position (_roads call BIS_fnc_selectRandom);
				_roads = _ambushPos nearRoads 100;

				// Search positions for additional mines
				for [{_i = 0}, {_i < 2}, {_i = _i + 1}] do {
					if (count _roads > 0) then {
						// Chance to spawn minefield on the road closeby.
						if (floor(random 100) < 50) then {
							_road = _roads call BIS_fnc_selectRandom;
							_roads = _roads - [_road];	// remove this road, to prevent multiple selection
							_positions pushBack position _road;
						};
					};
				};

				// Spawn mine fields
				{
					_mineType = ["ATMine", "APERSBoundingMine"] call BIS_fnc_selectRandom;
					_count = 10 + floor(random(6)); // random number between 10 and 15

					 for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
						_minePos = [_x, 0, 5, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
						_mine = createMine [_mineType, _minePos, [], 0];
					};
					//["mil_warning", _x] call CPG_fnc_createIntelMarker;
				} forEach ([_ambushPos] + _positions);

				// Chance to spawn an ambush squad nearby.
				if (floor(random 100) < 90) then {
					_overwatchPos = [_ambushPos, 250, 25, 20] call BIS_fnc_findOverwatch;
					_pos = [_overwatchPos, 0, 15, 2, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
					_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
					_dir = [_pos, _ambushPos] call BIS_fnc_dirTo;
					_grp = [_pos, east, _grpCfg, [], [], [0.45,0.9], [], [], _dir] call BIS_fnc_spawnGroup;
					CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

					// run UPSMON
					_mrkSize	= [[200, 200], [250, 250], [300, 300]] call BIS_fnc_selectRandom;
					_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;
					[leader _grp, _mrkPatrol, "ambush2", "spawned"] execVM "scripts\UPSMON.sqf";

					// AIGear
					if (CPG_patrolArea_guerillas == 2) then {
						{
							_x spawn CEN_fnc_aiGear;
						} forEach (units _grp);
					};
				};
			};
		};
	};
	case 8:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Special) Enemy sniper-spotter team
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if ((random 100) < 10) then {
			_pos = [_patrolArea_position, 0, (2000*CPG_patrolArea_radiusMulti), 4, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

			_grp = createGroup east;
			_ai = _grp createUnit ["O_sniper_F", _pos, [], 0, "CAN_COLLIDE"];
			_ai = _grp createUnit ["O_spotter_F", _pos, [], 0, "CAN_COLLIDE"];
			CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

			// run UPSMON
			_mrkSize	= [[300, 300], [400, 400], [500, 500]] call BIS_fnc_selectRandom;
			_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

			_behaviour = [
				["ambush2", "spawned"],
				["ambush2", "reinforcement", "spawned"]] call BIS_fnc_selectRandom;
			([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

			// Create intel marker
			["o_recon", _pos, 300] call CPG_fnc_createIntelMarker;

			// AIGear
			if (CPG_patrolArea_guerillas == 2) then {
				{
					_x spawn CEN_fnc_aiGear;
				} forEach (units _grp);
			};
		};
	};
	case 9:	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////
		////	(Special) Enemy mortar team
		////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (CPG_mortars == 1) then {
			if ((random 100) < 10) then {
				_pos = [_patrolArea_position, 0, (1500*CPG_patrolArea_radiusMulti), 4, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

				_mortar = createVehicle ["O_Mortar_01_F", _pos, [], 0, "CAN_COLLIDE"];
				_mortar setVehicleLock "LOCKED";
				_grp = createGroup east;
				_gunner = _grp createUnit ["O_Soldier_F", _pos, [], 0, "CAN_COLLIDE"];
				_gunner moveInGunner _mortar;
				_ai = _grp createUnit ["O_Soldier_TL_F", _pos, [], 0, "CAN_COLLIDE"];
				_ai = _grp createUnit ["O_Soldier_F", _pos, [], 0, "CAN_COLLIDE"];
				_ai = _grp createUnit ["O_Soldier_GL_F", _pos, [], 0, "CAN_COLLIDE"];
				CPG_createdEnemies = CPG_createdEnemies + (count units _grp);

				// run UPSMON
				_mrkSize	= [[150, 150], [200, 200], [250, 250]] call BIS_fnc_selectRandom;
				_mrkPatrol	= [_pos, _mrkSize] call CPG_fnc_createPatrolMarker;

				_behaviour = [
					["spawned"],
					["nomove", "spawned"]
				] call BIS_fnc_selectRandom;
				([leader _grp, _mrkPatrol] + _behaviour) execVM "scripts\UPSMON.sqf";

				// Create intel marker
				["o_mortar", _pos, 200] call CPG_fnc_createIntelMarker;

				// AIGear
				if (CPG_patrolArea_guerillas == 2) then {
					{
						_x spawn CEN_fnc_aiGear;
					} forEach (units _grp);
				};
			};
		};
	};
};