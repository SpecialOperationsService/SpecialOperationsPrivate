////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////	Main HQ with armed chopper or APC, plus watchtowers
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private["_positions","_blacklist","_startloc","_distance","_pos","_missionPos","_patrolArea_position","_grpPos","_overwatchPos","_mrkPos","_barrel1","_mrkPatrol","_mrk","_veh"];

_positions	= [];
_blacklist	= [];

// Create blacklist zone around player starting position.
_startloc = getMarkerPos "m_cpg_startloc";
_distance = 1000 + (2000 * CPG_patrolArea_radiusMulti);
[_blacklist, _startloc, _distance, _distance] call CPG_fnc_addToBlacklist;

// Iterate over 4 positions, marking the centre of each map quarter.
{
	//_mrk = [format ["m_quarter_%1",_forEachIndex], _x, "hd_objective", "ColorYellow"] call CPG_fnc_createMarker;

	// Find 10 possible locations for the Main HQ in this part of the map.
	_i = 0;
	while {_i < 10} do {
		_pos = [_x, 0, (CPG_mapSize/4), 20, 0, 0.5, 0, (CPG_blacklist + _blacklist), CPG_backupPos] call BIS_fnc_findSafePos;

		// Check if the distance from the position to the start location (base) is less than the max distance determined by the scale of the operation.
		if (_pos distance _startloc < CPG_mainHQ_maxDistance) then {
			_i = _i + 1;
			_positions pushBack _pos;
			//_mrk = [format ["m_position_%1%2", _forEachIndex, _i], _pos, "hd_unknown", "ColorOrange"] call CPG_fnc_createMarker;
		};
	};
} forEach [	[CPG_mapSize*0.25, CPG_mapSize*0.75, 0],
			[CPG_mapSize*0.75, CPG_mapSize*0.75, 0],
			[CPG_mapSize*0.25, CPG_mapSize*0.25, 0],
			[CPG_mapSize*0.75, CPG_mapSize*0.25, 0] ];

_missionPos = _positions call BIS_fnc_selectRandom;
CPG_mainMissions_counter = CPG_mainMissions_counter + 1;
_patrolArea_position = [_missionPos, 300, 500 , 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
CPG_patrolArea_positions pushBack _patrolArea_position;

// Cargo HQ
_cargoHqClass = if (CPG_patrolArea_guerillas == 2) then {
	"Land_Cargo_HQ_V2_F";
} else {
	"Land_Cargo_HQ_V1_F";
};

_cargoHq = createVehicle [_cargoHqClass, [_missionPos select 0, (_missionPos select 1) + 7], [], 0, "CAN_COLLIDE"];

// create group for cargo HQ
_cargoHqGroup = createGroup east;
_ai = _cargoHqGroup createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 0);
doStop _ai;
_ai = _cargoHqGroup createUnit ["O_Soldier_TL_F", _missionPos, [], 0, "CAN_COLLIDE"];
_cargoHqGroup selectLeader _ai;
_ai setPos (_cargoHq buildingPos 1);
doStop _ai;
_ai = _cargoHqGroup createUnit ["O_Officer_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 2);
doStop _ai;
_ai = _cargoHqGroup createUnit ["O_Soldier_AR_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 3);
doStop _ai;
_ai = _cargoHqGroup createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 4);
doStop _ai;
_ai = _cargoHqGroup createUnit ["O_Soldier_AA_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 5);
doStop _ai;
[_ai] spawn CPG_fnc_rearmAA;
_ai = _cargoHqGroup createUnit ["O_Soldier_F", _missionPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoHq buildingPos 6);
doStop _ai;
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _cargoHqGroup);
};

// Cargo tower
_cargoTowerPos = [(_missionPos select 0) - 30, (_missionPos select 1) - 30];

_cargoHqClass = if (CPG_patrolArea_guerillas == 2) then {
	"Land_Cargo_Tower_V2_F";
} else {
	"Land_Cargo_Tower_V1_F";
};

_cargoTower = createVehicle [_cargoHqClass, _cargoTowerPos, [], 0, "CAN_COLLIDE"];

// create group for cargo tower
_cargoTowerGroup = createGroup East;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_AR_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 0);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 1);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 2);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_AR_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 3);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 4);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 5);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_AR_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 6);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 7);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 8);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_AR_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 9);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_medic_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 10);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_SL_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_cargoTowerGroup selectLeader _ai;
_ai setPos (_cargoTower buildingPos 11);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_02_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 12);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_Soldier_AR_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 13);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_sniper_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 14);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_medic_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 15);
doStop _ai;
_ai = _cargoTowerGroup CreateUnit["O_spotter_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 16);
doStop _ai;
_ai = _cargoTowerGroup createUnit ["O_Soldier_AA_F", _cargoTowerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_cargoTower buildingPos 17);
doStop _ai;
[_ai] spawn CPG_fnc_rearmAA;
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _cargoTowerGroup);
};

// Barriers
_barrierPos = [(_missionPos select 0) + 18, (_missionPos select 1) + 8];
_barrier1 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier1 setVectorUp (surfaceNormal _barrierPos);
_barrier1 setDir 90;

_barrierPos = [(_missionPos select 0) + 18, (_missionPos select 1) - 4];
_barrier2 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier2 setVectorUp (surfaceNormal _barrierPos);
_barrier2 setDir 90;

_barrierPos = [(_missionPos select 0) - 16, (_missionPos select 1) + 10];
_barrier3 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier3 setVectorUp (surfaceNormal _barrierPos);
_barrier3 setDir 270;

_barrierPos = [(_missionPos select 0) + 6, (_missionPos select 1) + 18];
_barrier4 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier4 setVectorUp (surfaceNormal _barrierPos);

_barrierPos = [(_missionPos select 0) - 6, (_missionPos select 1) + 18];
_barrier5 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier5 setVectorUp (surfaceNormal _barrierPos);

_barrierPos = [(_missionPos select 0) + 10, (_missionPos select 1) - 20];
_barrier6 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier6 setVectorUp (surfaceNormal _barrierPos);

_barrierPos = [(_missionPos select 0) - 45, (_missionPos select 1) -45];
_barrier7 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier7 setVectorUp (surfaceNormal _barrierPos);
_barrier7 setDir 270;

_barrierPos = [(_missionPos select 0) - 45, (_missionPos select 1) -36.5];
_barrier8 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier8 setVectorUp (surfaceNormal _barrierPos);
_barrier8 setDir 270;

_barrierPos = [(_missionPos select 0) - 45, (_missionPos select 1) -28];
_barrier9 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier9 setVectorUp (surfaceNormal _barrierPos);
_barrier9 setDir 270;

_barrierPos = [(_missionPos select 0) - 45, (_missionPos select 1) -19.5];
_barrier10 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier10 setVectorUp (surfaceNormal _barrierPos);
_barrier10 setDir 270;

_barrierPos = [(_missionPos select 0) - 43, (_missionPos select 1) -48];
_barrier11 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier11 setVectorUp (surfaceNormal _barrierPos);
_barrier11 setDir 180;

_barrierPos = [(_missionPos select 0) - 34.5, (_missionPos select 1) -48];
_barrier12 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier12 setVectorUp (surfaceNormal _barrierPos);
_barrier12 setDir 180;

_barrierPos = [(_missionPos select 0) - 26, (_missionPos select 1) -48];
_barrier13 = createVehicle ["Land_HBarrierWall6_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier13 setVectorUp (surfaceNormal _barrierPos);
_barrier13 setDir 180;

_barrierPos = [(_missionPos select 0) +14.5, (_missionPos select 1) -48.5];
_barrier14 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier14 setVectorUp (surfaceNormal _barrierPos);
_barrier14 setDir 180;

_barrierPos = [(_missionPos select 0) +18, (_missionPos select 1) -45];
_barrier15 = createVehicle ["Land_HBarrier_5_F", _barrierPos, [], 0, "CAN_COLLIDE"];
_barrier15 setVectorUp (surfaceNormal _barrierPos);
_barrier15 setDir 90;

// Containers
_containerClass = if (CPG_patrolArea_guerillas == 2) then {
	["Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"] call bis_fnc_selectRandom;
} else {
	"Land_Cargo20_military_green_F";
};

_containerPos1 = [_missionPos, 35, 55, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_container1 = createVehicle [_containerClass, _containerPos1, [], 0, "CAN_COLLIDE"];

// Select another random container class
if (CPG_patrolArea_guerillas == 2) then {
	_containerClass = ["Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"] call bis_fnc_selectRandom;
};

_containerPos2 = [_missionPos, 45, 60, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_container2 = createVehicle [_containerClass, _containerPos2, [], 0, "CAN_COLLIDE"];

// Lamps
_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) - 40, (_missionPos select 1) +0], [], 0, "CAN_COLLIDE"];
_lamp setDir 0;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) - 40, (_missionPos select 1) -40], [], 0, "CAN_COLLIDE"];
_lamp setDir 0;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) + 20, (_missionPos select 1) +0], [], 0, "CAN_COLLIDE"];
_lamp setDir 180;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) + 20, (_missionPos select 1) -40], [], 0, "CAN_COLLIDE"];
_lamp setDir 180;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) - 30, (_missionPos select 1) -47], [], 0, "CAN_COLLIDE"];
_lamp setDir 270;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) + 10, (_missionPos select 1) -47], [], 0, "CAN_COLLIDE"];
_lamp setDir 270;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) - 30, (_missionPos select 1) +22], [], 0, "CAN_COLLIDE"];
_lamp setDir 90;

_lamp = createVehicle ["Land_LampHalogen_F", [(_missionPos select 0) + 10, (_missionPos select 1) +22], [], 0, "CAN_COLLIDE"];
_lamp setDir 90;

// Spawn an APC (MSE-3 Marid or BTR-K Kamysh)
_vehType = ["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F"] call BIS_fnc_selectRandom;
_veh = createVehicle [_vehType, [_missionPos select 0, (_missionPos select 1) - 10], [], 0, "NONE"];
_veh setDir (random 360);
_veh setVehicleLock "LOCKED";

_group_0 = createGroup east;
_ai = _group_0 createUnit ["O_crew_F", [_missionPos select 0, (_missionPos select 1) - 7], [], 0, "NONE"];
_ai moveInDriver _veh;
_ai = _group_0 createUnit ["O_crew_F", [_missionPos select 0, (_missionPos select 1) - 7], [], 0, "NONE"];
_ai moveInTurret [_veh, [0]];
_ai = _group_0 createUnit ["O_crew_F", [_missionPos select 0, (_missionPos select 1) - 7], [], 0, "NONE"];
_ai moveInCommander _veh;
_mrkPatrol = [_missionPos, [1000, 1000]] call CPG_fnc_createPatrolMarker;
[leader _group_0, _mrkPatrol, "nowp", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _group_0);
};

// _helipad = createVehicle ["Land_HelipadSquare_F", [_missionPos select 0, (_missionPos select 1) - 10], [], 0, "CAN_COLLIDE"];

// ---------- START TOWERS ----------
_towerClass = if (CPG_patrolArea_guerillas == 2) then {
	"Land_Cargo_Patrol_V2_F";
} else {
	"Land_Cargo_Patrol_V1_F";
};

if ((random 100) < 50) then	{
	_towerPos = [_missionPos, 25, 50, 10, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 1);

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 0);
	
	// Ai gear
	if (CPG_patrolArea_guerillas == 2) then {
		{
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _x);
		} forEach [_group_0, _group_1];
	};
};

_towerPos = [_missionPos, 50, 100, 10, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

_group_0 = createGroup east;
_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 1);

_group_1 = createGroup east;
_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 0);

// Ai gear
if (CPG_patrolArea_guerillas == 2) then {
	{
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _x);
	} forEach [_group_0, _group_1];
};

if ((random 100) < 50) then	{
	_towerPos = [_missionPos, 50, 100, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 1);

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 0);

	// Ai gear
	if (CPG_patrolArea_guerillas == 2) then {
		{
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _x);
		} forEach [_group_0, _group_1];
	};
};

_towerPos = [_missionPos, 100, 125, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

_group_0 = createGroup east;
_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 1);

_group_1 = createGroup east;
_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 0);

// Ai gear
if (CPG_patrolArea_guerillas == 2) then {
	{
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _x);
	} forEach [_group_0, _group_1];
};

_towerPos = [_missionPos, 125, 150, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

_group_0 = createGroup east;
_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 1);

_group_1 = createGroup east;
_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
_ai setPos (_tower buildingPos 0);

// Ai gear
if (CPG_patrolArea_guerillas == 2) then {
	{
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _x);
	} forEach [_group_0, _group_1];
};

if ((random 100) < 50) then	{
	_towerPos = [_missionPos, 100, 150, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 1);

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 0);

	// Ai gear
	if (CPG_patrolArea_guerillas == 2) then {
		{
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _x);
		} forEach [_group_0, _group_1];
	};
};

if ((random 100) < 50) then	{
	_towerPos = [_missionPos, 200, 275, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
	_tower = createVehicle [_towerClass, _towerPos, [], 0, "CAN_COLLIDE"];

	_group_0 = createGroup east;
	_ai = _group_0 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 1);

	_group_1 = createGroup east;
	_ai = _group_1 createUnit ["O_Soldier_F", _towerPos, [], 0, "CAN_COLLIDE"];
	_ai setPos (_tower buildingPos 0);

	// Ai gear
	if (CPG_patrolArea_guerillas == 2) then {
		{
			{
				_x spawn CEN_fnc_aiGear;
			} forEach (units _x);
		} forEach [_group_0, _group_1];
	};
};
// ----------- END TOWERS -----------

// Ammo boxes
_ammo1 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) -25, (_missionPos select 1) -25], [], 0, "CAN_COLLIDE"];
_ammo1 addEventHandler ["killed", "_this select 1 addScore 3;"];
clearMagazineCargoGlobal _ammo1;
_ammo1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_ammo1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

_ammo2 = createVehicle ["Box_East_AmmoOrd_F", [(_missionPos select 0) + 10, (_missionPos select 1) + 8], [], 0, "CAN_COLLIDE"];
_ammo2 addEventHandler ["killed", "_this select 1 addScore 3;"];
clearMagazineCargoGlobal _ammo2;
_ammo2 addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_ammo2 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

// Cargo houses
_houseClass = if (CPG_patrolArea_guerillas == 2) then {
	"Land_Cargo_House_V2_F";
} else  {
	"Land_Cargo_House_V1_F";
};

_housePos = [_missionPos, 25, 75, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_house = createVehicle [_houseClass, _housePos, [], 0, "CAN_COLLIDE"];

_housePos = [_missionPos, 25, 100, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_house = createVehicle [_houseClass, _housePos, [], 0, "CAN_COLLIDE"];

_housePos = [_missionPos, 25, 100, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_house = createVehicle [_houseClass, _housePos, [], 0, "CAN_COLLIDE"];

// Toilet
_toiletPos = [_missionPos, 25, 50, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_toilet = createVehicle ["Land_FieldToilet_F", _housePos, [], 0, "CAN_COLLIDE"];

// Communication tower
_commsPos = [_missionPos, 25, 50, 15, 0, 5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_comms = createVehicle ["Land_Communication_F", _commsPos, [], 0, "CAN_COLLIDE"];
_comms setVectorUp [0,0,1];

// create group
_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
[leader _grp, _mrkPatrol, "nofollow", "random", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _grp);
};

// create group
_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
[leader _grp, _mrkPatrol, "nofollow", "random", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _grp);
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
_mrkPatrol = [_missionPos, [200, 200]] call CPG_fnc_createPatrolMarker;
[leader _aaGroup, _mrkPatrol, "nofollow", "random", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _aaGroup);
};

// create group
_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
_mrkPatrol = [_missionPos, [250, 250]] call CPG_fnc_createPatrolMarker;
[leader _grp, _mrkPatrol, "reinforcement", "random", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _grp);
};

// create group
_overwatchPos = [_missionPos, 250, 25, 20] call BIS_fnc_findOverwatch;
_grpPos = [_overwatchPos, 0, 15, 2, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
_grp = [_grpPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
_mrkPatrol = [_grpPos, [300, 300]] call CPG_fnc_createPatrolMarker;
[leader _grp, _mrkPatrol, "nofollow", "random", "spawned"] execVM "scripts\UPSMON.sqf";
if (CPG_patrolArea_guerillas == 2) then {
	{
		_x spawn CEN_fnc_aiGear;
	} forEach (units _grp);
};

// --------------------------------------------------

_taskName = format["TaskDSM_Main_%1", CPG_mainMissions_counter];
CPG_taskNames pushBack _taskName;
_taskTitle = "Destroy Main HQ";
_taskDesc = "Enemy forces have set up a major HQ in order to command and organize all their operations on the island. Our objective is to find and destroy this site, thus disrupting the chain of command of the enemy, limiting its effectiveness on the field.<br/><br/>Destroy the Enemy Main HQ.";
_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\MainHQ.jpg'/><br/><br/>";

if (CPG_sideMissions_showMarker == 1) then {
	_mrkPos = [_missionPos, 10, 150, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

	// create a task with destination
	[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

	// create marker
	_mrk = [format ["m_cpg_mainMission%1",CPG_mainMissions_counter], _mrkPos, "o_hq", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
} else {
	// create a task without destination
	[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
};

message = parseText format ["<img image='CombatPatrolGenerator\DSM\pix\MainHQ.jpg' size='6' align='center'/><br/><br/>
<t align='center' size='2'>Objective</t><br/>
<t align='center' size='1.5'>%1</t><br/><br/>
<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>%2", _taskTitle, _taskDesc];

[message,"hintThis"] call BIS_fnc_MP;

waitUntil { sleep 10; (!alive _cargoHq && !alive _cargoTower)};

[_taskName, "succeeded"] call SHK_Taskmaster_upd;

if (CPG_sideMissions_showMarker == 1) then {
	_mrk setMarkerColor "ColorGreen";
	_mrk setMarkerText " Main HQ Destroyed";
};

message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
<t align='center' size='2'>Objective</t><br/>
<t align='center' size='1.5'>%1</t><br/><br/>
<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
The enemy Main HQ is destroyed: now their operations will result much more ineffective, giving us a marked advantage over them.
<br/>Good job everyone.", _taskTitle];

[message,"hintThis"] call BIS_fnc_MP;